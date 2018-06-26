require_relative './Bullet.rb'

class DiffusionBullet < Bullet
  def initialize(start_x, start_y, start_angle, one_angle, speed, shot_num, bullet_no=0)
    @bullets = []

    # 親クラスの初期化処理
    super(start_x, start_y)

    for i in 0..(shot_num - 1) do
      angle = start_angle + (i * one_angle)

      # ラジアンに変換
      rad = ( angle * Math::PI / 180.0 )

      # スピードの計算
      speed_x = Math.cos(rad) * speed;
      speed_y = Math.sin(rad) * speed;

      bullet = NormalBullet.new(start_x, start_y, speed_x, speed_y, bullet_no)
      @bullets.push(bullet)
    end
  end

  def collision(collision_x, collision_y, collision_width, collision_height)
    damage = -1
    @bullets.each{|bullet|
      damage = bullet.collision(collision_x, collision_y, collision_width, collision_height)
      if damage >= 0 then
        break
      end
    }
    return damage
  end

  def show()
    @bullets.each {|bullet| bullet.show()}
  end

  def calc()
    delete_bullets = []
    @bullets.each {|bullet|
      delete_flag = bullet.calc()
      if delete_flag then
        delete_bullets.push(bullet)
      end
    }
    delete_bullets.each {|bullet| @bullets.delete(bullet)}

    if @bullets.length == 0 then
      return true
    end

    return false
  end
end
