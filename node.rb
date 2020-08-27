# frozen_string_literal: true

require 'set'

# :nodoc:
class Node
  attr_accessor :value, :next_node, :counter

  @@counter = Set.new

  def initialize(value = nil)
    @value = value
    @next_node = nil

    @@counter << self
  end

  def delete
    @@counter.delete(self)
  end

  def self.count
    @@counter.size
  end

  def self.counter
    @@counter
  end
end
