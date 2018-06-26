module Graphics

  # メーカロゴシーン
  MAKERLOGO = Image.load('./ImageFile/Scenes/MakerLogo.png')
  # タイトル
  TITLE = Image.load('./ImageFile/Scenes/Title.png')
  # キャラセレクト
  CHARASELECT = Image.load('./ImageFile/Scenes/CharactorSelect.png')
  # ATTENTION画像
  ATTENTION = Image.load('./ImageFile/Scenes/Attention.png')
  # GAMEOVER画面
  GAMEOVER = Image.load('./ImageFile/Scenes/GameOver.png')
  # RESULT画像
  RESULT = Image.load('./ImageFile/Scenes/Results.png')
  # キャラクターの表情ファイル
  CHARACTORFACE = Image.load('./ImageFile/Systems/CharactorFace.png')
  # キャラクターデータ画面
  STRIDEDATA = Image.load('./ImageFile/Systems/GunDotyard-fuyumisstatus.png')
  # トークボード
  TALKBOARD = Image.load('./ImageFile/Systems/GunDotyard-TalkBoard.png')
  # エネルギーゲージ
  ENERGYGAGE = Image.load('./ImageFile/Systems/Icons.png', x=0, y=0, width=240, height=43)
  # STRIDEゲージ
  STRIDEGAGE = Image.load('./ImageFile/Systems/Icons.png', x=0, y=410, width=200, height=43)
  # HPポイント
  HP = Image.load('./ImageFile/Systems/Icons.png', x=0, y=273, width=10, height=24)
  # データHPポイント
  DATAHP = Image.load('./ImageFile/Systems/Icons.png', x=0, y=297, width=20, height=33)
  # メインウェポン
  MAINWEAPON = Image.load('./ImageFile/Systems/Icons.png', x=0, y=179, width=45, height=45)
  # サブウェポン
  SUBWEAPON = Image.load('./ImageFile/Systems/Icons.png', x=0, y=179, width=60, height=45)
  # ウェポンセレクター
  WEAPONSELECTOR = Image.load('./ImageFile/Systems/Icons.png', x=0, y=225, width=70, height=48)
  # 残機
  REST = Image.load('./ImageFile/Systems/Icons.png')
  # 弾丸
  BULLETS = Image.load('./ImageFile/Effects/Bulletss.png')

  # システム素材
  STARTBUTTON = Image.load('./ImageFile/Systems/Icons.png', x=0, y=373, width=118, height=36)
  MISSIONBUTTON = Image.load('./ImageFile/Systems/Icons.png', x=118, y=373, width=118, height=36)
  OPTIONBUTTON = Image.load('./ImageFile/Systems/Icons.png', x=236, y=373, width=118, height=36)
  CHARASELECTCURSOL = Image.load('./ImageFile/Systems/Icons.png', x=0, y=330, width=200, height=43)
  SELECT_CURSOR = Image.load('./ImageFile/Systems/Icons.png', x=0, y=437, width=138, height=93)

  # TODO:新しいボタンについて
  BUTTONTYPE = Image.load('./ImageFile/Systems/MissionState.png')

  #キャラクター立ち絵
  AXTLINDERTATI = Image.load('./ImageFile/Charactors/charadummy.png')
  NAZLTATI = Image.load('./ImageFile/Charactors/charadummy2.png')
  PURSPLEDTATI = Image.load('./ImageFile/Charactors/charadummy3.png')
  SICROMTATI = Image.load('./ImageFile/Charactors/charadummy4.png')
  VICTOREATATI = Image.load('./ImageFile/Charactors/charadummy5.png')
  UNKNOWNTATI = Image.load('./ImageFile/Charactors/charadummy5.png')

  # キャラクター説明画像
  AXTLINDERDATA = Image.load('./ImageFile/Charactors/CharaData.png', x=2, y=2, width=226, height=163)
  NAZLDATA = Image.load('./ImageFile/Charactors/CharaData.png', x=232, y=2, width=226, height=163)
  PURSPLEDDATA = Image.load('./ImageFile/Charactors/CharaData.png', x=2, y=168, width=226, height=163)
  SICROMDATA = Image.load('./ImageFile/Charactors/CharaData.png', x=100, y=2, width=226, height=163)
  VICTOREADATA = Image.load('./ImageFile/Charactors/CharaData.png', x=0, y=0, width=226, height=163)
  UNKNOWNDATA = Image.load('./ImageFile/Charactors/CharaData.png', x=0, y=0, width=226, height=163)

  # ステージ
  STAGE1 = Image.load('./ImageFile/Stages/Stage1.png')
  STAGE2 = Image.load('./ImageFile/Stages/Stage2.png')
  STAGE3 = Image.load('./ImageFile/Stages/Stage3.png')
  STAGE4 = Image.load('./ImageFile/Stages/Stage4.png')
  STAGE5 = Image.load('./ImageFile/Stages/Stage5.png')

  # 体験版用
  DEMO_END = Image.load('./ImageFile/Scenes/TFP.png');

  # キャラクタードット絵
  STRIDE = Image.load('./ImageFile/Charactors/Stride.png')
  AXTLINDER = Image.load('./ImageFile/Charactors/Axtlinder.png')
  #NAZL = Image.load('./ImageFile/Charactors/Nazl.png')
  #PARSPLED = Image.load('./ImageFile/Charactors/Parspled.png')
  #SICROM = Image.load('./ImageFile/Charactors/Sicrom.png')
  #VICTOREA = Image.load('./ImageFile/Charactors/Victorea.png')
end
