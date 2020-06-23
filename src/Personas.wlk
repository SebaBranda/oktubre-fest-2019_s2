import carpas.*
import cervezas.*
import Nacionalidades.*

class Persona {
	
	const peso = 0
	const nivelDeAguante = 0
	const property jarrasConsumidas = []
	var property esTradicional = false
	var property totalAlcoholConsumido = 0
	
	method comprarJarra(unaJarra){
		jarrasConsumidas.add(unaJarra)
		totalAlcoholConsumido += unaJarra.cantidadDeAlcohol()
	}
	
	method paisDeOrigen()
	
	method totalJarrasConsumidas(){
		return jarrasConsumidas.size()
	}
	method estaEbrio(){
		return totalAlcoholConsumido * peso > nivelDeAguante
	}
	
	method leGusta(unaBirra){
		return true
	}
	method ebrioEmpedernido(){
		return jarrasConsumidas.all({jarra=>jarra.capacidad() >= 1})
			and self.estaEbrio()
	}
	
	method esPatriota(){
		return jarrasConsumidas.all({jarra=>jarra.marca().paisDeOrigen() == self.paisDeOrigen()})
	}
	
	method quieroEntrarAUnaCarpa(unaCarpa)
	
	method puedeEntrarA(unaCarpa){
		return self.quieroEntrarAUnaCarpa(unaCarpa) and
			   unaCarpa.permitirIngreso(self)
	}
	
	method reponerse(){
		jarrasConsumidas.clear()
		totalAlcoholConsumido /= 2
	}	
}	

class Belga inherits Persona {
	
	const paisDeOrigen = belgica
	
	override method leGusta(unaBirra){
		return unaBirra.lupulos() > 4
	}
	override method quieroEntrarAUnaCarpa(unaCarpa){
		return self.leGusta(unaCarpa.marca()) and 
			   self.esTradicional()==unaCarpa.bandaMusical()
	}
	
	override method paisDeOrigen(){
		return paisDeOrigen
	}
		
}

class Checo inherits Persona {
	
	const paisDeOrigen = checoslovaquia
	
	override method leGusta(unaBirra){
		return unaBirra.graduacion() > 0.08
	}
	
	override method quieroEntrarAUnaCarpa(unaCarpa){
		return self.leGusta(unaCarpa.marca())
	}
	
	override method paisDeOrigen(){
		return paisDeOrigen
	}
}

class Aleman inherits Persona {
	
	const paisDeOrigen = alemania
	
	override method quieroEntrarAUnaCarpa(unaCarpa){
		return unaCarpa.totalDePersonas().even()
	}
	
	override method paisDeOrigen(){
		return paisDeOrigen
	}
		
}	



	
	

