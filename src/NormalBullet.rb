require_relative './GraphicsLoader.rb'
require_relative './Bullet.rb'

class NormalBullet < Bullet

  def initialize(start_x, start_y, speed_x, speed_y, bullet_no=0)

    # 親クラスの初期化処理
    super(start_x, start_y)

    @image_y = bullet_no * 13
    @image_width = 13
    @image_height = 13

    @speed_x = speed_x
    @speed_y = speed_y

  end

end
