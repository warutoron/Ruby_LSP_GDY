require 'dxruby'
require_relative './GraphicsLoader.rb'

# シーン用インターフェース
require_relative './SceneInterface.rb'

class Title < SceneInterface
  def initialize
    @timeCount = 0
    # 背景画面のアルファ値
    @alpha = 0
    @buttonCount = 0
    @menuCount = 0

    # 各ボタン初期位置
    @missionButtonPoint = 180
    @optionButtonPoint = 180


    # 各ボタン色アルファ値
    @missionButtonAlpha = 255
    @optionButtonAlpha = 255

    # 各画像読み込み
    @backBoard = Sprite.new(0, 0, Graphics::TITLE)
    #@startButton = Graphics::STARTBUTTON
    @startbutton = Sprite.new(180, 380, Graphics::BUTTONTYPE.slice(2, 2, 258, 49))
    @missionButton = Sprite.new(170, 350, Graphics::BUTTONTYPE.slice(2, 53, 258, 49))
    @optionButton = Sprite.new(180, 400, Graphics::BUTTONTYPE.slice(2, 104, 258, 49))
    @optionButton.alpha = 100
    #@missionButton = Graphics::MISSIONBUTTON
    #@optionButton = Graphics::OPTIONBUTTON
    # TODO:新しいボタン
    @buttons = Graphics::BUTTONTYPE

    @count = 0
    # フェードイン時のButtonフラグ
    @button_flag = false

    # メニューを表示するかどうか
    @show_menu_flag = false

    @menu_pointer = 0

  end

  def calc
    if !@button_flag then
      if @count == 50 then
        @button_flag = true
      end

      if @count <= 50 then
        # フェードイン処理
        @backBoard.alpha = @count * 255 / 50
      end
    end

    @count += 1

    return input_check()
  end

  def input_check
    if @show_menu_flag then
      if Input.keyPush?( K_UP )
        @missionButton.x = 170
        @missionButton.alpha = 255
        @optionButton.x = 180
        @optionButton.alpha = 100
        @menu_pointer = 0
      elsif Input.keyPush?( K_DOWN )
        @missionButton.x = 180
        @missionButton.alpha = 100
        @optionButton.x = 170
        @optionButton.alpha = 255
        @menu_pointer = 1
      end
      if Input.keyPush?( K_RETURN )
        if @menu_pointer == 0 then
          return BattleStage.new(1)
        end
      end
    elsif @button_flag then
      if Input.keyDown?( K_RETURN )
        @show_menu_flag = true
      end
    end

    return nil
  end

  def show
    # タイトルを描画
    Sprite.draw(@backBoard)

    if @show_menu_flag then
      Sprite.draw(@missionButton)
      Sprite.draw(@optionButton)
    elsif @button_flag then
      Sprite.draw(@startbutton)
    end

  end
end
