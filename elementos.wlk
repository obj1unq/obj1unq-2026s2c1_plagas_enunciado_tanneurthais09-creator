import plagas.* 
class Elementos{
  method esBueno() 
  method efecto(unaPlaga)
}

class Hogar inherits Elementos {
    var property mugre = 0 
    var property confort = 100 
    override method esBueno(){
        return mugre  < (self.confort() / 2)
    }

    override method efecto(unaPlaga){
        mugre = unaPlaga.nivelDeDaño()
    }
}
class Huerta inherits Elementos {
    var property produccion = 0
    var property nivelDeProduccion = 0
    override method esBueno(){
        return produccion > nivelDeProduccion
    }
    
    override method efecto(unaPlaga){
        if (unaPlaga.enfermedades()){
            produccion -= (unaPlaga.nivelDeDaño() * 10 ) - 10
        } else {
        produccion -= unaPlaga.nivelDeDaño() * 10  }

    }
}

class Mascotas inherits Elementos {
    var property nivelSalud = 100 
    override method esBueno(){
        return nivelSalud > 250 
    }
    override method efecto(unaPlaga){
        if (unaPlaga.enfermedades()){
            nivelSalud = unaPlaga.nivelDeDaño()
        }
    }
    
}

class Barrio  {
   var property listaDeElementos = []
    method esBueno(){
        return listaDeElementos.size()/2 < self.cantidadDeElemetosBuenos()
    }
    method cantidadDeElemetosBuenos(){
        return listaDeElementos.count({elemento => elemento.esBueno()})
    }
}