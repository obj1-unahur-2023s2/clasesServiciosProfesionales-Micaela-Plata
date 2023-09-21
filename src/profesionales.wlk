// esta clase está completa, no necesita nada más
class ProfesionalAsociado {
	var property universidad
	
	method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	method honorariosPorHora() { return 3000 }
	method trabajanALoSumoEn3Provincias() = true
	
	method cobroDeImporte(total) {
		asociacionDeProfesionalesDelLitoral.nuevaDonacion(total)
	}
}

object asociacionDeProfesionalesDelLitoral {
	var donacionesRecibidas
	
	method donacionesRecibidas() { return donacionesRecibidas }
	
	method nuevaDonacion(importe) {
		donacionesRecibidas += importe
	}
}

// a esta clase le faltan métodos
class ProfesionalVinculado {
	var property universidad
	
	method honorariosPorHora() { return universidad.cuantoRecomendasCobrarPorHora() }
	method provinciasDondePuedeTrabajar() = [universidad.provinciaDondeEsta()] //Forzado a ser una lista para el method esDeGenteAcotada()
	method trabajanALoSumoEn3Provincias() = true
	
}

// a esta clase le faltan atributos y métodos
class ProfesionalLibre {
	var property universidad
	var property honorariosPorHora
	var property provinciasDondePuedeTrabajar = []
	
	method trabajanALoSumoEn3Provincias() = provinciasDondePuedeTrabajar.size() <= 3
	
	method agregarProvincia(provincia) {
		provinciasDondePuedeTrabajar.add(provincia)
	}
	
}

class Universidad {
	var cobroRecomendado
	const provinciaDondeEsta
	
	method cuantoRecomendasCobrarPorHora() = cobroRecomendado
	method provinciaDondeEstas() = provinciaDondeEsta
	
	method donacionesRecibidas() {}
}

class Empresa {
	const profesionales = []
	var honorarioDeReferencia
	
	method contratar(prof) {
		profesionales.add(prof)
	}
	method cuantosEstudiaronEn(uni) = profesionales.count({prof => prof.estudioEn(uni)})
	
	method profesionalesCaros() = profesionales.filter{prof => prof.honorariosPorHora()>honorarioDeReferencia}
	
	method universidadesFormadoras() = profesionales.map{prof => prof.universidad()}.asSet()
	
	method profecionalMasBarato() = profesionales.min {prof => prof.honorariosPorHora()}
	
	method esDeGenteAcotada() = profesionales.all { prof => prof.trabajanALoSumoEn3Provincias()}
	
	method puedeSatisfacerASolicitante(soc){}
}




class SolicitantePersona {
	var proviciaQueReside
	
	method puedeSerAtendidoPorProfesional(prof) {puedeSerAtendidoPorProfesional}
} 

class SolicitanteInstitucion {
	const universidadesReconocidas = []
	
	method puedeSerAtendidoPorProfesional() {}
}	
	
}
