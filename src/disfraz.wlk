import example.*
import invitado.*

class Disfraz{
	var nombre = ""
	var caracteristicas = [] // capaz seria mejor un conjunto pero bue
	var nivelGracia
	var fechaDeCompra
	var puntajePersonaje
	method agregarCaracteristicas(nuevaCar){
		caracteristicas.add(nuevaCar)
	}
	method calcularPuntaje(persona,fiesta){
		return caracteristicas.sum({caracteristica => caracteristica.puntaje(self,persona,fiesta)})
	}
	method nivelDeGracia(){
		return nivelGracia
	}
	method fechaDeCompra(){
		return fechaDeCompra
	}
	method puntajePersonaje(){
		return puntajePersonaje
	}
	
}

class Caracteristica{
	method puntaje(disfraz,persona,fiesta){
		return 0
	}
}

object gracioso inherits Caracteristica{
    override method puntaje(disfraz,persona,fiesta){
    	if(persona.edad() >= 50){
    		return disfraz.nivelGracia() * (persona.edad())
    	}
    	else{
    		return disfraz.nivelGracia()
    	}
    }
}

object tobaras inherits Caracteristica{
	override method puntaje(disfraz,persona,fiesta){
		if((fiesta.fecha()) >= (disfraz.fechaDeCompra() - 2)){ // Ya se que no seria asi pero me chupa un huevo
			return 5
		}
		else{
			return 3
		}
	}
}

object careta inherits Caracteristica{
	override method puntaje(disfraz,persona,fiesta){
		return disfraz.puntajePersonaje()
	}
}

object sexy inherits Caracteristica{
	override method puntaje(disfraz,persona,fiesta){
		if(persona.esSexy()){
			return 15
		}
		else{
			return 2
		}
	}
}
