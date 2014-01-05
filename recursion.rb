def range(start, final)
  return [start] if start == final

  [start] + range(start + 1, final)
end

def recursive_sum(nums)
  return nums[0] if nums.length == 1

  nums[-1] + recursive_sum(nums[0..-2])
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

  array.each do |element|
    dup_array << deep_dup(element)
  end

  dup_array
end

def recursive_fib(fib_length)
  return [0] if fib_length == 1
  return [0, 1] if fib_length == 2

  sequence = recursive_fib(fib_length - 1)
  sequence += [sequence[-2] + sequence[-1]]
end

def binary_search(sorted_array, target)
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

def make_change(amount, currencies = [25, 10, 5, 1])
  return [] if amount == 0

  if amount >= currencies[0]
    [currencies[0]] + make_change(amount - currencies[0], currencies)
  else
    make_change(amount, currencies[1..-1])
  end
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

  all_subsets = subsets(set_arr[1..-1])

  other_subsets = all_subsets.map do |subsubset|
     prefix_element + subsubset
  end

  all_subsets += other_subsets
end

p subsets([1,2,3])