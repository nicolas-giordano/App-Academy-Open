def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(str, &prc)
    words = str.split(" ")
    new_words = []
    words.each do |word|
        new_words << prc.call(word)
    end
    new_words.join(" ")
end

def greater_proc_value(n, prc_1, prc_2)
    [prc_1.call(n), prc_2.call(n)].max
end

def and_selector(arr, prc_1, prc_2)
    new_arr = []
    arr.each do |ele|
        if prc_1.call(ele) && prc_2.call(ele)
            new_arr << ele
        end
    end
    new_arr
end

def alternating_mapper(arr, prc_1, prc_2)
    new_arr = []
    arr.each_with_index do |ele, idx|
        if idx % 2 == 0
            new_arr << prc_1.call(ele)
        else
            new_arr << prc_2.call(ele)
        end
    end
    new_arr
end