
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

class Maraton inherits Rutina {


    override method caloriasQueQuema(tiempo){
        return  (100 * (tiempo - (self.descanso(tiempo))) * (self.intensidad())) * 2
    }
}

class Remo inherits Rutina{

    override method intensidad() = 1.3

    override method descanso(tiempo) = tiempo / 5
}

class RemoDeCompetision inherits Rutina{
    override method intensidad() = 1.7

    override method descanso(tiempo){
        return self.descansoRemoNormal(tiempo).max(2)
    }

    method descansoRemoNormal(tiempo) = tiempo / 5
}