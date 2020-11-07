import example.*
import invitado.*

class Disfraz{
	var nombre = ""
	var caracteristicas = [] // capaz seria mejor un conjunto pero bue
	method agregarCaracteristicas(nuevaCar){
		caracteristicas.add(nuevaCar)
	}
	method calcularPuntaje(){
		return caracteristicas.sum({caracteristica => caracteristica.puntaje()})
	}
	
}

class Caracteristica{
	method puntaje(persona,fiesta){
		return 0
	}
}

class Gracioso inherits Caracteristica{
    var nivelGracia
    override method puntaje(persona,fiesta){
    	if(persona.edad() >= 50){
    		return nivelGracia * (persona.edad())
    	}
    	else{
    		return nivelGracia
    	}
    }
}

class Tobaras inherits Caracteristica{
	var fechaDeCompra
	override method puntaje(persona,fiesta){
		if((fiesta.fecha()) >= (fechaDeCompra - 2)){ // Ya se que no seria asi pero me chupa un huevo
			return 5
		}
		else{
			return 3
		}
	}
}

class Careta inherits Caracteristica{
	var puntajePersonaje
	override method puntaje(persona,fiesta){
		return puntajePersonaje
	}
}

class Sexy inherits Caracteristica{
	override method puntaje(persona,fiesta){
		if(persona.esSexy()){
			return 15
		}
		else{
			return 2
		}
	}
}
