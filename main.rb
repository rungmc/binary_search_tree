require_relative 'tree'

tree = Tree.new(Array.new(15) { rand(1..100) })
puts tree.pretty_print

puts "Level order: #{tree.level_order}"
puts ""
puts "Inorder: #{tree.inorder}"
puts "Inorder x2: #{tree.inorder { |x| puts x.value *2 }}"
puts ""
puts "Preorder: #{tree.preorder}"
puts ""
puts "Postorder: #{tree.postorder}"
