class BogusInput
    def initialize(attempts)
        @attempts = attempts
    end

    def exit?
        @attempts.empty?
    end

    def prompt(question, max_attempt = 3)
        attempt = 0
        while attempt < max_attempt do
            yield @attempts.shift
            attempt += 1
        end
    end
end

class BogusWordCollection
    def initialize(words)
        @words = words
    end

    def sample
        @words.shift
    end
end
