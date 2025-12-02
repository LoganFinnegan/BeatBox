class LinkedList
  attr_reader :head
  
  def initialize
    @head = nil 
  end

  def append(string)
    if @head == nil 
      @head = Node.new(string)
    else
      x = @head 
      until x.next_node.nil?
        x = x.next_node
      end
      x.next_node = Node.new(string)
    end
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
    parts   = []
    current = head
    while current
      parts << current.data
      current = current.next_node
    end
    parts.join(' ')
  end

  def prepend(string)
    x           = Node.new(string)
    x.next_node = head
    @head       = x
  end

  def insert(index, string)
    return prepend(string) if index <= 0 || head.nil?

    new_node = Node.new(string)
    prev     = head
    current  = head.next_node
    pos      = 1

    while current && pos < index
      prev    = current
      current = current.next_node
      pos    += 1
    end

    prev.next_node     = new_node
    new_node.next_node = current
  end 

  def find(index, elements)
    current = head
    pos     = 0

    while current && pos < index
      pos    += 1
      current =  current.next_node 
    end

    string = []
    while current && string.size < elements
      string << current.data
      current = current.next_node
    end
    string.join(" ")
  end

  def pop 
    current = head
    prev    = nil
    until current.next_node == nil
      prev    = current
      current = current.next_node
    end
    prev.next_node = nil
    current.data
  end
end
