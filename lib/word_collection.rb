class WordCollection < Array
    def initialize(words)
        @pro, @novice = words.partition { |w| w.length > 5 }
        super([@novice, @pro])
    end
end