require_relative './Bullet.rb'

class BombBullet < Bullet
  def initialize(start_x, start_y, speed_x, speed_y, bullet_no=0)

    # 親クラスの初期化処理
    super(start_x, start_y)

    @image_x = 0
    @image_y = 79
    @image_width = 26
    @image_height = 26

    @speed_x = speed_x
    @speed_y = speed_y

    @bullet_no = bullet_no
    @bullets = []
  end

  def collision(collision_x, collision_y, collision_width, collision_height)
    if @bullets.length == 0 then
      return super(collision_x, collision_y, collision_width, collision_height)
    else
      return @bullets[0].collision(collision_x, collision_y, collision_width, collision_height)
    end
  end

  def show()
    if @bullets.length == 0 then
      super()
    else
      @bullets[0].show()
    end
  end

  def calc()
    if @bullets.length == 0 then
      @pos_x += @speed_x
      @pos_y += @speed_y

      if @pos_y > @max_y then
        @pos_y = @max_y

        bullet = DiffusionBullet.new(@pos_x, @pos_y, 190, 40, 5, 5, @bullet_no)
        @bullets.push(bullet)
      end

      @speed_y += 1
    else
      return @bullets[0].calc()
    end

    return false
  end

end
