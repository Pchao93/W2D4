def windowed_max_range(array, window_size)
  i = 0
  current_max_range = nil
  while i < array.length - window_size + 1
    window = array[i..i + window_size - 1]
    diff = window.max - window.min
    current_max_range ||= diff
    current_max_range = diff if current_max_range < diff
    i += 1
  end

  current_max_range

end

class MinMaxStackQueue

  def initialize

    @minmax = {}
    @in = MyStack.new
    @out = MyStack.new
    @temp = MyStack.new

  end

  def enqueue(val)
    @minmax[:max] = val if val > @minmax[:max]
    @minmax[:min] = val if val < @minmax[:min]
    @in.push(val)

  end

  def dequeue
    if @out.empty?
      until @in.empty?
        @out.push(@in.pop)
      end
    end
    out.pop

  end

  def size
    @in.size + @out.size
  end

  def empty?
    @in.empty? && @out.empty?
  end





  class MyStack

    def initialize(array = [])
      @store = []
    end

    def push(val)
      @store.push(val)
    end

    def pop
      @store.pop
    end

    def peek
      @store.last
    end

    def size
      @store.count
    end

    def empty?
      @store.empty?
    end

  end



end
