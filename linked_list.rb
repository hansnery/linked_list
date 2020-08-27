# frozen_string_literal: true

# :nodoc:
class LinkedList
  require_relative 'node'

  def initialize
    @head = nil
    @tail = nil
    @nodes = Node.counter
  end

  def append(value)
    value = Node.new(value)
    if @head.nil?
      @head = value
    else
      @tail.next_node = value
    end
    @tail = value
  end

  def prepend(value)
    value = Node.new(value)
    if @head.nil?
      @head = value
      @tail = value
    else
      value.next_node = @head
      @head = value
    end
  end

  def size
    Node.count
  end

  def head
    @head.value
  end

  def tail
    @tail.value
  end

  def at(index)
    @nodes.each_with_index do |node, idx|
      return node.value if index == idx
    end
  end

  def pop
    last_index = Node.count - 1
    new_tail = Node.count - 2
    Node.counter.each_with_index do |node, idx|
      @tail = node if idx == new_tail
      node.next_node = nil if idx == new_tail
      node.delete if idx == last_index
    end
  end

  def contains?(value)
    Node.counter.each do |node|
      return true if node.value == value
      return nil if node.value != value
    end
  end

  def find(value)
    Node.counter.each_with_index do |node, idx|
      return idx if node.value == value
      return nil if node.value != value
    end
  end

  def to_s
    Node.counter.each do |node|
      print "( #{node.value} ) -> "
    end
    print ' nil '
  end
end

test = LinkedList.new
test.append(9)
test.append(10)
test.append(11)
test.append(12)
# puts test.head
# puts test.tail
# puts test.at(2)
# puts test.size
# test.pop
# puts test.tail
# puts test.size
# puts test.contains?(11)
# puts test.find(12)
test.to_s
