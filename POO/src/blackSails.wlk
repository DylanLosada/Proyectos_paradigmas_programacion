/** 
*	TP 1 Objetos
*
*	Dylan Losada.
*	Tomas Garais.
*/
object jhon {
	var corajeBase = 120;
	const armaPrimaria = espada;
	var armaSeundaria = pistola;
	
	method setArmaSecundaria(_armaSecundaria) {
		armaSeundaria = _armaSecundaria;
	}
	
	method getArmaSecundaria() {
		return armaSeundaria;
	}
	
	method getCorajeBase() {
		return corajeBase;
	}
	
	method setCorajeBase(_corajeBase) {
		corajeBase = _corajeBase;
	}
	
	method getCorajeTotal() {
		return corajeBase + armaPrimaria.coraje() + armaSeundaria.coraje();
	}
}

/**
	ARMAMENTO.
 */
object espada {	
	const coraje = 10;
	
	method coraje() {
		return coraje;
	}
}

object pistola {
	var calibrePistola = 20;
	var materialPistola = "marfil";	
	
	method setCalibrePistola(_calibrePistola) {
		calibrePistola = _calibrePistola;
	}
	
	method setMaterialPistola(_materialPistola) {
		materialPistola = _materialPistola;
	}
		
	method coraje() {
		return calibrePistola * materialPistola.length();
	}
}

object banjo {
	var corajeBase = 0;
	
	method setCorajeBase(_corajeBase) {
		corajeBase = _corajeBase;
	}
	
	method coraje() {
		return corajeBase / 2;
	}
}

/** EMBACACION */
object walrus {
	const capitan = jhon;
	var canionWalrus = canion;
	
	method setCanion(_canion) {
		canionWalrus = _canion;
	}
	
	method danioProducido() {
		return canionWalrus.danio();
	}
	
	method poderPirata() {
		return capitan.getCorajeTotal() + self.danioProducido();
	}
}

object canion {
	var poderInicial = 0;
	var anios = 0;
	var longitud = 0;
	
	method setPoderInicial(_poderInicial) {
		poderInicial = _poderInicial;
	}
	
	method setAnios(_anios) {
		anios = _anios;
	}
	
	method setLongitud(_longitud) {
		longitud = _longitud;
	}
	
	method danio() {
		return poderInicial * longitud * self.desgaste();
	}
	
	method desgaste() {
		return 1 - (anios/100);
	}
}

