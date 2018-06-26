module Sounds
  # アラート
  ALERT = Sound.new("/SoundFile/SystemSound/Alert.wav")
  ALERT.loopCount = 2
  # 決定音(一回だけ)
  #DECISION = Sound.new("/SoundFile/SystemSound/awx.wav")
  # 選択音(一回だけ)
  #CHOOSE = Sound.new("/SoundFile/SystemSound/awx.wav")
  # タイトルBGM
  #TITLEBGM = Sound.new("/SoundFile/SystemSound/awx.wav")
  # キャラクターセレクトBGM
  #CHARASELEBGM = Sound.new("/SoundFile/SystemSound/awx.wav")
  # 会敵中BGM
  #ENCOUNTERBGM = Sound.new("/SoundFile/SystemSound/awx.wav")
  # 勝利後BGM
  #WINBGM = Sound.new("/SoundFile/SystemSound/awx.wav")
  # 後日談BGM
  #SEQUELBGM = Sound.new("/SoundFile/SystemSound/awx.wav")
  # ゲームオーバーBGM
  #GAMEOVERBGM = Sound.new("/SoundFile/SystemSound/awx.wav")
  # 各キャラクターのステージ音楽
  #QD = Sound.new("/SoundFile/SystemSound/awx.wav")
  #WIS = Sound.new("/SoundFile/SystemSound/awx.wav")
  #EV = Sound.new("/SoundFile/SystemSound/awx.wav")
  #RF = Sound.new("/SoundFile/SystemSound/awx.wav")
  #TV = Sound.new("/SoundFile/SystemSound/awx.wav")
  # 発射音(相手)
  #ENEMYFIRE = Sound.new("/SoundFile/SystemSound/awx.wav")
  # 発射音(自分)
  PLAYERFIRE = Sound.new("/SoundFile/SystemSound/PlayerShoot.wav")
  # ダメージ(自分)
  PLAYERDAMAGE = Sound.new("/SoundFile/SystemSound/PlayerDamage.wav")
  # ダメージ(相手)
  #ENEMYDAMAGE = Sound.new("/SoundFile/SystemSound/awx.wav")
  # 末期爆発(相手・自分)
  #LASTDAMAGE = Sound.new("/SoundFile/SystemSound/awx.wav")

end
