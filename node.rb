class Node

  attr_accessor  :value, :next, :prev

  def initialize(value, next_node=nil, prev_node=nil)
    self.value = value
    self.next = next_node
    self.prev = prev_node
  end
end
