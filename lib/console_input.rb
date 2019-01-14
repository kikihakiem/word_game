class ConsoleInput
    def exit?
        print 'Keluar? '
        /ya?/i.match(gets.chomp)
    end

    def prompt(question, max_attempt = 3)
        puts question
        attempt = 0
        while attempt < max_attempt do
            yield gets.chomp
            attempt += 1
        end
    end
end