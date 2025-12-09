class BeatBox
  attr_reader :list, :valid_beats
  attr_accessor :rate, :voice

  DEFAULT_BEATS = %w[tee dee deep dop doo ditt woo hoo shu bop boop la na].freeze

  def initialize(beats = nil)
    @list        = LinkedList.new
    @valid_beats = DEFAULT_BEATS.dup
    @rate        = 500
    @voice       = "Boing"
    append(beats.to_s) if beats
  end

  def add_valid_beat(beats)
    @valid_beats ||= []
    beats.to_s.split.each do |s|
      @valid_beats << s unless @valid_beats.include?(s)
    end
  end

  def append(beats)
    beats.split.each { |b| @list.append(b) if valid?(b) }
  end

  def prepend(beats)
    beats.split.reverse_each { |b| @list.prepend(b) if valid?(b) }
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

  def reset_rate
    @rate = 500
  end

  def reset_voice
    @voice = "Boing"
  end

  def valid?(beats)
    return true unless @valid_beats
    @valid_beats.include?(beats)
  end
end
