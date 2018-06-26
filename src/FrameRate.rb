class FrameRate

  attr_accessor :fps

  def initialize
    @fps = 0

    @start_time = Time.now
    @count = 0
    @target_time = get_target_time()
  end

  def get_target_time()
    return @start_time + 1.to_f * (@count + 1) / 60
  end

  def count_frame()
    if Time.now - @start_time >= 1
      @fps = @count + 1
      @start_time = Time.now
      @count = 0
      @target_time = get_target_time()

      return true
    elsif @target_time <= Time.now
      @count += 1
      @target_time = get_target_time()

      return true
    end

    return false
  end

end
