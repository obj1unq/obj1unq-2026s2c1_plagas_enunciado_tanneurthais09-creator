import plagas.* 
class Elementos{
  method esBueno() 
  method efecto(unaPlaga)
}

class Hogar inherits Elementos {
    var property mugre = 0 
    var property confort = 0 
    override method esBueno(){
        return mugre  < (self.confort() / 2)
    }

    override method efecto(unaPlaga){
        mugre += unaPlaga.nivelDeDaño()
        unaPlaga.efecto()
    }
}
class Huerta inherits Elementos {
    var property produccion = 0
    var property nivelDeProduccion = 0
    override method esBueno(){
        return produccion > nivelDeProduccion
    }
    
    override method efecto(unaPlaga){
        unaPlaga.efecto()
        if (unaPlaga.transmitenEnfermedades()){
            produccion = 0.max(produccion -(unaPlaga.nivelDeDaño() * (10/100)  + 10))
            
        } else { produccion -= 0.max(produccion - unaPlaga.nivelDeDaño() * (10/100)) }

    }
}

class Mascota inherits Elementos {
    var property nivelSalud = 0
    override method esBueno(){
        return nivelSalud > 250 
    }
    override method efecto(unaPlaga){
        if (unaPlaga.transmitenEnfermedades()){
            nivelSalud = 0.max(nivelSalud - unaPlaga.nivelDeDaño())
        }
        unaPlaga.efecto()
    }
    
}

object barrio  {
   var property listaDeElementos = []
    method esBueno(){
        return listaDeElementos.size()/2 < self.cantidadDeElemetosBuenos()
    }
    method cantidadDeElemetosBuenos(){
        return listaDeElementos.count({elemento => elemento.esBueno()})
    }
    method agregarElementos(unElemento){
        listaDeElementos.add(unElemento)
    }

}
