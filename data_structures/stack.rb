require_relative "linked_list"

class Stack < LinkedList

  def peek
    return self.head
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
      self.tail = new_tail
    end
    popped
  end

  def push(value)
    self.prepend(value)
  end
end
