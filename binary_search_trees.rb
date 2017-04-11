class Node
	attr_accessor :value, :parent, :left_child, :right_child

	def initialize(value)
		@value = value
		@left_child = nil
		@right_child = nil
	end
end

class Tree

	def build_tree(array)
		root = Node.new(array[0])
		pos = root
		array[1..-1].each do |value|
			value = Node.new(value)
			until value.parent != nil
				if value < pos
					until value < pos.parent || pos == root
						pos = pos.parent
					end
					if pos.left_child.nil?
						pos.left_child = value
						value.parent = pos
					else
						pos = pos.left_child
					end
				else
					until value > pos.parent || pos == root
						pos = pos.parent
					end
					if pos.right_child.nil?
						pos.right_child = value
						value.parent = pos
					else
						pos = pos.right_child
					end
				end
			end
		end
	end

end