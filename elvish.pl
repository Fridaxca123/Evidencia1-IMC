% Crear la base de conocimientos con estados y caracteres
mover(a, b, p).
mover(b, c, a).
mover(b, l, e).
mover(c, d, l).
mover(c, k, r).
mover(d, e, a).
mover(e, f, n).
mover(f, g, t).
mover(g, h, 1).
mover(h, i, r).
mover(i, w, i). 
mover(k, j, m).
mover(k, w, f). 
mover(j, w, a).
mover(l, m, l). 
mover(l, r, r).
mover(m, n, a).
mover(n, o, r).
mover(o, p, g).
mover(p, q, i).
mover(q, w, r).
mover(r, s, e).
mover(s, t, d).
mover(t, u, h).
mover(u, v, e).
mover(v, w, l).

% Estado de aceptación
estado_de_aceptacion(w).

% Función principal para iniciar el autómata
iniciar_automata(ChecarLista) :-
    verificar_automata(ChecarLista, a).

% Caso base: Si la lista está vacía, verifica si es un estado de aceptación
verificar_automata([], EstadoInicial) :-
    estado_de_aceptacion(EstadoInicial).

% Caso recursivo: Procesa el siguiente símbolo y avanza
verificar_automata([Simbolo | RestoLista], EstadoInicial) :-
    mover(EstadoInicial, SiguienteEstado, Simbolo),
    verificar_automata(RestoLista, SiguienteEstado).

parma :-
    write('Parma'), nl,
    write('Esperado: verdadero'), nl,
    iniciar_automata([p, a, r, m, a]).

pelargir :-
    write('Pelargir'), nl,
    write('Esperado: verdadero'), nl,
    iniciar_automata([p, e, l, a, r, g, i, r]).

peredhel :-
    write('Peredhel'), nl,
    write('Esperado: verdadero'), nl,
    iniciar_automata([p, e, r, e, d, h, e, l]).

palant1ri :-
    write('Palantíri'), nl,
    write('Esperado: verdadero'), nl,
    iniciar_automata([p, a, l, a, n, t, 1, r, i]).

palantiri:-
    write('Palantiri'), nl,
    write('Esperado: falso'), nl,
    iniciar_automata([p, a, l, a, n, t, i, r, i]).

parf :-
    write('Parf'), nl,
    write('Esperado: verdadero'), nl,
    iniciar_automata([p, a, r, f]).


