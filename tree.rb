class Tree
  attr_reader :root

  def initialize(arr)
    @root = build_tree(arr.uniq.sort)
  end

  def build_tree(arr)
    return nil if arr.empty?

    mid = arr.size / 2
    @root = Node.new(arr[mid], build_tree(arr[0, mid]), build_tree(arr[mid + 1, arr.size]))
  end

  def insert(val)
  end

  def delete(val)
  end

  def find(val)
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
