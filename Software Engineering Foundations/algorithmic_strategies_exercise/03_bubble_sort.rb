# Reimplement the bubble sort outlined in the preceding lecture.
# The bubble_sort method should accept an array of numbers and arrange the elements in increasing order.
# The method should return the array.
# Do not use the built-in Array#sort

def bubble_sort(arr)
    sorted = false  # indicator if we are fully sorted
    
    while (!sorted)
        sorted = true                               # true unless a swap occurs
        (0...arr.length - 1).each do |i|            # iterate through all indecies except last (checking neighbor)
            if (arr[i] > arr[i+1])
                arr[i], arr[i+1] = arr[i+1], arr[i] # swap if current is larger than next
                sorted = false
            end
        end
    end
    arr                                             # return array
end

p bubble_sort([2, 8, 5, 2, 6])      # => [2, 2, 5, 6, 8]
p bubble_sort([10, 8, 7, 1, 2, 3])  # => [1, 2, 3, 7, 8, 10]