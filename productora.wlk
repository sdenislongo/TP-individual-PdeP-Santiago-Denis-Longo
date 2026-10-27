import asistentes.*
import bandas.*
import entradas.*


object productora{
    var property impuesto = 10
    const asistentes = []
    const bandas = #{}

    method agregarAsistente(asistente) {
        asistentes.add(asistente)
    }

    method agregarBanda(banda) {
        bandas.add(banda)
    }

    method recaudacionEntradas() = asistentes.sum({asistente => asistente.gastoEnEntradas()})

    method gastoEnPresupuestos() = bandas.sum({banda => banda.presupuesto()})

    method gananciaTotal() = self.recaudacionEntradas() - self.gastoEnPresupuestos() // PREGUNTAR

    method cantEntradasVendidas() = asistentes.sum({asistente => asistente.cantEntradasCompradas()})

    method todasLasEntradas() = asistentes.map({asistente => asistente.historialEntradas()}).flatten()

    method entradasVendidasPor(banda) = self.todasLasEntradas().count({entrada => entrada.banda() == banda})

    method bandaMasPopular() = bandas.max({banda => self.entradasVendidasPor(banda)})

    method listaAbonos() = asistentes.map({asistente => asistente.abono()})

    method bonificarVips() = self.listaAbonos().forEach({abono => abono.bonificar()})
}
