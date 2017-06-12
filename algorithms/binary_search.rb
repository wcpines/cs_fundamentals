module Enumerable
  # Modify Enum, taking each consecutive pair of numbers and comparing them
  def is_sorted?
    each_cons(2).all? { |a, b| a <= b }
  end
end

def iterative_binary_search(target, nums)
  return "Input list not sorted" unless nums.is_sorted?

  low = 0
  high = nums.length - 1

  while low < high do
    middle = (high + low) / 2 # will be higher for oddn ums

    guess_value = nums[middle]

    if guess_value == target
      return true
    elsif guess_value > target
      high = middle
      else
        low = middle
    end
  end

  return false
end

def recursive_binary_search(target, nums)
  return "Input list not sorted" unless nums.is_sorted?

  low = 0
  high = nums.length - 1

  return false if low >= high

  middle = (high + low) / 2 # will be higher for oddn ums

  if nums[middle] > target
    binary_search(target, nums[0...middle])
  elsif nums[middle] < target
    binary_search(nums[(middle + 1)...nums.length], target)
  else
    return middle
  end
end
