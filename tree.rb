require_relative 'node'

class Tree
  attr_reader :root

  def initialize(arr)
    @root = build_tree(arr)
  end

  def build_tree(arr)
    return if arr.empty?

    arr = arr.uniq.sort
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
      return node.right if node.left.nil?
      return node.left if node.right.nil?

      #Finds the smallest larger number among children to take its place.
      leftmost = node.right
      leftmost = leftmost.left until leftmost.left.nil?
      node.value = leftmost.value
      node.right = delete(node.value, node.right)
    end
    node
  end

  def find(val, node = @root)
    return if node.nil?
    return node if node.value == val

    val < node.value ? find(val, node.left) : find(val, node.right)
  end

  # List all elements at each level of tree before moving down.
  def level_order(node = @root, queue = [], result = [], &block)
    return if node.nil?

    block.call(node) if block_given?
    result << node.value unless block_given?

    queue << node.left
    queue << node.right
    return if queue.empty?

    level_order(queue.shift, queue, result, &block)
    result unless block_given?
  end

  # Left - Root - Right
  def inorder(node = @root, result = [], &block)
    return if node.nil?

    inorder(node.left, result, &block)
    result << node.value unless block_given?
    inorder(node.right, result, &block)

    result unless block_given?
  end

  # Root - Left - Right
  def preorder(node = @root, result = [], &block)
    return if node.nil?

    block.call(node) if block_given?
    result << node.value unless block_given?
    preorder(node.left, result, &block)
    preorder(node.right, result, &block)

    result unless block_given?
  end

  # Left - Right - Root
  def postorder(node = @root, result = [], &block)
    return if node.nil?

    postorder(node.left, result, &block)
    postorder(node.right, result, &block)
    block.call(node) if block_given?
    result << node.value unless block_given?

    result unless block_given?
  end

  # Distance from node to leaf.
  def height(node = @root, distance = -1)
    return distance if node.nil? || find(node.value).nil?

    left = height(node.left, distance + 1)
    right = height(node.right, distance + 1)
    left > right ? left : right
  end

  # Distance from node to root.
  def depth(node = @root)
    height(@root) - height(node)
  end

  def balanced?(node = @root)
    return true if node.nil?
  end

  # Rebuilds tree from array.
  def rebalance
    @root = build_tree(inorder)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
