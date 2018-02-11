require_relative 'cell'

class Pizza

    attr_reader :width, :height, :slices

    def initialize(width, height, l, h, lines)
        @width = width
        @height = height
        @slices = []
        @cells = []
        @l = l
        @h = h

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

    def getPossibleSliceDimensions

        possibleSliceDimensions = []
        for j in (@l * 2)..@h 
            for i in 1..j
                possibleSliceDimensions << [i, j / i] if (j % i) == 0 
            end
        end        
        return possibleSliceDimensions

    end

    def takeSlice(rowStart, rowEnd, colStart, colEnd)

        return [] if rowStart > rowEnd
        return [] if rowStart < 0 || rowStart > (width - 1)
        return [] if rowEnd < 0 || rowEnd > (width - 1)
        return [] if colStart > colEnd
        return [] if colStart < 0 || colStart > (height - 1)
        return [] if colEnd < 0 || colEnd > (height - 1)

        return [] if (rowEnd - rowStart + 1) * (colEnd - colStart + 1) > @h

        numTomato = 0
        numMushroom = 0
        sliceCells = []

        for x in colStart..colEnd
            for y in rowStart..rowEnd

                cell = @cells[x + y * @width]

                return [] if cell.cellTaken

                cell.topping == 'T' ? numTomato += 1 : numMushroom += 1

                sliceCells << cell

            end
        end

        return [] if numTomato < @l || numMushroom < @l

        sliceCells.each { |cell| cell.takeCell }

        return sliceCells

    end

end

# pizza = Pizza.new(2, 2, 2, 6, ["MM", "MT"])
# puts pizza.inspect

# puts pizza.getPossibleSliceDimensions.inspect

# puts pizza.takeSlice(0, 1, 0, 0).inspect

