

class WordGame
    def initialize(words, input)
        @words = words
        @input = input
        @score = 0
    end

    def play
        loop do
            answer = @words.sample
            @input.prompt(question(answer)) do |attempt|
                if attempt == answer
                    @score += 1
                    puts success_message
                    break
                else
                    puts failed_message
                end
            end

            break if @input.exit?
        end

        @score
    end

    private

    def scramble(word)
        word.split(//).sort_by { rand }.join('')
    end

    def question(word)
        "Tebak kata: #{scramble(word)}"
    end

    def success_message
        "BENAR! Point anda: #{@score}"
    end

    def failed_message
        "SALAH! Silahkan coba lagi"
    end
end