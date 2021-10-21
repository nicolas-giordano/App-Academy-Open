# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    res = ""
    counter = 1
    prev = str[0]
    (1..str.length - 1).each do |i|
        if str[i] == prev
            counter += 1
        else
            if counter > 1
                res += counter.to_s
            end
            res += prev
            prev = str[i]
            counter = 1
        end
    end
    if counter > 1
        res += counter.to_s
    end
    res += + prev
    res
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
