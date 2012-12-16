class ShannonFano
	@file

	def probabilities(file)
		frequencies = Hash.new{0}
		probabilities = Hash.new	

		file.each_char do |char|
			frequencies[char] = frequencies[char] + 1
		end 

		frequencies = frequencies.sort_by {|k,v| v}.reverse
		frequencies.each do |k,v| #k and v class as in hash
			probabilities[k] = v.to_f/file.length.to_f
		end

		return probabilities
	end
end

SF = ShannonFano.new
prob = SF.probabilities("AAABBBBCCCCCCaaa")
prob.each do |k,v| #k and v class as in hash
	puts k,v
end


