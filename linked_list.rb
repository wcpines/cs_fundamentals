class Node

  attr_accessor  :value, :next, :prev

  def initialize(value, next_node=nil, prev_node=nil)
    self.value = value
    self.next = next_node
    self.prev = prev_node
  end
end

class LinkedList

  attr_accessor :head, :tail, :size

  def initialize(value)
    self.head = Node.new(value)
    self.tail = self.head
    self.size = 1
  end

  def as_string
    final = ""
    final += "Empty list" if self.size == 0
    current = self.head
    self.size.times do
      final += " #{current.value} ->"
      current = current.next
    end
    final
  end

  # Add a node to the end of the list
  def append(value)
    new_node = Node.new(value)
    if self.head.nil?
      self.head = self.tail = new_node
      self.size = 1
    else
      set_next_and_prev(self.tail, new_node)
      self.tail = new_node
      self.size += 1
    end
    self.as_string
  end

  # Add a node to the beginning of the list.
  def preprend(value)
    new_node = Node.new(value)
    if self.head.nil?
      self.head = self.tail = new_node
      self.size = 1
    else
      set_next_and_prev(new_node, self.head)
      self.head = new_node
      self.size += 1
    end
    self.as_string
  end

  def contains?(value)
    current = self.head
    self.size.times do
      return True if current.value == value
      current = current.next
    end
    False
  end

  def find(value)
    current = self.head
    self.size.times do
      return current if current.value == value
      current = current.next
    end
    nil
  end

  # traverse list [index] times and return node
  # TODO: intelligently start at beginning or end depending on where the index
  # is relative to the half-way point
  def at(index)
    return "Index out of range" if index > self.size
    node = self.head
    if sign(index) == "+"
      (index).times do
        node = node.next
      end
    elsif sign(index) == "-"
      (index).times do
        node = node.prev
      end
    end
    node
  end

  def pop
    return "nil" if self.size == 0
    if self.size == 1
      popped = self.head
      self.head = self.tail = nil
    else
      new_tail = self.tail.prev
      popped = new_tail.next
      delete_next(new_tail)
    end
    popped # see comment in #delete_at
  end

  # inserts new node behind target node
  def insert_at(node, index)
    target = self.at(index)
    target_prev = target.prev
    set_next_and_prev(target_prev, node)
    set_next_and_prev(node, target)
    self.size += 1
  end

  def delete_at(index)
    return nil if size == 0

    target = self.at(index)
    target_prev = target.prev
    target_next = target.next
    deleted = target
    target = nil
    self.size -= 1
    if self.size == 1
      target_prev.next = target_next.prev = nil
      self.head = self.tail = target.prev
    else
      set_next_and_prev(target_prev, target_next)
    end
    deleted # will this just be stuck in memory? How can I garbage collect deleted nodes *and* return them?
  end

  def reverse
    if self.size == 0
      return nil
    elsif self.size == 1
      return self.head
    else
      current = self.head
      prev = self.tail
      self.head, self.tail = self.tail, self.head
      (self.size).times do
        next_node = current.next
        current.next = prev # heads next becomes tail
        current.prev = next_node
        prev = current      #
        current = next_node
      end
    end
  end

  private

  def set_next_and_prev(first_node, second_node)
    first_node.next = second_node
    second_node.prev = first_node
  end

  def sign(integer)
    if integer == 0
      return "0"
    elsif integer > 0
      return "+"
    else
      return "-"
    end
  end

  def delete_next(node)
    node.next = nil
  end

  def delete_prev(node)
    node.prev = nil
  end
end
