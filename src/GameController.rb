# バトルステージ
require_relative './BattleStage.rb'
# メーカーロゴ
require_relative './MakerLogo.rb'
# ゲームオーバー
require_relative './GameOver.rb'
# タイトル
require_relative './Title.rb'
# フレームレート
require_relative './FrameRate.rb'
# 体験版終了画面
require_relative './DemoEndView.rb'

class GameController
  def initialize
    # フレームレート
    @frame_rate = FrameRate.new

    # 各シーン毎のクラス
    # @scene = BattleStage.new(1)
    @scene = MakerLogo.new
    # @scene = GameOver.new(1)
    # @scene = Title.new
    # @scene = DemoEndView.new

    @next_scene = nil

    @transition = nil

    @clear_rect = Sprite.new(0, 0, Image.new(640, 490, [0, 0, 0]))

    #TODO:他クラス作成
    # @keySetting = KeySetting.new
    # @staffCredit = StaffCredit.new
    # @sequel = Sequel.new
  end

  def main()
    Sprite.draw(@clear_rect)
    if @next_scene != nil then
      if @transition == nil then
        @transition = @scene.transition_in
      end
      if @transition then
        transition_end = @scene.transition_fade_out()
        if !transition_end then
          @scene.show()
          @scene.show_transition();
          return
        end
      end
      @transition = nil
      @scene = @next_scene
    end

    if @frame_rate.count_frame then
      @next_scene = @scene.calc()
    end
    @scene.show()
  end

end
