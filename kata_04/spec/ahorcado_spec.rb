require 'rspec'
require 'debugger'
require_relative '../lib/ahorcado.rb'

describe 'Ahorcado' do

	describe 'initialize' do
		it 'debe inicializarse con una palabra secreta' do
			ahorcado = Ahorcado.new ('secreto')
			ahorcado.palabra.should eq('secreto')
		end

		it 'vidas debe iniciarse en 3' do
			ahorcado = Ahorcado.new ('secreto')
			ahorcado.vidas.should eq(3)
		end
	end


	describe 'arriesgar' do
		it 'estado debe mostrar ******* cuando palabra secreta es secreto' do
			ahorcado = Ahorcado.new ('secreto')
			ahorcado.estado.should eq('*******')
		end	

		it 'estado debe mostrar s****** cuando palabra secreta es secreto y arriesgo s' do
			ahorcado = Ahorcado.new ('secreto')
			ahorcado.arriesgar('s')
			ahorcado.estado.should eq('s******')
		end	

		it 'estado debe mostrar se**e** cuando palabra secreta es secreto y ' do
			ahorcado = Ahorcado.new ('secreto')
			ahorcado.arriesgar('s')
			ahorcado.arriesgar('e')
			ahorcado.estado.should eq('se**e**')
		end	

		it 'vidas debe decrecer si arriesga x cuando palabra secreta es secreto' do
			ahorcado = Ahorcado.new ('secreto')
			vidas_antes = ahorcado.vidas
			ahorcado.arriesgar('x')
			ahorcado.vidas.should < vidas_antes
		end
	end


	describe 'inicializarDescubiertas' do
		it 'inicializarDescubiertas de la palabra "secreto" deberia retornar un Hash con 6 claves' do
			ahorcado = Ahorcado.new ('secreto')
			ahorcado.descubiertas.keys.should eq(["s","e","c","r","t","o"])
			ahorcado.descubiertas.keys.length.should eq(6)
		end
	end


	describe 'quedanVidas' do
		it 'quedanVidas de un juego recien comenzado deberia retornar true' do
			ahorcado = Ahorcado.new ('secreto')
			ahorcado.quedanVidas.should eq(true)
		end
		it 'quedanVidas de un juego donde se arriesgo 1 letra inexistente deberia retornar true' do
			ahorcado = Ahorcado.new ('secreto')
			ahorcado.arriesgar('k')
			ahorcado.quedanVidas.should eq(true)
		end
		it 'quedanVidas de un juego donde se arriesgo 2 letras inexistente deberia retornar true' do
			ahorcado = Ahorcado.new ('secreto')
			ahorcado.arriesgar('j')
			ahorcado.arriesgar('m')
			ahorcado.quedanVidas.should eq(true)
		end
		it 'quedanVidas de un juego donde se arriesgo 3 letras inexistente deberia retornar false' do
			ahorcado = Ahorcado.new ('secreto')
			ahorcado.arriesgar('j')
			ahorcado.arriesgar('m')
			ahorcado.arriesgar('l')
			ahorcado.quedanVidas.should eq(false)
		end
	end


	describe 'quedanLetras' do
		it 'quedanLetras deberia retornar false cuando la palabra es secreto y se arriesgaron todas las letras' do
			ahorcado = Ahorcado.new ('secreto')
			ahorcado.descubiertas = {'s'=>true,'e'=>true,'c'=>true,'r'=>true,'t'=>true,'o'=>true}
			ahorcado.quedanLetras.should eq(false)
		end

		it 'quedanLetras deberia retornar true cuando la palabra es secreto y no se arriesgo la o' do
			ahorcado = Ahorcado.new ('secreto')
			ahorcado.descubiertas = {'s'=>true,'e'=>true,'c'=>true,'r'=>true,'t'=>true,'o'=>false}
			ahorcado.quedanLetras.should eq(true)
		end
	end


	describe 'finalizacion de un juego' do
		it 'estado debe levantar una exepcion "GANASTE :D" cuando la palabra secreta es secreto y arriesgue todas' do
			ahorcado = Ahorcado.new ('secreto')
			ahorcado.descubiertas = {'s'=>true,'e'=>true,'c'=>true,'r'=>true,'t'=>true,'o'=>true}
			expect {ahorcado.estado}.to raise_error "GANASTE :D"
		end

		it 'estado debe levantar una exepcion "PERDISTE :(" cuando la palabra secreta es secreto, me queda una sola vida y arriesgo x' do
			ahorcado = Ahorcado.new ('secreto')
			ahorcado.vidas = 1
			ahorcado.arriesgar('x')
			expect {ahorcado.estado}.to raise_error 'PERDISTE :('
		end
	end
end