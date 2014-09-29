class Ahorcado

	@palabra
	@vidas
	@estado

	def initialize(key_word)
		@palabra = key_word
		@vidas = 3
		@estado = '*' * key_word.length
	end

	def arriesgar(char)
		if palabra.include(char)
			reemplazarOcurrencias(char)
		else
			vidas = vidas -1
		end
		estado
	end

	def reemplazarOcurrencias(letra)
		
	end

	def palabra
		@palabra
	end
	def vidas
		@vidas
	end
	def estado
		@estado
	end		
end