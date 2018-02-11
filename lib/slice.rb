class Slice
  attr_reader :row_start, :col_start, :row_end, :col_end
  
  def intialize row_start, col_start, row_end, col_end
    @row_start = row_start
    @col_start = col_start
    @row_end = row_end
    @col_end = col_end
  end
    
  def to_s
    "#{@row_start} #{@col_start} #{@row_end} #{@col_end}"
  end
end
