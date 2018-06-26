require_relative './GraphicsLoader.rb'
require_relative './Title.rb'

# シーン用インターフェース
require_relative './SceneInterface.rb'

class DemoEndView < SceneInterface
  def initialize
    @backBoard = Sprite.new(0, 0, Graphics::DEMO_END);
  end

  def show
    Sprite.draw(@backBoard);
  end

  def calc
    if Input.keyPush?( K_RETURN ) then
      return Title.new
    end
  end

end
