require 'dxruby'
require_relative './GraphicsLoader.rb'
require_relative './SoundLoader.rb'

# シーン用インターフェース
require_relative './SceneInterface.rb'

class Attention < SceneInterface

  def initialize
    # 背景画面のアルファ値
    @alpha = 255
    # エフェクト用のタイマー
    @timeCount = 0
    # 画面の移動フラグ
    @goOutFlag = true
    # 画像読み込み
    @attention = Graphics::ATTENTION
    # 描画位置の設定
    @drawX = 640

    Sounds::ALERT.play
  end

  def calc()
    if @goOutFlag == true
      if @drawX > -640
        @drawX -= 9
      else
        return false
      end
    end

    # タイムカウントを＋１
    @timeCount += 1

    return true
  end

  def show
    # 画面を描画
    Window.drawAlpha(@drawX, 0, @attention, @alpha)
  end

end
