class CharCounter

	def count(char)
		counted = Hash.new
		chars.each_char do |char|
			counted[char] = chars.count char
		end
		counted
	end
end