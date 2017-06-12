require_relative "linked_list"

class Queue < LinkedList

  def peek
    return self.head
  end

  def enqueue(value)
    self.prepend(value)
  end

  def dequeue(value)
    return "nil" if self.size == 0
    if self.size == 1
      dequeued = self.head
      self.head = self.tail = nil
    else
      new_head = self.head.next
      dequeued = new_head.previous
      delete_previous(new_head)
    end
    dequeued
  end
end
