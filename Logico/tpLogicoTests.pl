/*** TP del Paradigma Lógico ***/
/*** Grupo 03 ***/

:- include(tpLogicoModelo).

/* Estos tests son de muestra, reemplacen con los propios del TP */
:- begin_tests(bloque_tests_punto_1).
test(test_habilidades_emmaGoldman_son_armarBombas_y_judo, set(Habilidad = [armandobombas, judo])):-
    esBueno(emmaGoldman, Habilidad).
test(test_gustos_emmaGoldman_son_automovilismo_y_judo, set(Gusto=[automovilismo, judo])):-
    leGusta(emmaGoldman, Gusto).
:- end_tests(bloque_tests_punto_1).

%--------------------- test punto 3 ----------------------
:- begin_tests(bloque_tests_punto_3).
test(test_casaPapel_tiene_un_rebelde_juanSurino, nondet):-
    guaridaRebelde(casaPapel).
:- end_tests(bloque_tests_punto_3).
%---------------------------------------------------------

:- begin_tests(bloque_tests_punto_4).
test(test_vivienda_inhavitable):-
    no_hay_quien_viva(casaDelSolNaciente).
test(test_gustos_compartidos, set(Vivienda = [casaPapel,comisaria48])):-
    gustos_comun(Vivienda).
test(test_gustos_compartidos, set(CantViviendas = [2])):-
    cantidad_guaridas_rebeldes(CantViviendas).
:- end_tests(bloque_tests_punto_4).

:- begin_tests(bloque_tests_punto_5).
test(test_habilidades_terroristas, set(Quienes = [ravachol,rosaDubovsky,emmaGoldman,elisaBachofen,juanSuriano])):-
    habilidadTerrorista(Quienes).
test(test_son_buenos_o_no_tienen_gustos, set(Quienes = [bakunin, juanSuriano, judithButler, ravachol, rosaDubovsky, sebastienFaure])):-
    sonBuenosONoTienenGustos(Quienes).
test(test_tienen_mas_de_un_historial_o_viven_con_alguien_que_si, set(Quienes = [bakunin, elisaBachofen, emmaGoldman, juanSuriano, judithButler, ravachol, rosaDubovsky])):-
    tienenHistorialOVivenConAlguienQueSi(Quienes).
test(test_posibles_rebeldes, set(Quienes = [rosaDubovsky, juanSuriano, ravachol])):-
    rebelde(Quienes).
:- end_tests(bloque_tests_punto_5).

:- begin_tests(bloque_tests_punto_6).
    test(tenes_de_punto_6,set(Superficie = [13])) :-
    vivienda(Vivienda, caracteristicas(_,Partes)),
    member(supInterna(SubInterna),Partes),
    member(pasadizos(Pasadizos),Partes),
    member(perimetroAcceso(PerimetroAcceso),Partes),
    superficieTunal(Vivienda,TunelMetros),
    superficieCuartos(Vivienda,MetrosCuartos),
    is(Superficie, PerimetroAcceso + SubInterna + MetrosCuartos + Pasadizos + (TunelMetros * 2)).
:- end_tests(bloque_tests_punto_6).
