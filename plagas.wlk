class Plagas {
    var property poblacion = 0
    method transmitenEnfermedades(){
        poblacion > 10
    }
    method nivelDeDaño()
    method poblacion (){
        return poblacion
    }
    method efecto(){
        poblacion += poblacion% 90
    }
}

class Cucarachas inherits Plagas{
    var property pesoPromedio = 8
    var property polbacion = 30
    override method  nivelDeDaño(){
         return self.poblacion() / 2
    }
    override method poblacion(){
        return polbacion
    }
    override method transmitenEnfermedades(){
        self.pesoPromedio() > 10 and super() 
    }
    method pesoPromedio (){
        return pesoPromedio 
    }
    override method efecto() {
        poblacion += 2
        pesoPromedio += 2 
    }
}
class Pulgas inherits Plagas {
    override method nivelDeDaño(){
        return poblacion * 2
    }

}
class Garrapatas inherits Pulgas {
   override method efecto() {
        poblacion += poblacion*80 
   }
}

class Mosquitos inherits Plagas {
    override method transmitenEnfermedades(){
        (self.poblacion() %3 == 0 and super())
    }
    override method nivelDeDaño(){
        self.poblacion()
    }
}