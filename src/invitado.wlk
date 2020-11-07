import example.*
import disfraz.*

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
