require 'dxruby'
require_relative './MotionConst.rb'
require_relative './GraphicsLoader.rb'
require_relative './SoundLoader.rb'

class Charactor < Sprite

  attr_accessor :bullets
  attr_accessor :hit_point
  attr_accessor :move_permission

  # コンストラクタ
  def initialize(charactor_image, charactor_width, charactor_height)

    # キャラクターの画像
    @image = charactor_image
    @image_x = 0
    @image_y = 0
    @image_width = charactor_width
    @image_height = charactor_height
    @image_alpha = 255
    @lose_bullet_no = 0

    # キャラクターの座標
    @pos_x = 0
    @pos_y = 0

    # キャラクターのあたり判定
    @collision_width = 30
    @collision_height = 30
    @collision_flag = false
    @collision_time = 120
    @matchless_time = 0

    # ジャンプ
    @jump_start = false
    @jump_flag = false
    @jump_prev_y = 0

    # 移動距離
    @move_x = 0
    @move_y = 0

    # モーション
    @motion_no = 0
    @motion_direction = 0
    @motion_no_temp = 0
    @motion_count = 0

    # 移動領域
    @min_x = Constant::AREA_START_X
    @min_y = Constant::AREA_START_Y
    @max_x = Constant::AREA_WIDTH - @image_width
    @max_y = Constant::AREA_HEIGHT - @image_height

    # 弾配列
    @bullets = []

    # 体力
    @hit_point = 10

    # 行動許可
    @move_permission = false

    # ダメージ音
    @damage_se = Sounds::PLAYERDAMAGE

  end

  def collision(charactor)
    if !@collision_flag then
      enemy_bullets = charactor.bullets
      collision_x = @pos_x + (@image_width / 2) - (@collision_width / 2)
      collision_y = @pos_y + (@image_height / 2) - (@collision_height / 2)

      enemy_bullets.each {|bullet|
        damage = bullet.collision(collision_x, collision_y, @collision_width, @collision_height)
        if damage >= 0 then
          if @damage_se != nil then
            @damage_se.play
          end
          @hit_point -= damage
          @collision_flag = true
          @matchless_time = 0
          break
        end
      }
    end
  end

  # 描画を行う
  def show()

    @bullets.each {|bullet| bullet.show()}

    if !@collision_flag || @matchless_time % 8 > 3 then
      @draw = @image.slice(@image_x, @image_y, @image_width, @image_height)
      Window.drawAlpha(@pos_x, @pos_y, @draw, @image_alpha)
    end

    #if @move_permission then
      # 赤い四角を描画する
      #red_fill = Image.new(@collision_width, @collision_height, [255, 0, 0])
      #collision_x = @pos_x + (@image_width / 2) - (@collision_width / 2)
      #collision_y = @pos_y + (@image_height / 2) - (@collision_height / 2)
      #Window.drawAlpha(collision_x, collision_y, red_fill, 125)
    #end

  end

  # 計算を行う
  def calc()

    # 弾の計算
    del_bullets = []
    @bullets.each { |bullet|
      del_flag = bullet.calc()
      if del_flag then
        del_bullets.push(bullet)
      end
    }
    del_bullets.each {|bullet| @bullets.delete(bullet)}

    # 体力が0なら計算をせずに終了する
    if @hit_point <= 0 then
      @image_alpha = 0
      return
    end

    if @collision_flag then
      @matchless_time += 1
      if @matchless_time >= @collision_time then
        @collision_flag = false
      end
    end

    if @motion_no_temp == @motion_no then
      @motion_no_temp = @motion_no
      @motion_count = 0
    end

    # ジャンプの計算
    if @jump_flag then
      calc_jump()
    elsif @jump_start then
      @jump_flag = true
      @jump_start = false
    end

    # 移動する
    move()

    # 画像のポジション設定
    set_image_position()

    # 移動状態のクリア
    @move_x = 0
    @move_y = 0

  end

  def lose_charactor()
    bullet = DiffusionBullet.new(@pos_x, @pos_y, 0, 10, 20, 36, @lose_bullet_no)
    @bullets.push(bullet)
  end

  def set_image_position()

    @image_x = ((@motion_count / 6) % 6) * @image_width
    @image_y = (@motion_no * 2) * @image_height

    if @move_x > 0 then
      @motion_direction = 1
    elsif @move_x < 0 then
      @motion_direction = 0
    end

    if @motion_direction == 1 then
      @image_y += @image_width
    end
    @motion_count += 1

  end

  # 移動させる実処理
  def move
    @pos_x += @move_x
    @pos_y += @move_y

    if @pos_x < @min_x then
      @pos_x = @min_x
    elsif @pos_x > @max_x then
      @pos_x = @max_x
    end

    if @pos_y < @min_y then
      @pos_y = @min_y
    elsif @pos_y > @max_y then
      @pos_y = @max_y
    end

  end

  # ジャンプ中の処理
  def calc_jump()
    if @pos_y >= @max_y then
      @jump_flag = false
      return
    end

    @move_y = @pos_y - @jump_prev_y + 1
    @jump_prev_y = @pos_y

  end

  # ジャンプ
  def move_jump(step)
    @jump_start = true
    @jump_flag = false
    @move_y = -step
    @jump_prev_y = @pos_y
  end

  # 歩く
  def move_walk(step)
    @move_x = step
  end

  # 走る
  def move_dush(step)
    @move_x = step * 2
  end

end
