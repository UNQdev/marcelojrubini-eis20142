class CharCounter

	def self.count(chars)
		counted = Hash.new
		if chars != nil
			chars.each_char do |char|
				counted[char] = chars.count char
			end
		end
		counted
	end
end