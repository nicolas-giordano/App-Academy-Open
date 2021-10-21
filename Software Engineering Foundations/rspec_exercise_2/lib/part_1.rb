def partition(arr, n)
    below = []
    above = []
    
    arr.each do |num|
        if num < n
            below << num
        else
            above << num
        end
    end
    [below, above]
end


def merge(hash_1, hash_2)
    new_hash = {}
    hash_1.each {|key, value| new_hash[key] = value}
    hash_2.each {|key, value| new_hash[key] = value}
    new_hash
end

def censor(sentence, array)
    vowels = "aeiou"
    words = sentence.split(" ")
    words.each do |word|
        if array.include?(word.downcase)
            (0...word.length).each do |i|
                if vowels.include?(word[i].downcase)
                    word[i] = '*'
                end
            end
        end
    end
    words.join(" ")
end

def power_of_two?(n)
    if n == 1
        return true
    end
    val = 2
    while val < n
        val = val * 2
    end
    val == n
end