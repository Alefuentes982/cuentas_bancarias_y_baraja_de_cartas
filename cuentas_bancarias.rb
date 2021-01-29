class CuentaBancaria
    attr_accessor :saldo
    attr_reader :banco, :numero_de_cuenta

    def initialize(banco, numero_de_cuenta, saldo = 0.0)
        raise ArgumentError, "Numero de cuenta solo debe contener numeros" if (numero_de_cuenta.count('a-z') > 0 || numero_de_cuenta.count('A-Z') > 0)
        @banco = banco
        @numero_de_cuenta = numero_de_cuenta
        @saldo = saldo
    end

    def transferir(monto, cuenta)
        raise "\nATENCION\n Su saldo en la cuenta #{@numero_de_cuenta} es insuficiente \npara realizar esta transaccion" if (monto > @saldo)
        @saldo -= monto
        cuenta.saldo += monto
        monto
    end
end

class Usuario
    attr_reader :nombre, :cuentas

    def initialize(nombre, cuentas)
        @nombre = nombre
        @cuentas = []

        if (cuentas.class != Array)
            @cuentas.push(cuentas)
        else
            cuentas.each do |cuenta|
                @cuentas.push(cuenta)
            end
        end
    end

    def saldo_total()
        @cuentas.inject(0) do |total, cuenta|
            total += cuenta.saldo
        end
        
    end
end

