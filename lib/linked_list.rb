class LinkedList
  attr_reader :head
  
  def initialize
    @head = nil 
  end

  def append(beat)
    if @head == nil 
      @head = Node.new(beat)
    else
      x = @head 
      until x.next_node.nil?
        x = x.next_node
      end
      x.next_node = Node.new(beat)
    end
    beat
  end

  def count
    total   = 0
    current = head
    while current
      total  += 1
      current = current.next_node
    end
    total
  end


  def to_string
    node_data   = []
    current = head
    while current
      node_data << current.data
      current = current.next_node
    end
    node_data.join(' ')
  end

  def prepend(beat)
    new_node           = Node.new(beat)
    new_node.next_node = head
    @head              = new_node
  end

  def insert(index, beat)
    return prepend(beat) if index <= 0 || head.nil?

    new_node = Node.new(beat)
    prev     = head
    current  = head.next_node
    (index - 1).times do
      break unless current
      prev    = current
      current = current.next_node
    end

    prev.next_node     = new_node
    new_node.next_node = current
    beat
  end 

  def find(index, count_returned)
    to_string.split[index, count_returned].to_a.join(" ")
  end

  def pop 
    return nil if head.nil?

    return_value = head.data
    if head.next_node.nil?
      @head = nil
      return return_value
    end

    current = head
    prev    = nil
    until current.next_node.nil?
      prev    = current
      current = current.next_node
    end
    prev.next_node = nil
    current.data
  end

  def includes?(beat)
    current = head
    while current
      return true if current.data == beat
      current = current.next_node
    end
    false
  end
end
