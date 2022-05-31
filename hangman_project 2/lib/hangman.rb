class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word          #what does this mean? I'm so confused
    DICTIONARY.sample           #no clue what this means either
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
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
    attempted_chars.include?(char) ? true : false
  end

  def get_matching_indices(char)
    array = []
      @secret_word.each_char.with_index { |ele, idx| array << idx if ele == char }
    array
  end

  def fill_indices(char, array)
    array = get_matching_indices(char)
    array.each { |idx| @guess_word[idx] = char }
    @guess_word
  end
  
  def try_guess(char)
    if already_attempted?(char)
      p "that has already been attempted"
      return false
    else
      @attempted_chars << char
      array = get_matching_indices(char)
      fill_indices(char, array)
      @remaining_incorrect_guesses -= 1 if array.empty? 
      return true
    end
  end

  def ask_user_for_guess
    p 'Enter a char'
    string = gets
    try_guess(string.chomp)
  end

  def win?
    if @guess_word.join == @secret_word
      p 'WIN'
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p 'LOSE'
      return true
    else
      return false
    end
  end

  def game_over?
    if win? || lose?
      p @secret_word
      return true
    else
      return false
    end
  end

end
