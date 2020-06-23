import Nacionalidades.*

class MarcaCerveza {
	
	var property lupulos = 0
	var property paisDeOrigen
	var property graduacion = 0
	
}

class Rubia inherits MarcaCerveza {
			
}


class Negra inherits MarcaCerveza {
	
	
	override method graduacion(){
		return graduacionReglamentaria.graduacion().min(lupulos * 2) 
	}
	
}

class Roja inherits Negra {
	
	override method graduacion(){
		return super() * 1.25
	}
	
}
object graduacionReglamentaria {
	
	var property graduacion = 0
}

class Jarra {
	
	var property capacidad = 0
	var property marca
	
	method cantidadDeAlcohol(){
		return capacidad * marca.graduacion()
	}	

} 

