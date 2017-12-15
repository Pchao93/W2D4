require "byebug"

def first_anagram?(string1, string2)
  # self, string
  # debugger
  anagrams = permutations(string1.chars)
  anagrams = anagrams.map do |arr|
    arr.join("")
  end

  anagrams.include?(string2)

end

def permutations(array)

  return [array] if array.length < 2
  len = array.length
  last = [array.pop]
  old_perms = permutations(array)
  new_perms = []
  old_perms.each do |perm|
    i = 0
    while i < len
      result = perm.take(i) + last + perm.drop(i)
      i += 1
      new_perms << result
    end
  end
  new_perms
end

def second_anagram(string1, string2)
  string1 = string1.dup
  string2 = string2.dup
  string1.dup.each_char do |let|
    string1.delete!(let)
    string2.delete!(let)
  end
 string1.empty? && string2.empty?
end

def third_anagram(string1, string2)
  string1 = quick_sort(string1.chars).join("")
  string2 = quick_sort(string2.chars).join("")
  string1 == string2
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

def fourth_anagram(string1, string2)
  counter1 = Hash.new(0)
  counter2 = Hash.new(0)
  string1.each_char do |let1|
    counter1[let1] += 1
  end
  string2.each_char do |let2|
    counter2[let2] += 1
  end
  counter1 == counter2
end

def fifth_anagram(string1, string2)
  counter = Hash.new(0)

  string1.each_char do |let1|
    counter[let1] += 1
  end
  string2.each_char do |let2|
    counter[let2] += 1
  end
  counter.all? { |k,v| v.even? }
end
