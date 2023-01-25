require 'byebug'

def range(num_1, num_2)
    return [] if num_1 == num_2
    [num_1] + range(num_1+1, num_2)
end

# p range(5, 5) # []
# p range(2, 3) # [2]
# p range(1, 5) # [1, 2, 3, 4]
# p range(1, 10) 
# [1]
# [1, 2]
# [1, 2, 3]
# [1, 2, 3, 4] return

# Exponentiation
# Write two versions of exponent that use two different recursions:

# # this is math, not Ruby methods.

def exp(b, e)
    return 1 if e == 0
    b * exp(b, e - 1)
end

# p exp(2, 2) # 4
# p exp(5, 3) # 125
# p exp(5, 0) # 1
# p exp(0, 5)

# # recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

# # recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]
# Note that for recursion 2, you will need to square the results of exp(b, n / 2) and (exp(b, (n - 1) / 2). Remember that you don't need to do anything special to square a number, just calculate the value and multiply it by itself. So don't cheat and use exponentiation in your solution.

# Suggestion: Break the methods down into parts. For more information check out the Breaking Methods Into Parts reading in the sidebar.

# Suggestion 2: Try walking through your code with Simple Examples.

# If the n == 256, about how many nested recursive steps will we run in the first case?

# How deep will we need to recurse for the second? Keep in mind that the first reduces the exponent by one for each recursion, while the second reduces it by half.

# In addition to testing your methods by running the code, try the following exercise:

# On paper, write out the value of each variable for every line in the code:

# Write out what happens with base 0 and power 0 as inputs (should be easy). e.g., if you had run exp(0,0).
# Write out what happens for base 0 and power 1. e.g., if you had run exp(0,1).
# Write out what happens for base 1 and power 0.
# Write out what happens for base 1 and power 1.
# Write out what happens for base 1 and power 2.
# Write out what happens for base 2 and power 0.
# Write out what happens for base 2 and power 1.
# Write out what happens for base 2 and power 2.
# Make sure you can trace from the very beginning to the very end in these examples.

# How many examples do you need to walk through to be confident that it works?

def deep_dup(array)
    array.map do |ele|
        if ele.is_a?(Array)
            (deep_dup(ele))
        else
            # var = ''
            # var += ele
            # var
            [ele].join
        end
    end
end

# def deep_dup(array)
#     final_arr = []
#     #return final_arr if !array.is_a?(Array)
#     array.each do |ele|
#         if ele.is_a?(Array)
#             final_arr << (deep_dup(ele))
#         else
#             var = ''
#             var += ele
#             final_arr << var
#         end
#     end
#     return final_arr
# end

robot_parts = [
  ["nuts", "bolts", "washers", 5],
  ["capacitors", "resistors", "inductors"]
]

new_arr = deep_dup(robot_parts)

new_arr[0] << 'hello'
new_arr[0][0] << "Y"
# p new_arr[0].object_id
# p robot_parts[0].object_id
# p new_arr[0][0].object_id
# p robot_parts[0][0].object_id

# p robot_parts
# p new_arr

# asdf = ["hello"," time" ,"goodbye" ]

# puts asdf[0].object_id
# puts asdf[1].object_id

# puts 

# qwer = [] << asdf[0]
# qwer = [] << asdf[1]

# puts qwer[0].object_id
# puts qwer[1].object_id


def fib(n)
    return 0 if n == 1
    return 1 if n == 2
    fib(n-1) + fib(n-2)
end

#[0, 1, 1, 2, 3, 5]
# p fib(1) # 0
# p fib(2) # 1
# p fib(3) # 1
# p fib(4) # 2


# def bsearch(array, target)
#     # my_hash = {}
#     # array.each_with_index {|ele, i| my_hash[i] = ele}
#     middle = array.length / 2
#     if array[middle] < target
#         return bsearch(array[middle..-1], target)
#     elsif array[middle] > target
#         return bsearch(array[0..middle], target)
#     elsif array[middle] == target
#         return my_hash.key(array[middle])
#     else
#         nil
#     end
# end


# array = ['a','b','c','d']
# num = array.length / 2
# puts array[num]

# def bsearch(array, target)
#     i = (array.length / 2)
#     while i <= array.length
#         if array[i] > target
#             puts "top "
#             i /= 2
#         elsif array[i] < target
#             puts "mid"
#             i += (i/2)
#         elsif array[i] == target
#             return i 
#         else
#             return i
#         end
#     end
# end
            

def bsearch(array, target)
    debugger
    return nil if array.empty?
    
    mid_index = array.length / 2
   
    case target <=> array[mid_index]
    when -1
      bsearch(array.take(mid_index), target)
    when 0
      mid_index
    when 1
      subs = bsearch(array.drop(mid_index + 1), target)
      subs.nil? ? nil : (mid_index + 1) + subs
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


# a = [1,2,3,4].drop(2)
# p a.index(3)

def merge_sort(array)
    return array if array.length == 1
end