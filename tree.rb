require_relative 'node'

class Tree
  attr_reader :root

  def initialize(arr)
    @root = build_tree(arr.uniq.sort)
  end

  def build_tree(arr)
    return if arr.empty?

    mid = arr.size / 2
    Node.new(arr[mid], build_tree(arr[0, mid]), build_tree(arr[mid + 1, arr.size]))
  end

  def insert(val, node = @root)
    return if node.value == val

    if val < node.value
      node.left = Node.new(val) if node.left.nil?

      insert(val, node.left)
    else
      node.right = Node.new(val) if node.right.nil?

      insert(val, node.right)
    end
  end

  def delete(val, node = @root)
    return if node.nil?

    if val < node.value
      node.left = delete(val, node.left)
    elsif val > node.value
      node.right = delete(val, node.right)
    else
      return if node.right.nil? && node.left.nil?
      return node.left if node.right.nil?
      return node.right if node.left.nil?

      #Two children?
    end
  end

  def find(val, node = @root)
    return node if node.value == val

    val < node.value ? find(val, node.left) : find(val, node.right)
  end

  def level_order(&block)
  end

  def inorder(&block)
  end

  def preorder(&block)
  end

  def postorder(&block)
  end

  def height(node)
  end

  def depth(node)
  end

  def balanced?
  end

  def rebalance
  end
end
