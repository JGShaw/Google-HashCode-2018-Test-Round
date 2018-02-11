File.open("/Users/sep/Desktop/google_challenge_test/Google-HashCode-2018-Test-Round/inputs/small.in", "r") do |f|
	numbers = f.first.split().map { |chr| chr.to_i  }
	
	f.each do |line|
		puts line.chars
	end

end