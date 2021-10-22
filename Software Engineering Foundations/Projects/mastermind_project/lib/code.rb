class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(pegs)
    pegs.all? {|peg| POSSIBLE_PEGS.include?(peg.upcase)}
  end

  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs
      @pegs.each {|peg| peg.upcase!}
    else
      raise "Invalid peg found."
    end
  end

  def self.random(length)
    pegs = []
    while length > 0
      pegs << ["r", "g", "b", "y"][rand(0..3)]
      length -= 1
    end
    code = Code.new(pegs)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    counter = 0
    guess = code.pegs
    @pegs.each_with_index do |peg, idx|
      if peg == guess[idx]
        counter += 1
      end
    end
    counter
  end

  def num_near_matches(guess)
    code_dup = self.pegs.dup
    guess_dup = guess.pegs.dup

    guess_dup.each_with_index do |peg, i|
      if peg == code_dup[i]
        code_dup[i] = nil
        guess_dup[i] = nil
      end
    end
    code_dup.delete(nil)
    guess_dup.delete(nil)

    count = 0
    guess_dup.each_with_index do |peg, i|
      if code_dup.include?(peg)
        count += 1
        code_dup.delete_at(code_dup.index(peg))
      end
    end
    count
  end

  def ==(guess)
    @pegs == guess.pegs
  end
  
  
  
end
