class TreeNode

  attr_accessor :value, :priority, :right, :left, :parent

  def initialize(value, priority=0)
    self.value = value
    self.priority = priority # if creating priortiy queue
    self.right = nil
    self.left = nil
    self.parent = nil
  end

  def is_leaf?
    self.right.nil? && self.left.nil? && self.parent
  end

end
