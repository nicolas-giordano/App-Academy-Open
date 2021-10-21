def hipsterfy(word)
    vowels = "aeiou"
    last_vowel_idx = 0
    word.each_char.with_index do |char, idx|
        if vowels.include?(char)
            last_vowel_idx = [last_vowel_idx, idx].max
        end
    end
    if vowels.include?(word[last_vowel_idx])
        word[last_vowel_idx] = ""
    end
    word
end

def vowel_counts(str)
    vowels = "aeiou"
    count = Hash.new(0)
    str.downcase.each_char do |char|
        if vowels.include?(char)
            count[char] += 1
        end
    end
    count
end

def caesar_cipher(str, n)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    (0..str.length-1).each do |i|
        if alphabet.include?(str[i])
            old = alphabet.index(str[i])
            new = (old + n) % 26
            str[i] = alphabet[new]
        end
    end
    str
end