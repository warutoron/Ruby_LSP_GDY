require 'dxruby'
require_relative './GraphicsLoader.rb'
require_relative './DiffusionBullet.rb'
require_relative './BombBullet.rb'

class Axtlinder < Charactor
  def initialize
    super(Graphics::AXTLINDER, 111, 111)

    # 描画開始位置
    @pos_x = 430
    @pos_y = @max_y

    # 移動スピード
    @speed = 8
    @lr_direction = -1

    # ジャンプ力
    @jump_step = 15

    # 無敵時間
    @collision_time = 60

    # アクション
    @action_pattern = [[0], [2, 1], [3, 3, 3, 1], [4]]
    @enemy_actions = [0, 0]
    @now_action = 0
    @now_pattern_count = 0
    @prev_action = 0
    @prev_pattern_count = 0
    @enemy_count = 0

    @random = Random.new

    # 体力
    @hit_point = 90

    # 効果音なし
    @damage_se = nil

  end

  def calc()

    @motion_no = MotionConst::MOTION_STOP

    if @move_permission then
      enemy_action()

      if @prev_pattern_count != @now_pattern_count then
        if @action_pattern[@enemy_actions[@now_action]].length == @now_pattern_count then
          @now_action += 1
        end

        if @prev_action != @now_action then
          if @enemy_actions.length == @now_action then
            @now_action = 0
          end

          @now_pattern_count = 0
          @prev_action = @now_action
        end

        @prev_pattern_count = @now_pattern_count
        @enemy_count = 0
      end

      if @jump_flag then
        @motion_no = MotionConst::AXTLINDER_JUMP
      end
    end

    # 親クラスの計算処理
    super()

  end

  def change_direction()
    @lr_direction *= -1
  end

  def enemy_action()
    case @action_pattern[@enemy_actions[@now_action]][@now_pattern_count]
    when 0 then # wait
      if @enemy_count == 30 then
        @now_pattern_count += 1
        @enemy_actions[1] = @random.rand(1..3)
      end
    when 1 then
      # 向きを変更する
      change_direction()
      @now_pattern_count += 1
    when 2 then # dush attack
      @motion_no = MotionConst::AXTLINDER_WALK
      move_walk(@lr_direction * @speed)
      if (@lr_direction < 0 && @pos_x <= @min_x) || (@lr_direction > 0 && @pos_x >= @max_x) then
        @now_pattern_count += 1
      end

      if @enemy_count % 20 == 0 then
        bullet = DiffusionBullet.new(@pos_x + @image_width / 2, @pos_y + @image_height / 2, 60 + (@lr_direction * 90), 30, 3, 3, 4)
        @bullets.push(bullet)
      end
    when 3 then
      move_walk(@lr_direction * 5)
      if @enemy_count == 0 then
        move_jump(@jump_step)
      elsif !@jump_flag then
        @now_pattern_count += 1
      end
      if @enemy_count == 15 then
        bullet = DiffusionBullet.new(@pos_x + @image_width / 2, @pos_y + @image_height / 2, 0, 45, 5, 8, 4)
        @bullets.push(bullet)
      end
    when 4 then
      @motion_no = MotionConst::AXTLINDER_OVER_DESTROY
      @motion_direction = 0
      if @lr_direction > 0 then
        @motion_direction = 1
      end

      if @enemy_count == 0 then
        bullet = BombBullet.new(@pos_x + @image_width / 2, @pos_y + @image_height / 2, @lr_direction * 5, 0, 4)
        @bullets.push(bullet)
      elsif @enemy_count == 10 then
        bullet = BombBullet.new(@pos_x + @image_width / 2, @pos_y + @image_height / 2, @lr_direction * 5, -10, 4)
        @bullets.push(bullet)
      elsif @enemy_count == 20 then
        bullet = BombBullet.new(@pos_x + @image_width / 2, @pos_y + @image_height / 2, @lr_direction * 5, -20, 4)
        @bullets.push(bullet)
      elsif @enemy_count == 40 then
        @now_pattern_count += 1
      end
    else
    end

    @enemy_count += 1
  end

end
