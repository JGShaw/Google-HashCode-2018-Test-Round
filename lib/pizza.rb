require_relative 'cell'

class Pizza

    attr_reader :width, :height, :slices

    #Array of slices taken

    def initialize(width, height, lines)
        @width = width
        @height = height
        @slices = []
        @cells = []

        lines.each { |line|
            line.split('').each { |topping|
                @cells << Cell.new(topping)
            }
        }

    end

    def getCellTopping(x, y)
        return @cells[x + y * width].topping
    end

    def getCellTaken(x, y)
        return @cells[x + y * width].cellTaken
    end

    def takeSlice(rowStart, rowEnd, colStart, colEnd)

    end

end

# pizza = Pizza.new(2, 2, ["MM", "MT"])
# puts pizza.inspect

# puts pizza.getCellTaken(1,1)
