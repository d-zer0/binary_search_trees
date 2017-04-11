class Node
	attr_accessor :value, :parent, :left_child, :right_child

	def initialize(value)
		@value = value
		@left_child = nil
		@right_child = nil
		@parent = nil
	end
end

class Tree

	def build_tree(array)
		root = Node.new(array[0])
		pos = root
		array[1..-1].each do |node|
			node = Node.new(node)
			until node.parent != nil
				if node.value < pos.value
					until (node.value < pos.parent.value) || node.parent.nil?
						pos = pos.parent
					end
					if pos.left_child.nil?
						pos.left_child = node
						node.parent = pos
					else
						pos = pos.left_child
					end
				else
					if pos.parent != nil
						until node.value > pos.parent.value || node.parent.nil?
							pos = pos.parent
						end
					end
					if pos.right_child.nil?
						pos.right_child = node
						node.parent = pos
					else
						pos = pos.right_child
					end
				end
			end
			puts
			puts "Node value: " + node.value.to_s
			puts
		end
	end

end

array = [18, 27, 36, 100, 20, 99, 5, 1, 44, 78]
tree = Tree.new
tree.build_tree(array)