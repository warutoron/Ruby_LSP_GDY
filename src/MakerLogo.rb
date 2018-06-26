require_relative './GraphicsLoader.rb'
require_relative './Title.rb'

# シーン用インターフェース
require_relative './SceneInterface.rb'

class MakerLogo < SceneInterface
  def initialize
    @count = 0
    @makerLogo = Graphics::MAKERLOGO

    @backBoard = Sprite.new(0, 0, @makerLogo)
    @backBoard.alpha = 0
  end

  def calc
    if @count == 200
      return Title.new
    end

    @count += 1
    inputCheck()
    @backBoard.alpha = (@count * 255 / 200).to_int

    return nil
  end

  def show
    Sprite.draw(@backBoard)
  end

  def inputCheck

    if Input.keyPush?( K_RETURN ) then
      if @count < 200 then
        @count = 200
      end
    end

  end

end
