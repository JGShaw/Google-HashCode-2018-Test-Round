class Cell

    attr_reader :topping, :cellTaken

    def initialize(topping)
        @topping = topping
        @cellTaken = false
    end

    def takeCell
        @cellTaken = true
    end

    def returnCell
        @cellTaken = false
    end

end