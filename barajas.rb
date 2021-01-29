
require_relative 'carta'

class Baraja
    attr_accessor :cartas

    def initialize(cartas = [])
        @cartas = cartas
        ['C','D','E','T'].each do |pinta|
            13.times do |i|
                @cartas.push( Carta.new(i+1, pinta) )
            end
        end
        @cartas
    end

    def barajar
        @cartas.shuffle!
    end

   
    def sacar   
        @cartas.pop
    end

    def repartir_mano
        mano = []
        5.times do
            mano.push( self.sacar )
        end
        mano
    end

end

