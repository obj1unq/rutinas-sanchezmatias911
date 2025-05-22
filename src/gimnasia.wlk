
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

    method aplicarRutina(rutina){
            self.validarRutina(rutina)
            peso -= self.cuantoPesoPierdo(rutina)
        
     }
        
    method kilosPorCaloriaQuePierde()
    
    method tiempoQueEntrena() 

    method validarRutina(rutina){
        if(not self.puedoEntrenar(rutina)){
            self.error("No puedo realizar la rutina")
        }
    }

    method puedoEntrenar(rutina)

    //metodo para usar en club
    method caloriasGastadasEnRutinas(setRutinas){
        return setRutinas.sum({r=> self.cuantoPesoPierdo(r)})
    }

    method laRutinaEsTranqui(rutina){
        return rutina.caloriasQueQuema(self.tiempoQueEntrena())<500
    }

    
}
class PersonaSedentaria inherits Persona{

    const tiempo

    override method kilosPorCaloriaQuePierde() = 7000

    override method tiempoQueEntrena() = tiempo

    override method puedoEntrenar(rutina) = self.peso()>50
}
class PersonaAtleta inherits Persona{

    
    
    override method cuantoPesoPierdo(rutina){
        return super(rutina) - 1
    }

    override method kilosPorCaloriaQuePierde() = 8000

    override method tiempoQueEntrena() = 90

    override method puedoEntrenar(rutina) = rutina.caloriasQueQuema(self.tiempoQueEntrena())>10000
}

    
class Club{
    const predios = #{}

    method elMejorPredioPara(persona){
        return predios.max({p => persona.caloriasGastadasEnRutinas(p.rutinasPredio())})
    }
       
    method prediosTranquis(persona){
        return predios.filter({p=>p.tieneAlgunaRutinaTranqui(persona)})
    }

    method rutinasMasExigentes(persona){
        return predios.map({p => p.rutinaMasExigente(persona.tiempoQueEntrena())}).asSet()
    }
}

class Predio{
    const rutinasPredio = #{}

    method rutinasPredio() = rutinasPredio

    method tieneAlgunaRutinaTranqui(persona){
        return rutinasPredio.any({r => persona.laRutinaEsTranqui(r)})
    }

    method rutinaMasExigente(tiempo){
       return  rutinasPredio.max({r => r.caloriasQueQuema(tiempo)})
    }
}    




   

    









   





