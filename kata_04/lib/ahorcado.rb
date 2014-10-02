class Ahorcado

	attr_accessor :palabra,:vidas,:descubiertas

	def initialize(key_word)
		@palabra = key_word
		@vidas = 3
		@descubiertas = inicializarDescubiertas
	end


	def arriesgar(char)
		if palabra.include? (char)
			descubrir(char)
		else
			self.vidas = self.vidas-1
		end
	end


	def descubrir(char)
		descubiertas[char] = true
	end

	def inicializarDescubiertas
		palabra.split(//).inject({}) { |letras, char| letras.update(char => false) }
	end

	def printEstado
		palabra.split(//).inject('') { |toPrint, char| descubiertas[char] ? toPrint+char : toPrint+'*' }
	end

	def quedanVidas
		vidas > 0
	end

	def quedanLetras
		descubiertas.has_value? (false)
	end


	def estado
		if quedanVidas
			if quedanLetras
				printEstado
			else
				raise 'GANASTE :D'
			end
		else
			raise 'PERDISTE :('
		end
	end

end