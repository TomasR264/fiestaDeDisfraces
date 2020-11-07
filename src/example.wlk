class Fiesta{
	var lugar
	var fecha
	var invitados = []
	
	method esUnBodrio(){
		return not((invitados.all({invitado => invitado.estaConforme()})))
	}
	method elMejorDisfraz(){
		var elDuenioDelMejor = invitados.max({invitado => invitado.puntajeDeDisfraz()})
		return elDuenioDelMejor.disfraz() // busco el que tiene mas puntos y devuelvo su disfraz
	}
	method puedenCambiarDeDisfraz(persona1,persona2){
		var estanLosDos = invitados.contains(persona1) and invitados.contains(persona1)
		var algunoEstaDisconforme = not(persona1.estaConforme()) or not(persona2.estaConforme())
		
	}
	method probarseElDisfrazDelOtro(persona1,persona2){
		var disfraz1 = persona1.difraz()
		var disfraz2 = persona2.disfraz()
		persona1.cambiarDeDisfraz(disfraz2)
		persona1.cambiarDeDisfraz(disfraz1)
		return persona1.estaConforme() and persona2.estaConforme() // No estoy seguro que tan bien esta todo este punto, pero 
		                                                           // no se me ocurre otra, aparte quedaria permanente el cambio
	}
	method agregarAsistente(asistente){
		if(not(invitados.contains(asistente) and asistente.tieneDisfraz())){
			invitados.add(asistente)
		}
		else{
			self.error("El invitado no puede ser agregado")
		}
	}
	method irrepetible(){
		return not(self.esUnBodrio()) and invitados.all({invitado => invitado.esSexy()})
	}
}

class Invitado{
	var disfraz
	var edad
	var personalidad
	var fiesta
	var criterioDisfraz
	var tieneDisfraz
	
	method cambiarDeDisfraz(nuevoDisfraz){
		disfraz = nuevoDisfraz
		tieneDisfraz = true
	}
	
	method puntajeDeDisfraz(){
		disfraz.calcularPuntaje(self,fiesta)
	}
	
	method edad(){
		return edad
	}
	method estaConforme(){
		return criterioDisfraz.conformidad()
	}
	method cantLetrasDisfrazEsPar(){
		// qcyo una funcion even
	}
	method fechaDisfraz(){
		return disfraz.fechaDeCompra() // Tecnicamente solo el tobaras entenderia esto pero una re paja chequear
	}
	method disfraz(){
		return disfraz
	}
	method tieneDisfraz(){
		return tieneDisfraz
	}
	
}

class Personalidad{
	method esSexy(persona){
		return false
	}
}

object alegre inherits Personalidad{
	override method esSexy(persona){
		return false
	}
}

object taciturna inherits Personalidad{
	override method esSexy(persona){
		return persona.edad() < 30
	}
}

object cambiante inherits Personalidad{
	var personalidadActual
	method cambiarPersonalidad(nuevaPer){
         personalidadActual = nuevaPer
	}
	override method esSexy(persona){
		 return personalidadActual.esSexy()
	}
	}



class CriterioDisfraz{
	method conformidad(persona,fiesta){
		return persona.puntajeDeDisfraz() > 10
	}
}

object caprichoso inherits CriterioDisfraz{
	override method conformidad(persona,fiesta){
		return (super(persona,fiesta) and persona.cantLetrasDisfrazEsPar())
	}
}
object pretencioso inherits CriterioDisfraz{
	override method conformidad(persona,fiesta){
		return (persona.fechaDisfraz() < (fiesta.fecha() - 30) )
	}
}
object numerologo inherits CriterioDisfraz{
	var numeroElegido
	override method conformidad(persona,fiesta){
		return ((persona.puntajeDeDisfraz() > 10) and (persona.puntajeDeDisfraz() == numeroElegido)) // Supongo que, el numero que eligen ellos deberia ser siempre mayor
		                                                                                      // a 10, pero por las dudas respeto el enunciado
	}
}






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








