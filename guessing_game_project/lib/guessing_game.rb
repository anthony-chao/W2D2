class GuessingGame

    def initialize(min, max)
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def num_attempts
        @num_attempts
    end

    def game_over?
        @game_over
    end

    def check_num(number)
        @num_attempts += 1
        if number == @secret_num
            @game_over = true
            puts "you win"
        elsif number > @secret_num
            puts "too big"
        else
            puts "too small"
        end
    end

    def ask_user
        print 'enter a number'
        string = gets
        check_num(string.chomp.to_i)
    end
end