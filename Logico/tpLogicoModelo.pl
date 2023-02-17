/*** TP del Paradigma Lógico ***/
/*** Grupo 03 ***/

/*** INICIO BASE DE CONOCIMIENTO ***/
ciudadano(bakunin).
ciudadano(ravachol).
ciudadano(rosaDubovsky).
ciudadano(emmaGoldman).
ciudadano(judithButler).
ciudadano(elisaBachofen).
ciudadano(juanSuriano).
ciudadano(sebastienFaure).

trabaja(bakunin, aviacionMilitar).
trabaja(ravachol, inteligenciaMilitar).
trabaja(emmaGoldman, profeJudo).
trabaja(emmaGoldman, cineasta).
trabaja(judithButler, profeJudo).
trabaja(judithButler, inteligenciaMilitar).
trabaja(elisaBachofen, ingeMecanica).

esBueno(bakunin, conduciendoAutos).
esBueno(ravachol , tiroAlBlanco).
esBueno(rosaDubovsky , construyendoPuentes).
esBueno(rosaDubovsky , mirandoPeppaPig).
esBueno(elisaBachofen, armandobombas).
esBueno(judithButler, judo).
esBueno(emmaGoldman,EsBuena):-
    esBueno(elisaBachofen, EsBuena).
esBueno(emmaGoldman,EsBuena):-
    esBueno(judithButler, EsBuena).
esBueno(juanSuriano, armandobombas).
esBueno(juanSuriano, rinRaje).
esBueno(juanSuriano, judo).

leGusta(ravachol, juegosAzar).
leGusta(ravachol, ajederez).
leGusta(ravachol, tiroAlBlanco).
leGusta(rosaDubovsky , construyendoPuentes).
leGusta(rosaDubovsky , mirandoPeppaPig).
leGusta(rosaDubovsky, fisicaCuantica).
leGusta(judithButler, judo).
leGusta(judithButler, automovilismo).
leGusta(emmaGoldman, LeGusta) :-
    leGusta(judithButler, LeGusta).
leGusta(elisaBachofen, fuego).
leGusta(elisaBachofen, destruccion).
leGusta(juanSuriano, armandobombas).
leGusta(juanSuriano, rinRaje).
leGusta(juanSuriano, judo).

tieneAntecedentes(bakunin, roboAeronave).
tieneAntecedentes(bakunin, fraude).
tieneAntecedentes(bakunin, tenenciaCafeina).
tieneAntecedentes(ravachol , fraude).
tieneAntecedentes(ravachol , falsificacionVacunas).
tieneAntecedentes(judithButler, fraude).
tieneAntecedentes(judithButler, tenenciaCheques).
tieneAntecedentes(juanSuriano, fraude).
tieneAntecedentes(juanSuriano, falsificacionDinero).
/*** FIN BASE DE CONOCIMIENTO ***/

/*** PUNTO 2 ***/
/* CARACTERISTICAS : ocupantes , partes de la casa
 */
vivienda(laSeverino, caracteristicas(
    [bakunin, elisaBachofen, rosaDubovsky],
    [cuarto(32), pasadizos(1), tunel(8), tunel(5)])).

vivienda(comisaria48, caracteristicas([ravachol], [])).

vivienda(casaPapel, caracteristicas(
    [emmaGoldman, judithButler, juanSuriano],
    [cuarto(15), cuarto(28), pasadizos(2), tunel(9), tunel(2)])).

vivienda(casaDelSolNaciente ,caracteristicas([] ,[pasadizos(1)])).

/*** PUNTO 6 ***/
/* No habria porque modificar nuestra solucion ya que podriamos considerar el perimetro interno del bunker 
    como un cuarto y el perimetro de acceso como un tunel secreto. */

   vivienda(laCasaDePatricia, caracteristicas(
    [sebastienFaure],
    [supInterna(10),
    pasadizos(1), 
    perimetroAcceso(2)])).

/* laCasaDePatricia tiene acoplamiento con sebastienFaure , un pasadiso y un bunker */

/*** PUNTO 3 ***/
guaridaRebelde(Vivienda) :-
    vivienda(Vivienda, caracteristicas(Ocupantes, _)),
    member(Ocupante, Ocupantes),
    rebelde(Ocupante),
    superficieClandestina(Vivienda). 

