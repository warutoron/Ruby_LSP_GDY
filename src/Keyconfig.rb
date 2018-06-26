require 'dxruby'
require_relative './GraphicsLoader.rb'

class KeyConfig
  def initialize
    @alpha = 255
    @keyConfig = Graphics::KEYCONFIG
  end

  def show
    # 背景を表示
    Window.drawAlpha(0, 0, @keyConfig, @alpha)
  end
end
