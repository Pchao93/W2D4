require "byebug"
#time complexity: n^2
def two_sums_brute?(arr, target)
  arr.each_with_index do |el, idx1|
    (idx1+1...arr.length).each do |idx2|
      return true if el + arr[idx2] == target
    end
  end
  false
end

#time complexity is nlogn
def two_sums_sort?(arr, target)
  arr = quick_sort(arr)
  # byebug
  end_pointer = arr.length - 1
  i = 0
  while i < end_pointer
    cur_sum = arr[i] + arr[end_pointer]
    if cur_sum == target
      return true
    elsif cur_sum > target
      end_pointer -= 1
    else
      i += 1
    end
  end
  false
end

def bsearch(arr, target)
  return nil if arr.empty?
  middle = arr.length / 2
  case target <=> arr[middle]
  when 0
    return arr[middle]
  when -1
    return bsearch(arr.take(middle), target)
  when 1
    return bsearch(arr.drop(middle + 1), target)
  end
end


def quick_sort(char_array)
  return char_array if char_array.length <= 1
  pivot = char_array[0]
  left, right = [], []
  char_array[1..-1].each do |let|
    left << let if let <= pivot
    right << let if let > pivot
  end
  quick_sort(left).concat([pivot]).concat(quick_sort(right))
end

# O(n)
def two_sums_hash(arr, target)

  hash = {}
  # debugger
  arr.each do |el|
    return true if hash.has_key?(target-el)
    hash[el] = target - el
  end
  false
end
