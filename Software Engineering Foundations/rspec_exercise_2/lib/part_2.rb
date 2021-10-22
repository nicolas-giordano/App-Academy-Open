def palindrome?(str)
    (0...str.length).each do |i|
        if str[i] != str[-1 - i]
            return false
        end
    end
    true
end

def substrings(str)
    res = []
    (0...str.length).each do |i|
        (i...str.length).each do |j|
            res << str[i..j]
        end
    end
    res
end

def palindrome_substrings(str)
    substrings = substrings(str)
    substrings.select {|substring| substring.length > 1 && palindrome?(substring)}
end