class Banda{
    const nombre
    
    method gastoExtra()
    method canon() = 1000000
    method presupuesto() = self.canon() + self.gastoExtra()
    method popularidad()
}


class BandaRock inherits Banda{
    const solosDeGuitarra

    override method gastoExtra() = 10000
    override method popularidad() = solosDeGuitarra * 100
}

class BandaTrap inherits Banda{
    const hielo

    override method gastoExtra() = 0
    method tieneHielo() = hielo > 0

    override method popularidad(){
        if(self.tieneHielo()){
            return 1000
        } else {
            return 0
        }
    }

    override method canon() = self.popularidad() * self.popularidad()
}


class BandaIndie inherits Banda{

    const instrumentos = []

    override method gastoExtra() = instrumentos.size() * 500

    override method popularidad() = nombre.length() * 3.14

}