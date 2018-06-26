require_relative './GraphicsLoader.rb'

class CharaSelect
  def initialize
    # 画面全体のアルファ値
    @alpha = 255

    # 経過秒カウンター
    @count = 0

    # 4DRIVER討伐フラグ
    @crushFlg = false

    # セレクトキャラクターネーム
    @SelectyCharactorName = nil
    # セレクトキャラクターデータ
    @SelectyCharactorData = nil

    @charaselect = Graphics::CHARASELECT
    @selector = Graphics::CHARASELECTCURSOL

    # キャラクター立ち絵
    @axtlinderTati = Graphics::AXTLINDERTATI
    @nazlTati = Graphics::NAZLTATI
    @purspledTati = Graphics::PURSPLEDTATI
    @sicromTati = Graphics::SICROMTATI
    @unknownTati = Graphics::UNKNOWNTATI
    @victoreaTati = Graphics::VICTOREATATI

    @axtlinderData = Graphics::AXTLINDERDATA
    @nazlData = Graphics::NAZLDATA
    @purspledData = Graphics::PURSPLEDDATA
    @sicromData = Graphics::SICROMDATA
    @unknownData = Graphics::UNKNOWNDATA
    @victoreaData = Graphics::VICTOREADATA

    @charaNo = 1
    # セレクター位置
    @selectorX = -5
    @selectorY = 62

    @charaX = 600
    @charaY = 20

    @charaDataX = -300
    @charaDataY = 300

  end

  def show
    Window.drawAlpha(0, 0, @charaselect, @alpha)
    Window.drawAlpha(@selectorX, @selectorY, @selector, @alpha)

    if @charaNo == 1
      @SelectyCharactorName = @axtlinderTati
      @SelectyCharactorData = @axtlinderData
    elsif @charaNo == 2
      @SelectyCharactorName = @nazlTati
      @SelectyCharactorData = @nazlData
    elsif @charaNo == 3
      @SelectyCharactorName = @purspledTati
      @SelectyCharactorData = @purspledData
    elsif @charaNo == 4
      @SelectyCharactorName = @sicromTati
      @SelectyCharactorData = @sicromData
    elsif @charaNo == 5
      if @crushFlg == true
        @SelectyCharactorName = @victoreaTati
        @SelectyCharactorData = @victoreaData
      else
        @SelectyCharactorName = @unknownTati
        @SelectyCharactorData = @unknownData
      end
        @SelectyCharactorNumber = @charaNo
    end
    Window.drawAlpha(@charaX, @charaY, @SelectyCharactorName, @alpha)
    Window.drawAlpha(@charaDataX, @charaDataY, @SelectyCharactorData, @alpha)

    if @charaDataX <= 20
      @charaDataX += 30
    end

    if @charaX >= 310
      @charaX -= 30
    end

    # 下ボタンを押下した時の処理
    if @selectorY < 217
      if Input.keyPush?( K_DOWN )
        @selectorY += 39
        @charaX = 600
        @charaDataX = -300
        @charaNo += 1
      end
    end

    # 上ボタンを押下した時の処理
    if @selectorY > 62
      if Input.keyPush?( K_UP )
        @selectorY -= 39
        @charaX = 600
        @charaDataX = -300
        @charaNo -= 1
        print @charaNo
      end
    end

    # 決定ボタンを押下した時の処理
    if Input.keyPush?( K_RETURN )
      #TODO:「このDRIVERと戦いますか？」という画面を表示し、「はい」か「いいえ」を選ばせる
      if @charaNo == 5
        if @crushFlg == true
          return 1
        end
      else

        return 1
      end
    end

  def getCharaNo
    return @charaNo
  end

  end
end
