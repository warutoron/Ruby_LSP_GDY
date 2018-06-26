#! ruby -EUTF-8
# -*- mode:ruby; coding:utf-8 -*-

require 'dxruby'
require_relative './TextLoader.rb'
require_relative './GraphicsLoader.rb'

# シーン用インターフェース
require_relative './SceneInterface.rb'

class TalkBoard < SceneInterface

  def initialize(charactor, status)
    @alpha = 255
    # 会話用の枠
    @talkBoard = Graphics::TALKBOARD
    # キャラクターの顔
    @charactorFace = Graphics::CHARACTORFACE

    @graphics = GraphicsLoader.new
    @font = Font.new(16)

    # キャラクター名一覧
    @arrayCharactorName = @graphics.CharactorNameLoader

    # 会話ファイル読み込み
    @talkText = @graphics.TextCreator(charactor, status)
    @nowLine = 0

    # 表示用
    @face = nil
    @talk = nil
    @name = nil

    # 会話をセットする
    set_talk_bord()

  end

  def calc()
    if Input.keyPush?( K_RETURN ) then
      @nowLine += 1
      if @nowLine < @talkText.length then
        set_talk_bord()
      else
        return true
      end
    end

    if Input.keyPush?( K_S ) then
      return true
    end

    return false
  end

  def set_talk_bord()
    # キャラクター名
    charactor_number = @talkText[@nowLine][0].to_i
    charactor_expression = @talkText[@nowLine][1].to_i
    @talk = @talkText[@nowLine][2]
    @name = get_charactor_name(charactor_number)
    @face = get_expression(charactor_number, charactor_expression)
  end

  def get_charactor_name(charactor_number)
    return @arrayCharactorName[charactor_number][0]
  end

  def get_expression(charactor_number, expression)
    return @charactorFace.slice(expression * 132, charactor_number * 132, 132, 132)
  end

  def show()
    # キャラクター表情
    Window.drawAlpha(11, 10, @face, @alpha)
    # 会話用枠
    Window.drawAlpha(5, 5, @talkBoard, @alpha)
    # キャラクター名
    Window.draw_font(175, 25, @name, @font, hash={:color=>[0,255,255]})
    ## セリフ
    Window.draw_font(175, 50, @talk, @font, hash={:color=>[255,255,255]})
  end

end
