require "pry"
require_relative "tree_node"
require_relative "../algorithms/depth_first_search"

class BST
  include DepthFirstSearch

  # NOTES

  # property_1: node's left sub_tree has values <= node
  # property_2: node's right sub_tree has values >= node
  # property_3: BST === left/right sub_trees

  # nodes on all other levels (plus 1); half of nodes are on last level.

  attr_accessor :root, :size

  def initialize(value)
    self.root = TreeNode.new(value)
    self.size = 1
  end

  def print_node(node)
    node = node.value
    left = node.left.value rescue nil
    right = node.right.value rescue nil

    {
      node: node,
      left: left,
      right: right
    }
  end

  def min
    current = self.root
    until current.left.nil?
      current = current.left
    end
    current.value
  end

  def max
    current = self.root
    until current.right.nil?
      current = current.right
    end
    current.value
  end

  # def height
  #   if self.size == 0
  #     return "Tree is empty"
  #   elsif self.size == 1
  #     return 1
  #   else
  #     root = self.root
  #     left_height = he
  #   end
  # end

  def find(target_value)
    current = self.root
    while current do
      if current.value == target_value
        return current
      elsif current.value > target_value
        current = current.left
      else
        current = current.right
      end
    end
    return nil
  end

  # NOTE: currently does not self balance. Insertions are shuffled
  def insert(new_node)

    if self.root.nil?
      self.root = new_node
      self.size = 1
      return {root: new_node.value, size: self.size}
    end

    current = self.root

    until current.nil?
      if current.value == new_node.value
        return "{value} already present in tree"
      elsif current.value < new_node.value && current.right.nil?
        current.right = new_node
        new_node.parent = current
        self.size += 1
      elsif current.value > new_node.value && current.left.nil?
        current.left = new_node
        new_node.parent = current
        self.size += 1
      elsif current.value < new_node.value
        current = current.right
      elsif current.value > new_node.value
        current = current.left
      end
    end
  end

  def delete(value, root)
  end

  def successor(node)
    # smallest value greater than the value of input node
    # aka next node in Inorder traversal (DFS)
    if node.right
      next_node = node.right
      while next_node.left
        next_node = next_node.left
      end
      return next_node.value
    else
      ancestor = node.parent
      child = node

      while ancestor && ancestor.left == child
        child, ancestor = ancestor, ancestor.parent
      end
      return child.value
    end
  end

end


bst = BST.new(5)
nodes = (1..100).to_a.sample(10).map { |i| TreeNode.new(i) }.shuffle
nodes.each { |n| bst.insert(n) }
pry.run
