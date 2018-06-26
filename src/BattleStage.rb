require 'dxruby'
require_relative './GraphicsLoader.rb'
require_relative './Stride.rb'
require_relative './StrideData.rb'
require_relative './TalkBoard.rb'
require_relative './Constant.rb'
require_relative './Attention.rb'
require_relative './Axtlinder.rb'

# シーン用インターフェース
require_relative './SceneInterface.rb'
require_relative './DemoEndView.rb'

class BattleStage < SceneInterface
  def initialize(enemy_number)
    # 画面全体のアルファ値
    @alpha = 255

    # 勝利後
    @battleState = 0

    # 体力
    @firstPosition = 12

    # 残機の横表示位置
    @sliceRestX = 0

    # フェードアウト変数
    @count = 0

    # 背景変数
    @backBoard =nil

    # プレイヤーキャラクター
    @stride = Stride.new
    # 敵キャラクター
    @enemy = Axtlinder.new
    # @nazl = Nazl.new
    # @parspled = Parspled.new
    # @sicrom = Sicrom.new
    # @victorea = Victorea.new

    # キャラクターデータ画面
    @strideData = StrideData.new

    # HPゲージ・Sゲージ
    @enelgyGage = Graphics::ENERGYGAGE
    @strideGage = Graphics::STRIDEGAGE
    @hpImage = Graphics::HP

    # 残機
    @rest = Graphics::REST

    # ステージごとに背景を設定
    @backBoard = nil
    case enemy_number
    when 1 then
      @backBoard = Graphics::STAGE1
    when 2 then
      @backBoard = Graphics::STAGE2
    when 3 then
      @backBoard = Graphics::STAGE3
    when 4 then
      @backBoard = Graphics::STAGE4
    else
      @backBoard = Graphics::STAGE5
    end
    @backBoard = Sprite.new(0, 0, @backBoard)
    @enemy_number = enemy_number

    # 会話画面
    @start_talkBoard = TalkBoard.new(@enemyNumber, 0)
    @end_talkBoard = nil

    # アテンションエフェクト
    @attention = nil
  end

  def calc()
    @stride.calc()
    @enemy.calc()

    if @start_talkBoard != nil then
      talk_end = @start_talkBoard.calc()
      if talk_end then
        @start_talkBoard = nil
        @attention = Attention.new
        @stride.move_permission = true
        @enemy.move_permission = true
      else
        return nil
      end
    elsif @end_talkBoard != nil then
      talk_end = @end_talkBoard.calc()
      if talk_end then
        @end_talkBoard = nil
        return DemoEndView.new
      else
        return nil
      end
    end

    if @attention != nil then
      @attention.calc()
    end

    @stride.collision(@enemy)
    @enemy.collision(@stride)

    if @stride.hit_point <= 0 then
      @stride.lose_charactor()
      @stride.move_permission = false
      return GameOver.new(@enemy_number)
    end

    if @enemy.hit_point <= 0 then
      @end_talkBoard = TalkBoard.new(@enemyNumber, 1)
      @stride.move_permission = false
      @enemy.move_permission = false
      @enemy.hit_point = 1
    end

    return nil
  end

  def transition_fade_out
    if @attention != nil then
      @attention.calc()
    end

    @stride.calc()
    @enemy.calc()

    super()
  end

  def show
    # 背景を表示
    Sprite.draw(@backBoard)

    # 敵キャラクターの描画
    @enemy.show()

    # プレイヤーキャラクターの描画
    @stride.show()

    if @start_talkBoard != nil then
      # 会話を再生
      @start_talkBoard.show()
    elsif @end_talkBoard != nil then
      # 会話を再生
      @end_talkBoard.show()
    else
      # 体力ゲージを表示
      Window.drawAlpha(0, 0, @enelgyGage, @alpha)
      # ストライドゲージを表示
      Window.drawAlpha(0, 45, @strideGage, @alpha)
      # 残機を表示
      sliceRest = @rest.slice(@sliceRestX, 40, 60, 43)
      Window.drawAlpha(237, 0, sliceRest, @alpha)
      # 体力ポイントを表示
      for i in 1..@stride.hit_point do
        # HP描画
        Window.drawAlpha(@firstPosition + 5 * i, 10, @hpImage, @alpha)
      end
    end

    if @attention != nil then
      # 戦闘前に「ATTENTION」画面を入れる
      @attention.show
    end

  end

end
