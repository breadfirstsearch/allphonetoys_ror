class Zombie
    attr_accessor :name
    attr_accessor :brains
    def initialize
        @name = 'Ash'
        @brains = 0
    end
    def hungry?
        true
    end
end