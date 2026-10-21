class Plaga {
    var property poblacion = 0
    method transmitenEnfermedades() = poblacion >= 10
    

    method nivelDeDaño()

    method efecto(){
        poblacion += poblacion * (10/100)
    }
}

class Cucaracha inherits Plaga{
    var property pesoPromedio = 0

    override method nivelDeDaño(){
         return self.poblacion() / 2
    }
    override method transmitenEnfermedades(){
        return pesoPromedio > 10 && super()
    }
    override method efecto() {
        pesoPromedio += 2 
        super()
    }
}
class Pulga inherits Plaga {
    override method nivelDeDaño(){
        return poblacion * 2
    }

}
class Garrapata inherits Pulga {
   override method efecto() {
        poblacion += poblacion*(20/100)
   }

}

class Mosquito inherits Plaga {
    override method transmitenEnfermedades(){
        return poblacion %3 == 0 and super()
    }
    override method nivelDeDaño(){
        return poblacion
    }
}