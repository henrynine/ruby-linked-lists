class Node
  attr_reader :value
  attr_accessor :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end

end

class LinkedList
  attr_reader :head, :tail

  def initialize(first_node=nil)
    @head = first_node
    @tail = first_node
  end

  def append value
    v_node = Node.new(value)
    if @tail.nil?
      @tail = v_node
      @head = v_node
    else
      @tail.next_node = v_node
      @tail = v_node
    end
  end

  def prepend value
    v_node = Node.new(value, @head)
    @head = v_node
  end

  def size
    return 0 if @head.nil?
    s = 1
    current_node = @head
    while current_node.next_node != nil
      s += 1
      current_node = current_node.next_node
    end
    s
  end

  def at index
    return nil if index > self.size
    current_index = 0
    current_node = @head
    until current_index == index
      current_node = current_node.next_node
      current_index += 1
    end
    current_node
  end

  def pop
    value = @tail.nil? ? nil : @tail.value
    if self.size <= 1
      @head = nil
      @tail = nil
    else
      @tail = self.at(self.size-2)
      @tail.next_node = nil
    end
    value
  end

  def contains? value
    current_node = @head
    until current_node == nil
      return true if current_node.value == value
      current_node = current_node.next_node
    end
    false
  end

  def find value
    current_node = @head
    current_index = 0
    until current_node == nil
      return current_index if current_node.value == value
      current_node = current_node.next_node
      current_index += 1
    end
    nil
  end

  def insert_at(index, value)
    v_node = Node.new(value)
    if index == 0
      v_node.next_node = @head
      @head = v_node
    else
      preceding_node = self.at(index-1)
      succeeding_node = self.at(index)
      preceding_node.next_node = v_node
      v_node.next_node = succeeding_node
    end
  end

  def remove_at(index)
    if index == 0
      @head = @head.next_node
    else
      preceding_node = self.at(index-1)
      succeeding_node = self.at(index+1)
      preceding_node.next_node = succeeding_node
    end
  end

  def to_s
    current_node = @head
    as_string = String.new
    until current_node == nil
      as_string << "(#{current_node.value}) -> "
      current_node = current_node.next_node
    end
    as_string + "nil"
  end

end
