require_relative './Charactor.rb'
require_relative './NormalBullet.rb'
require_relative './GraphicsLoader.rb'

# 曲読み込み
require_relative './SoundLoader.rb'

class Stride < Charactor

  def initialize
    super(Graphics::STRIDE, 111, 111)
    @pos_x = 80
    @pos_y = @max_y

    # 移動スピード
    @speed = 8

    # ジャンプ力
    @jump_step = 15

    # ショット中
    @shot_flag = false
    @shot_time = 0

    # 体力
    @hit_point = 40

    # 初期向き
    @motion_direction = 1

  end

  def calc()

    @motion_no = MotionConst::MOTION_STOP

    if @move_permission then
      # 入力チェック
      inputCheck()

      # モーションチェック
      motion_check()
    end

    # 親クラスの計算処理
    super()

  end

  def motion_check()
    if @jump_flag then
      if @move_x == 0 then
        if @shot_flag then
          @motion_no = MotionConst::STRIDE_JUMP_SHOT
        else
          @motion_no = MotionConst::STRIDE_JUMP
        end
      else
        @motion_no = MotionConst::STRIDE_DUSH_JUMP
      end
    elsif @shot_flag then
      if @move_x == 0 then
        @motion_no = MotionConst::STRIDE_SHOT
      else
        @motion_no = MotionConst::STRIDE_DUSH_SHOT
      end
    elsif @move_x == 0 then
      @motion_no = MotionConst::MOTION_STOP
    else
      @motion_no = MotionConst::STRIDE_WALK
    end
  end

  def inputCheck()

    if Input.keyDown?( K_LEFT ) then
      move_walk(-@speed)
    elsif Input.keyDown?( K_RIGHT ) then
      move_walk(@speed)
    end

    if Input.keyDown?( K_F ) then
      if @shot_time == 0 then
        shot_normal()
      end

      @shot_time = (@shot_time + 1) % 10
    else
      @shot_flag = false
      @shot_time = 0
    end

    if Input.keyPush?( K_SPACE ) then
      move_jump(@jump_step)
    end

  end

  def shot_normal()
    @shot_flag = true

    shot_x = @pos_x + @image_width
    shot_y = @pos_y + (@image_height / 2) - 15
    speed_x = 10

    if @motion_direction == 0 then
      shot_x = @pos_x
      speed_x = -speed_x
    end

    bullet = NormalBullet.new(shot_x, shot_y, speed_x, 0)
    @bullets.push(bullet)

    Sounds::PLAYERFIRE.play

  end

end
