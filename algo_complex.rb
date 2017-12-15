def my_min_slow(arr)
    arr.each do |el|
      return el if arr.all? { |el2| el <= el2 }
    end
end

def my_min_fast(arr)
    # min = nil
    # arr.each do |el|
    #   min ||= el
    #   min = el if el < min
    # end
    # min
    arr.reduce do |acc, el|
      if el < acc
        acc = el
      else
        acc
      end
    end

end

def dumb_inter(arr)
  sub_arr = subsets(arr)
  sums = []
  sub_arr.delete([])
  sub_arr[1..-1].each do |subset|
    sums << subset.reduce(:+)
  end

  sums.max



end

def subsets(arr)
  return [arr] if arr.empty?
  last = arr.pop
  old_sub = subsets(arr)
  new_sub = old_sub.map do |el|
    el += [last]
  end
  old_sub.concat(new_sub)
end

def smart_inter(arr)
  return arr.max if arr.all? { |el| el < 0 }

  cur_sum = 0
  max = 0
  arr.each do |el|
    if cur_sum + el > 0
      cur_sum += el
    else
      cur_sum = 0
    end
    max = cur_sum if cur_sum > max
  end
  max
end
