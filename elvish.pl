% Base de conocimiento (estado incial, siguiente, caracter)
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

% Define estado de aceptación
estado_de_aceptacion(w).

% Verifica si los caracteres ingresados estan en la base de conocimiento
% comienza siempre desde el estado a
iniciar_automata(ChecarLista) :-
    verificar_automata(ChecarLista, a).

% Caso base: EL programa continua hasta que ya no mas caracteres, verifica
% que el estado actual(ultimo) sea el w. 
verificar_automata([], EstadoActual) :-
    estado_de_aceptacion(EstadoActual).

% Caso recursivo: Divide la lista y va recorriendose a el siguiente estado.
verificar_automata([Simbolo | RestoLista], EstadoActual) :-
    mover(EstadoActual, SiguienteEstado, Simbolo),
    verificar_automata(RestoLista, SiguienteEstado).

parma :-
    write('Parma'), nl,
    write('verdadero'), nl,
    iniciar_automata([p, a, r, m, a]).

pelargir :-
    write('Pelargir'), nl,
    write('verdadero'), nl,
    iniciar_automata([p, e, l, a, r, g, i, r]).

peredhel :-
    write('Peredhel'), nl,
    write('verdadero'), nl,
    iniciar_automata([p, e, r, e, d, h, e, l]).

palant1ri :-
    write('Palantíri'), nl,
    write('verdadero'), nl,
    iniciar_automata([p, a, l, a, n, t, 1, r, i]).

palantiri:-
    write('Palantiri'), nl,
    write('falso'), nl,
    iniciar_automata([p, a, l, a, n, t, i, r, i]).

parf :-
    write('Parf'), nl,
    write('verdadero'), nl,
    iniciar_automata([p, a, r, f]).
