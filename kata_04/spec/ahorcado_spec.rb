require 'rspec'
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
			ahorcado = Ahorcado.new 'secreto'
			ahorcado.estado.should == '*******'
		end	

		it 'estado debe mostrar s****** cuando palabra secreta es secreto y arriesgo s' do
			ahorcado = Ahorcado.new ('secreto')
			ahorcado.arriesgar('s')
			ahorcado.estado.should == 's******'
		end	

		it 'estado debe mostrar se**e** cuando palabra secreta es secreto y arriesgo s' do
			ahorcado = Ahorcado.new ('secreto')
			ahorcado.arriesgar('s')
			ahorcado.arriesgar('e')
			ahorcado.estado.should == 'se**e**'
		end	

		it 'vidas debe decrecer si arriesga x cuando palabra secreta es secreto' do
			ahorcado = Ahorcado.new ('secreto')
			vidas_antes = ahorcado.vidas
			ahorcado.arriesgar('x')
			ahorcado.vidas.should < vidas_antes
		end
		
	end

end