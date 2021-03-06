class Node
  attr_accessor :data, :next
  
  def initialize(data)
    @data = data
    @next = nil
  end
end

class SinglyLinkedList
  def initialize()
    @head = nil
    @length = 0
  end

  def insert_front(value)
    new_node = Node.new(value)
    new_node.next = @head
    @head = new_node
    @length += 1
  end

  def insert_back(value)
    new_node = Node.new(value)
    if @head == nil
      @head = new_node
    else
      curr = @head
      while curr.next != nil
        curr = curr.next
      end

      curr.next = new_node
    end
    @length += 1
  end

  # first node => position 1
  def insert_at(value, pos)
    new_node = Node.new(value)

    if pos <= 1
      insert_front(value)
      return
    elsif pos >= @length
      insert_back(value)
      return
    else
      curr = get_node_at(pos-1)
      new_node.next = curr.next
      curr.next = new_node;

      @length += 1
    end
  end

  # first node => position 1
  def remove_at(pos)
    pos = @length if pos > @length

    if pos<=1
      @head = @head.next
    else
      curr = @head
      for i in 1...(pos-1)
        curr = curr.next
      end

      curr.next = curr.next.next
    end

    @length -= 1
  end

  def search_value(value)
    curr = @head
    index = 0
    while curr != nil
      return index if curr.data == value

      curr = curr.next
      index += 1
    end

    return -1
  end

  # first node => position 1
  def get_node_at(pos)
    if @head == nil
      puts "---- list is empty"
      return 
    elsif pos < 1 or pos > @length
      puts "---- invalid position"
      return
    else
      curr = @head
      for i in 1...pos
        curr = curr.next
      end
      return curr
    end
  end

  def length()
    @length
  end

  def print_list()
    curr = @head
    for i in 0...@length
      print "#{curr.data} "
      curr = curr.next
    end
    puts
  end
end

root = SinglyLinkedList.new()
1.upto(5) do |x|
  root.insert_back(x)
end
puts "len: #{root.length}"
root.print_list

0.downto(-5) do |x|
  root.insert_front(x)
end
puts "len: #{root.length}"
root.print_list

root.remove_at(5)
root.print_list
root.remove_at(5)
root.print_list
root.remove_at(5)
root.print_list

if root.search_value(5) >= 0
  puts "exist"
else
  puts "DNE"
end
