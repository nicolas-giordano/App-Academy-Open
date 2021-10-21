def average(num_1, num_2)
    (num_1 + num_2) / 2.0
end

def average_array(arr)
    arr.sum / (arr.length * 1.0)
end

def repeat(str, n)
    str * n
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    words = str.split(" ")
    (0..words.length - 1).each do |i|
        if i % 2 == 0
            words[i].upcase! 
        else
            words[i].downcase!
        end
    end
    words.join(" ")
end