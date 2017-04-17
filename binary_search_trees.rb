class BinarySearchTree
	attr_accessor :root

	class Node
		attr_reader :value, :left, :right
	
		def initialize(value)
			@value = value
			@left = nil
			@right = nil
		end

		def insert(new_value)
			if new_value <= value
				@left.nil? ? @left = Node.new(new_value) : @left.insert(new_value)
			elsif new_value > value
				@right.nil? ? @right = Node.new(new_value) : @right.insert(new_value)
			end
		end
	end

	def initialize(root = nil)
		@root = root
		@result = nil
	end

	def insert(value)
		@root.nil? ? @root = Node.new(value) : @root.insert(value)
	end

	def build(array)
		array.each do |value|
			self.insert(value)
		end
	end

	def breadth_first_search(target)
		return false if @root.nil?
		queue = [@root]
		until queue.empty?
			q = queue[0]
			return q if q.value == target
			queue.push(q.left) unless q.left.nil?
			queue.push(q.right) unless q.right.nil?
			queue.shift
		end
		false
	end

	def depth_first_search(target)
		return false if @root.nil?
		stack = [@root]
		until stack.empty?
			s = stack[-1]
			return s if s.value == target
			stack.pop
			stack.push(s.right) unless s.right.nil?
			stack.push(s.left) unless s.left.nil?
		end
	end

	def dfs_rec(target, pos = nil)
		@result = nil
		return nil if @root.nil? || @result != nil
        pos = @root if pos.nil?
        @result = pos if pos.value == target
        dfs_rec(target, pos.left) if pos.left != nil
        dfs_rec(target, pos.right) if pos.right != nil
        @result
    end
end

=begin 
array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = BinarySearchTree.new
tree.build(array)
search_result = tree.dfs_rec(324)
puts "Search result: " + search_result.inspect
=end