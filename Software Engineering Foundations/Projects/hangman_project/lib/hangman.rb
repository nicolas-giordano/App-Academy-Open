class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize()
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    end
    false
  end

  def get_matching_indices(check)
    indices = []
    @secret_word.each_char.with_index do |char, idx|
      if char == check
        indices << idx
      end
    end
    indices
  end

  def fill_indices(char, indices)
    indices.each do |idx|
      @guess_word[idx] = char
    end
    @guess_word
  end


  def try_guess(char)
    if already_attempted?(char)
      p "that has already been attempted"
      return false
    end
    @attempted_chars << char
    indices = get_matching_indices(char)
    if indices.length > 0
      fill_indices(char, indices)
    else
      @remaining_incorrect_guesses -= 1
    end
    true
  end

  def ask_user_for_guess
    p "Enter a char:"
    response = gets.chomp
    try_guess(response)
  end

  def win?
    if @guess_word.join("") == @secret_word
      p "WIN"
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    end
    false
  end

  def game_over?
    if win? || lose?
      p @secret_word
      return true
    end
    false
  end
end
