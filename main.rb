require_relative 'tree'

tree = Tree.new(Array.new(15) { rand(1..100) })
puts tree.pretty_print

puts "Level order: #{tree.level_order}"
puts "Inorder: #{tree.inorder}"
puts "Preorder: #{tree.preorder}"
puts "Postorder: #{tree.postorder}"
puts ""
puts "Height of Root: #{tree.height}"
puts "Depth of #{tree.inorder[3]}: #{tree.depth(tree.find(tree.inorder[3]))}"
puts "Depth of #{tree.inorder[5]}: #{tree.depth(tree.find(tree.inorder[5]))}"
puts "Depth of #{tree.inorder[2]}: #{tree.depth(tree.find(tree.inorder[2]))}"
puts ""
puts "Is this tree balanced? #{tree.balanced?}"
tree.insert(110)
tree.insert(113)
tree.insert(121)
puts "Unbalancing tree and checking if balanced... balanced? #{tree.balanced?}"
tree.rebalance
puts "Rebalancing... balanced? #{tree.balanced?}"
