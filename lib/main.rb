require_relative 'pizza'
require_relative 'slice'

lines = []
numbers = []
pizza_width = 0
pizza_height = 0
pizza_l = 0
pizza_h = 0

File.open(ARGV[0], "r") do |f|
	numbers = f.first.split().map { |chr| chr.to_i  }
	
	f.each do |line|
		lines << line
	end

end

pizza_width = numbers[0]
pizza_height = numbers[1]
pizza_l = numbers[2]
pizza_h = numbers[3]


pizza = Pizza.new(pizza_width, pizza_height, pizza_l, pizza_h, lines)

slices = []

#Solve it!!!!

slices << Slice.new(1,2,3,4)
slices << Slice.new(2,4,6,9)



fileName = File.basename(ARGV[0], File.extname(ARGV[0]))

File.open("outputs/%s.out" % [fileName], 'w') { |file| 
	
	file.puts slices.length

	slices.each do |slice|
		file.puts slice.to_s
	end
}
