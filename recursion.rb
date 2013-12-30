def range(start, final)
  return [start] if start == final

  [start] + range(start + 1, final)
end

def iterative_sum(items)
  sum = items[0]
  items.each_with_index do |item, index|
    next if index == 0
    sum += item
  end

  sum
end

def recursive_sum(items)
  return items[0] if items.length == 1

  items.last + recursive_sum(items[0..-2])
end

def exp1(base, power)
  return 1 if power == 0

  base * exp1(base,power-1)
end

def exp2(base, power)
  return 1 if power == 0

  if power.odd?
    base * (exp2(base, (power-1) / 2) ** 2)
  else
    exp2(base, power / 2) ** 2
  end
end

def deep_dup(array)
  dup_array = []
  return array unless array.is_a?(Array)
  array.each do |element|
    dup_array << deep_dup(element)
  end

  dup_array
end

def iterative_fib(fib_length)
  sequence = []

  fib_length.times do |number|
    sequence << case number
    when 0
      0
    when 1
      1
    else
      sequence[-2] + sequence[-1]
    end
  end

  sequence
end

def recursive_fib(fib_length)
  return [0] if fib_length == 1
  return recursive_fib(1) + [1] if fib_length == 2

  sequence = recursive_fib(fib_length - 1)
  sequence += [sequence[-2] + sequence[-1]]
end

def bsearch(sorted_array, target)
  middle_index = (sorted_array.length) / 2
  middle_index -= 1 if sorted_array.length.even?

  return middle_index if target == sorted_array[middle_index]
  return nil if sorted_array.length == 1

  if sorted_array[middle_index] > target
    bsearch(sorted_array[0...middle_index], target)
  else
    new_index = bsearch(sorted_array[(middle_index + 1)...sorted_array.length], target)
    new_index + middle_index + 1 if new_index
  end
end

def make_change_orig(amount, currencies = [25, 10, 5, 1])
  return [] if amount == 0

  #p "#{amount}: #{currencies}"
  if amount >= currencies[0]
    [currencies[0]] + make_change(amount - currencies[0], currencies)
  else
    make_change(amount, currencies[1..-1])
  end
end

def make_change(amount, currencies = [25, 10, 5, 1])
  return [] if amount == 0

  #p "#{amount}: #{currencies}"
  if amount >= currencies[0]
    [currencies[0]] + make_change(amount - currencies[0], currencies)
  else
    make_change(amount, currencies[1..-1])
  end
end


def mergesort_orig(unsorted)
  return unsorted if unsorted.length == 1
  middle_index = (unsorted.length) / 2
  middle_index -= 1 if unsorted.length.even?

  left = mergesort(unsorted[0..middle_index])
  right = mergesort(unsorted[(middle_index+1)..-1])

  sorted = []
  until left.empty? || right.empty?
    if left[0] < right[0]
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted += right if left.empty?
  sorted += left if right.empty?

  sorted
end

def mergesort(unsorted)
  return unsorted if unsorted.length == 1
  middle_index = (unsorted.length) / 2
  middle_index -= 1 if unsorted.length.even?

  left = mergesort(unsorted[0..middle_index])
  right = mergesort(unsorted[(middle_index+1)..-1])

  sorted = []
  until left.empty? || right.empty?
    left[0] < right[0] ? sorted << left.shift : sorted << right.shift
  end
  left.empty? ? sorted += right : sorted += left

  sorted
end

def subsets(set_arr)
  return [[]] if set_arr.empty?

  prefix_element = [set_arr[0]]

  all_subsets = [prefix_element]
  other_subsets = subsets(set_arr[1..-1])
  all_subsets += other_subsets

  other_subsets.each do |set|
    all_subsets << set + prefix_element unless set.empty?
  end

  all_subsets
end

#p subsets([1, 2, 3, 4])

# original = [6,5,3,1,7,8,2,4]
# p mergesort(original)

#p make_change(39) #[25, 10, 1, 1, 1, 1]
#p make_change(14, [10, 7, 1]) #[7, 7]

# BINARY SEARCH PRINT STATEMENTS
  # temp_array = %w(a b c d e f g h)
  # p temp_array[bsearch(temp_array, 'a')]
  # p temp_array[bsearch(temp_array, 'b')]
  # p temp_array[bsearch(temp_array, 'c')]
  # p bsearch(temp_array, 'd')
  # p temp_array[bsearch(temp_array, 'e')]
  # p temp_array[bsearch(temp_array, 'f')]
  # p temp_array[bsearch(temp_array, 'g')]
  # p temp_array[bsearch(temp_array, 'h')]

#puts iterative_fib(5) # 0 1 1 2 3
#p recursive_fib(10)

#puts exp1(10,5) #32
#puts exp2(2,4) #32
#puts deep_dup("A")
#p recursive_sum([1,2,3,4,5])

#p iterative_sum([1,2,3,4,5])

#p range(1,10)

# DEEP DUP PRINT STATEMENTS
  #test_array = [1,2,3,[4,5]]
  # test_array = [1, [2], [3, [4]]]
  #
  # new_array = deep_dup(test_array)
  # p new_array
  # p "original: #{test_array.object_id}"
  # p "new     : #{new_array.object_id}"
  # #new_array[1] << 6
  # new_array[2][1] << 6
  # p "new modified: #{new_array}"
  # p "original    : #{test_array}"
  # p test_array == new_array

