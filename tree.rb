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

  def level_order(node = @root, queue = [], result = [], &block)
    block.call(node) if block_given?
    result << node.value unless block_given?

    queue << node.left unless node.left.nil?
    queue << node.right unless node.right.nil?
    return if queue.empty?

    level_order(queue.shift, queue, result, &block)
    result unless block_given?
  end

  def inorder(node = @root, result = [], &block)
    inorder(node.left, result, &block) unless node.left.nil?
    block.call(node) if block_given?
    result << node.value unless block_given?
    inorder(node.right, result, &block) unless node.right.nil?

    result unless block_given?
  end

  def preorder(node = @root, result = [], &block)
    block.call(node) if block_given?
    result << node.value unless block_given?
    preorder(node.left, result, &block) unless node.left.nil?
    preorder(node.right, result, &block) unless node.right.nil?

    result unless block_given?
  end

  def postorder(node = @root, result = [], &block)
    postorder(node.left, result, &block) unless node.left.nil?
    postorder(node.right, result, &block) unless node.right.nil?
    block.call(node) if block_given?
    result << node.value unless block_given?

    result unless block_given?
  end

  def height(node)
  end

  def depth(node)
  end

  def balanced?
  end

  def rebalance
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
