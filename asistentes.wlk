import entradas.*
import bandas.*
import productora.*


class Asistente{
    const property abono
    const property historialEntradas = []
    var dineroDisponible
    
    method puedeComprarEntrada() = dineroDisponible > 0

    method montoAPagar(entrada) = entrada.precioAlPublico() - (entrada.precioAlPublico() * abono.porcentajeDeDescuento() / 100) 

    method comprarEntrada(entrada) {
        if(self.puedeComprarEntrada()){
            historialEntradas.add(entrada)
            dineroDisponible -= self.montoAPagar(entrada)
        } else {
            throw new Exception(message = "Saldo insuficiente para adquirir la entrada")  //El trabajo tiene un único caso que requiere el manejo de excepciones, por lo que no es necesario crear clases de excepciones según su tipo
        }
    }
 
    method entradasAñoPasado() = historialEntradas.filter({entrada => entrada.esDeAñoPasado()})

    method nombreBandas() = historialEntradas.map({entrada => entrada.banda()})

    method gastoEnEntradas() = historialEntradas.sum({entrada => entrada.precioAlPublico()}) //PREGUNTAR 

    method cantEntradasCompradas() = historialEntradas.size()
}

object abonoFan{
    var property porcentajeDeDescuento = 0
    method bonificar(){
        return
    }
}

class AbonoVip{
    var property porcentajeDeDescuento

    method bonificar(){
        porcentajeDeDescuento += 1
    }
}
