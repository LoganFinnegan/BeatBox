class BeatBox
  attr_reader :list
  
  def initialize
    @list        = LinkedList.new
    @valid_beats = nil
    @rate        = 500
    @voice       = "Boing"
  end

  def add_valid_beat(string)
    @valid_beats ||= []
    string.to_s.split.each do |s|
      @valid_beats << s unless @valid_beats.include?(s)
    end
  end

  def append(string)
    arr = string.split
    arr.each do |a|
      next unless valid?(a)
      @list.append(a)
    end
  end

  def prepend(string)
    arr = string.split
    arr.reverse_each do |a|
      next unless valid?(a)
      @list.prepend(a)
    end
  end

  def count
    @list.count
  end

  def play
    `say -r #{@rate} -v #{@voice} #{@list.to_string}`
  end

  def all
    @list.to_string
  end

  def rate(num)
    @rate = num
  end

  def reset_rate
    @rate = 500
  end

  def voice(string)
    @voice = string
  end

  def reset_voice
    @voice = "Boing"
  end

  private 

  def valid?(string)
    return true unless @valid_beats
    @valid_beats.include?(string)
  end
end
