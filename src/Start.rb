require 'dxruby'
require_relative './MakerLogo.rb'
require_relative './Title.rb'
require_relative './CharaSelect.rb'
require_relative './GameController.rb'
require_relative './Charactor.rb'

# 画面のタイトル
Window.caption = "LightsSign! -GunDotYard-"

# 画面のアイコン画像
Window.loadIcon('./ImageFile/Systems/FIcon.ico')

# 画面のサイズ
Window.width = 640
Window.height = 490

@game_controller = GameController.new

# ゲームのメインループ
Window.loop do
  @game_controller.main()
end
