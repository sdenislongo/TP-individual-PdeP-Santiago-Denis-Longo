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
            throw new Exception(message = "Saldo insuficiente para adquirir la entrada")  //JUSTIFICAR QUE NO CREO UNA NUEVA CLASE PORQUE NO HAY OTRA EXCEPCION EN EL CODIGO, NO ES NECESARIO
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
        porcentajeDeDescuento += porcentajeDeDescuento/100
    }
}
