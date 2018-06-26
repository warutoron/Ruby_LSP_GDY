require 'dxruby'
require_relative './GraphicsLoader.rb'

# メーカーロゴ
require_relative './Title.rb'

# シーン用インターフェース
require_relative './SceneInterface.rb'

class GameOver < SceneInterface
  def initialize(enemy_number)
    # ゲームオーバー画面
    @backBoard = Sprite.new(0, 0, Graphics::GAMEOVER)
    @cursor = Sprite.new(130, 345, Graphics::SELECT_CURSOR)

    @pointer = 0
    @enemy_number = enemy_number
  end

  def calc()
    if Input.keyPush?( K_LEFT ) then
      if @pointer > 0 then
        @pointer -= 1
      end
    end

    if Input.keyPush?( K_RIGHT ) then
      if @pointer < 1 then
        @pointer += 1
      end
    end

    if Input.keyPush?( K_RETURN ) then
      if @pointer == 1 then
        return Title.new
      else
        return BattleStage.new(@enemy_number)
      end
    end

    @cursor.x = 130 + @pointer * 245

    return nil
  end

  def show
    # 背景を表示
    Sprite.draw(@backBoard)
    Sprite.draw(@cursor)
  end

end
