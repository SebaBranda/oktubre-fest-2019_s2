import Personas.*
import cervezas.*

class Carpa {
	
	var property marca
	var property capacidadPublica = 0
	var property bandaMusical = false
	var property personasEnCarpa = #{}	
			
	method setBandaMusical(){
		bandaMusical = not bandaMusical
	}
		
	method ingresarPersona(unaPersona){
		personasEnCarpa.add(unaPersona)
	}
	method retirarPersona(unaPersona){
		personasEnCarpa.delete(unaPersona)
	}
	method totalDePersonas(){
		return personasEnCarpa.size()
	}
	
	method hayLugar(){
		return personasEnCarpa.size() < capacidadPublica
	}	
	
	method permitirIngreso(unaPersona){
		return self.hayLugar() and not unaPersona.estaEbrio()
	}
	
	method ingresarACarpa(unaPersona){
		if  (unaPersona.puedeEntrarA(self)){		
			self.ingresarPersona(unaPersona)}
		else{
			self.error("No pasas!, Por que? No hay porque.")
		}	
	}
	
	method venderJarra(unaPersona, litros){
		if (self.estaEnLaCarpa(unaPersona)){
			const jarra = new Jarra(marca = self.marca(), capacidad=litros)
			unaPersona.comprarJarra(jarra)}
		else{
			self.error("Nooo negro, disculpame, para afuera no me dejan vender.")
		}
	}
	
	method estaEnLaCarpa(unaPersona){
		return personasEnCarpa.contains(unaPersona)
	}
	
	method ebriosEmpedernidos(){
		return personasEnCarpa.count({persona=>persona.ebrioEmpedernido()})
	}	
}
