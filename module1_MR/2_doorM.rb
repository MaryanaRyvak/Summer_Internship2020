class Door
  attr_reader :state

  def initialize
    @state = :closed
  end

  def close
    @state = :closed
  end

  def open
    @state = :open
  end

  def closed?
    @state == :closed
  end

  def open?
    @state == :open
  end

  def toggle
    if closed? then open else close end
  end

  def to_s
    @state.to_s
  end
end

# Змінити слід значення наступної змінної

do_zminy = 3599

doors = Array.new(do_zminy) { Door.new }
1.upto(do_zminy) do |multiplier|
  doors.each_with_index do |door, i|
    door.toggle if (i + 1) % multiplier == 0
  end
end

doors.each_with_index { |door, i|
  if door.open?
    puts "Door #{i+1} is #{door}."
  end
}
