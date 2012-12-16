class ShannonFano

	def probabilities
		frequencies = Hash.new{0}
		probabilities = Hash.new	

		@file.each_char do |char|
			frequencies[char] = frequencies[char] + 1
		end 

		frequencies = frequencies.sort_by {|k,v| v}.reverse
		frequencies.each do |k,v| #k and v class as in hash
			probabilities[k] = v.to_f/@file.length.to_f
		end

		return probabilities
	end

	def split_group(hash)
		sum = 0.0
		maxProb = 0.0
		hash.each do |k, v|
			maxProb += v
		end
		col_1 = Hash.new
      	col_2 = Hash.new

      	# Determine if the pixel value belongs in column 1 or column 2
      	hash.each do |k, v|  
        	if(sum < maxProb/2.0)
          		col_1[k] = v
        	else
          		col_2[k] = v
        	end

        	sum += v
      	end

		#puts maxProb, col_1, col_2, "\n"

      	return col_1, col_2
    end 

    def generateCode(col, temp, codeTable)

    	 # Perform recursively until this column cannot be divided
      	# Set the code for the lower half of this column
      	col.each do |key, value|
        	# If this is a new value, set it to temp
        	if (codeTable[key].nil?)
          		codeTable[key.to_s] = temp
        	else
          		# Otherwise, append a temp
          		codeTable[key] = codeTable[key] += temp
        	end
      	end

      	# Don't call the recursion if there is only one element in the column
      	unless (col.size == 1)
        	codeTable = code_table(col, codeTable)
      	end

      	return codeTable
    end

    def code_table(hash, codeTable)
    	col_1, col_2 = split_group(hash)

    	codeTable = generateCode(col_1, "0", codeTable)
    	codeTable = generateCode(col_2, "1", codeTable)

      	return codeTable
    end

    def encodedHash(hash, codeTable)
    	encodedString = ""
    	@file.each_char do |char| 
    		encodedString += codeTable[char]
    	end

    	return encodedString
    end

	def encode(userFile)
		@code = Hash.new
		@file = userFile

		@probabilities = probabilities()

		@code = code_table(@probabilities, @code)
		@encoded = encodedHash(@file, @code)

		return @code, @encoded

		#@code.each do |key, value|
      	#	puts "code", key, value
      	#end		
	end 

end

SF = ShannonFano.new
codeTable, encodedString = SF.encode("AAAAAABBBBBCCCCDDDEEF")
puts  codeTable, encodedString



