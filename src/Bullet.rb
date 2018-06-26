require_relative './GraphicsLoader.rb'
require_relative './Constant.rb'

class Bullet
  def initialize(start_x, start_y)

    # 画像
    @image = Graphics::BULLETS
    @image_x = 0
    @image_y = 0
    @image_width = 13
    @image_height = 13
    @alpha = 255

    # 描画エリア
    @min_x = Constant::AREA_START_X - @image_width
    @min_y = Constant::AREA_START_Y - @image_height
    @max_x = Constant::AREA_WIDTH
    @max_y = Constant::AREA_HEIGHT

    # 表示座標
    @pos_x = start_x
    @pos_y = start_y

    # スピード
    @speed_x = 0
    @speed_y = 0

    # ダメージ
    @collision_flag = false
    @damage = 3

  end

  def collision(collision_x, collision_y, collision_width, collision_height)
    collision_x2 = collision_x + collision_width
    collision_y2 = collision_y + collision_height
    pos_x2 = @pos_x + @image_width
    pos_y2 = @pos_y + @image_height
    if collision_x <= pos_x2 && collision_x2 >= @pos_x then
      if collision_y <= pos_y2 && collision_y2 >= @pos_y then
        @collision_flag = true
        return @damage
      end
    end

    return -1
  end

  def show()
    draw_image = @image.slice(@image_x, @image_y, @image_width, @image_height)
    Window.drawAlpha(@pos_x, @pos_y, draw_image, @alpha)
  end

  def calc()
    if @collision_flag then
      return true
    end

    @pos_x += @speed_x
    @pos_y += @speed_y

    if @pos_x < @min_x || @pos_x > @max_x ||
       @pos_y < @min_y || @pos_y > @max_y then
      return true
    end

    return false
  end

end
