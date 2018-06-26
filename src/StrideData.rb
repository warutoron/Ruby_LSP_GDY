require 'dxruby'
require_relative './GraphicsLoader.rb'

class StrideData
  def initialize
    @alpha = 255
    @strideData = Graphics::STRIDEDATA
    @dataHpImage = Graphics::DATAHP
    @mainWeapon = Graphics::MAINWEAPON
    @subWeapon = Graphics::SUBWEAPON
    @weaponSelector = Graphics::WEAPONSELECTOR

    # 体力
    @hpImage = Graphics::HP
    @firstPosition = 287
    @hp = 40
    @hpLastPoint = 0

  end

  def show
    Window.drawAlpha(0, 0, @strideData, @alpha)
    # 体力
    for @hpLastPoint in 1..@hp do
      Window.drawAlpha(@firstPosition + 8 * @hpLastPoint, 179, @dataHpImage, @alpha)
    end

    # メインウェポン
    Window.drawAlpha(276, 235, @mainWeapon, @alpha)
    # サブウェポン
    Window.drawAlpha(248, 301, @mainWeapon, @alpha)
    # ウェポンセレクター
    Window.drawAlpha(274, 235, @weaponSelector, @alpha)
    # ウェポンセレクター
    Window.drawAlpha(246, 301, @weaponSelector, @alpha)
  end
end
