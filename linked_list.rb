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
    @nodes.each_with_index do |node, idx|
      @tail = node if idx == Node.count - 2
      node.next_node = nil if idx == Node.count - 2
      node.delete if idx == Node.count - 1
    end
  end

  def contains?(value)
    @nodes.each do |node|
      return true if node.value == value
      return nil if node.value != value
    end
  end

  def find(value)
    @nodes.each_with_index do |node, idx|
      return idx if node.value == value
      return nil if node.value != value
    end
  end

  def to_s
    @nodes.each do |node|
      print "( #{node.value} ) -> "
    end
    print ' nil '
  end

  def insert_at(value, index)
    append(value) if index.positive? && Node.count < 2
    insert_node(value, index)
  end

  def insert_node(value, index)
    @nodes.each_with_index do |node, idx|
      node.value = value if index == idx
    end
  end

  def remove_at(index)
    @nodes.each_with_index do |node, idx|
      update_head_and_tail_to_remove(node, index, idx)
      node.next_node = node.next_node.next_node if idx == index - 1
      node.delete if index == idx
    end
  end

  def update_head_and_tail_to_remove(node, index, idx)
    @head.value = @head.next_node.value if index.zero?
    @tail.value = node.value if index == Node.count - 1 && idx == Node.count - 2
  end
end
