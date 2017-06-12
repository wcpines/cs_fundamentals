module DepthFirstSearch
  def dfs(target)
    unexplored_stack = []
    unexplored_stack.unshift(self.root)
    until unexplored_stack.empty?
      current = unexplored_stack.shift
      if current.value == target
        return true
      else
        unexplored_stack.unshift(current.right) if current.right
        unexplored_stack.unshift(current.left) if current.left
      end
    end
    false
  end
end
