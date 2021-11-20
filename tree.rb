class Tree
  attr_reader :root

  def initialize(arr)
    @root = self.build_tree(arr)
  end

  def build_tree(arr)
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