superficieClandestina(Vivienda) :-
    vivienda(Vivienda, caracteristicas(_,Partes)),
    member(pasadizos(Pasadizos),Partes),
    superficieTunal(Vivienda,TunelMetros),
    superficieCuartos(Vivienda,MetrosCuartos),
    is(Superficie, MetrosCuartos + (TunelMetros * 2) + Pasadizos),
    Superficie >= 50.

superficieTunal(Vivienda,TunelMetros) :-
    findall(Medida,
    (vivienda(Vivienda, caracteristicas(_,Partes)),member(tunel(Medida),Partes)),
    Medidas),
    sum_list(Medidas,TunelMetros).
    
superficieCuartos(Vivienda,MetrosCuartos) :-
    findall(Medida,(vivienda(Vivienda, caracteristicas(_,Partes)),member(cuarto(Medida),Partes)),Medidas),
    sum_list(Medidas,MetrosCuartos).

/*** PUNTO 4 ***/
no_hay_quien_viva(Vivienda):-
    vivienda(Vivienda, caracteristicas([],_)).

gustos_comun(Vivienda) :-
    vivienda(Vivienda, caracteristicas(Integrantes,_)),
    member(Integrante,Integrantes),
    leGusta(Integrante,Gusto),
    forall(member(OtroIntegrante,Integrantes),leGusta(OtroIntegrante,Gusto)).

cantidad_guaridas_rebeldes(Cantidad_viviendas) :-
    findall(ViviendaRebelde, guaridaRebelde(ViviendaRebelde), Viviendasrebeldes),
    length(Viviendasrebeldes, Cantidad_viviendas).
    
/*** PUNTO 5 ***/
rebelde(Ciudadano) :-
    ciudadano(Ciudadano),
    habilidadTerrorista(Ciudadano),
    sonBuenosONoTienenGustos(Ciudadano),
    tienenHistorialOVivenConAlguienQueSi(Ciudadano).

habilidadTerrorista(Ciudadano) :-
    esBueno(Ciudadano, Habilidad), 
    member(Habilidad, [armandobombas, mirandoPeppaPig, tiroAlBlanco]).

tienenHistorialOVivenConAlguienQueSi(Ciudadano) :-
    ciudadano(Ciudadano),
    tienenMasDeUnRegistro(Ciudadano).

tienenHistorialOVivenConAlguienQueSi(Ciudadano) :-
    vivienda(_, caracteristicas(Ocupantes,_)),
    member(Ciudadano, Ocupantes),
    findall(Ocupante, (member(Ocupante, Ocupantes), Ciudadano \= Ocupante, not(tienenMasDeUnRegistro(Ciudadano)), tienenMasDeUnRegistro(Ocupante)), TienenHistorial),
    length(TienenHistorial, Cantidad),
    Cantidad >= 1.

tienenMasDeUnRegistro(Ciudadano) :-
    ciudadano(Ciudadano),
    findall(Ciudadano, tieneAntecedentes(Ciudadano, _), Registros),
    length(Registros, Cantidad),
    Cantidad > 1.
    
sonBuenosONoTienenGustos(Ciudadano) :-
    ciudadano(Ciudadano),
    not(leGusta(Ciudadano, _)).

sonBuenosONoTienenGustos(Ciudadano) :-
    ciudadano(Ciudadano),
    not(not(leGusta(Ciudadano, _))),
    findall(EsBueno, esBueno(Ciudadano, EsBueno), EsBuenoEn),
    findall(LeGusta, leGusta(Ciudadano, LeGusta), LoQueLeGusta),
    forall(member(Cosa, EsBuenoEn), member(Cosa, LoQueLeGusta)).

/*** PUNTO 7 ***/
batallon_rebeldes(Batallon) :-
    findall(Ciudadano, (ciudadano(Ciudadano), tienenHistorialOVivenConAlguienQueSi(Ciudadano)), Batallon),
    findall(Habilidad, habilidad(Habilidad, Batallon), Habilidades),
    length(Habilidades, TotalHabilidades),
    TotalHabilidades > 3.
    
habilidad(Habilidad, Batallon) :-
    member(Rebelde, Batallon), 
    forall(esBueno(Rebelde, Habilidad), esBueno(_, Habilidad)).