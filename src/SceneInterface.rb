class SceneInterface
  def show;end
  def calc;end

  def transition_in
    @transition_time = 0
    @transition_front = Sprite.new(0,0, Image.new(640, 490, [0, 0, 0]))
  end

  def start_transition
    transition_in()
    return true
  end

  def end_transition
    transition_in()
    return true
  end

  def transition_fade_in
    if @transition_time == 100 then
      return true
    end

    @transition_front.alpha = 255 - (@transition_time * 255 / 100)
    @transition_time += 1
    return false
  end

  def transition_fade_out
    if @transition_time == 100 then
      return true
    end

    @transition_front.alpha = @transition_time * 255 / 100
    @transition_time += 1
    return false
  end

  def show_transition
    Sprite.draw(@transition_front)
  end

end
