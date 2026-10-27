import productora.*

class Entrada{
    const property banda
    const fecha
    const precioBase = 1000
    const impuesto = productora.impuesto()

    method precioAlPublico() = precioBase + impuesto

    method esDeAñoPasado(){
        const hoy = new Date()
        return fecha.year() == hoy.year()-1
    }

}

