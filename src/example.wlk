import invitado.*
import disfraz.*

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














