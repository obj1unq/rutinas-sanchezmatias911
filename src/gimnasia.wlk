
// RUTINAS
class Rutina {
    
    var property intensidad

    method descanso(tiempo)

    method intensidad() = intensidad

    method caloriasQueQuema(tiempo) {
        return  100 * (tiempo - (self.descanso(tiempo))) * (self.intensidad())
    }
}    

class Running inherits Rutina{
    

     override method descanso(tiempo) {
           if (tiempo>20) {return 5}
           else {return 2}
    }
}

class Maraton inherits Running {


    override method caloriasQueQuema(tiempo){
        return  super(tiempo) * 2
    }
}

class Remo inherits Rutina{

    override method intensidad() = 1.3

    override method descanso(tiempo) = tiempo / 5
}

class RemoDeCompetision inherits Remo{
    override method intensidad() = 1.7

    override method descanso(tiempo){
        return (super(tiempo) -3).max(2)
    }

   
}

class Persona{
    var property peso

    method cuantoPesoPierdo(rutina) {
        return rutina.caloriasQueQuema(self.tiempoQueEntrena()) / 
               self.kilosPorCaloriaQuePierde()
    }

    method aplicarRutina(rutina)
        
    

    method kilosPorCaloriaQuePierde()

    method tiempoQueEntrena()

    
   
    
}

class PersonaSedentaria inherits Persona{

    const  tiempo
    override method kilosPorCaloriaQuePierde() = 7000

    override method tiempoQueEntrena() = tiempo

    override  method aplicarRutina(rutina){
        if(self.puedoEntrenar()){
            peso -= self.cuantoPesoPierdo(rutina)
        }
     }

    method puedoEntrenar() = self.peso()>50

}

class PersonaAtleta inherits Persona{
    override method cuantoPesoPierdo(rutina){
        return super(rutina) - 1
    }

    override method kilosPorCaloriaQuePierde() = 8000

    override method tiempoQueEntrena() = 90

    override method aplicarRutina(rutina){
        if(self.puedoEntrenar(rutina)){
             peso -= self.cuantoPesoPierdo(rutina)
        }
    }

     method puedoEntrenar(rutina) = self.cuantoPesoPierdo(rutina)>10000
}



