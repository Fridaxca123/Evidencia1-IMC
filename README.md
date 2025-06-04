# Evidencia 1: Implementación de métodos computacionales

**Frida Xcaret Vargas Trejo - A01707168**

## Descripción

La categoría de lenguaje que se me asigno para esta entrega se llama *Elven*, también conocido como lenguas élficas. Estas lenguas son un conjunto de idiomas ficticios creados por el escritor J.R.R. Tolkien para sus obras literarias, como *El Señor de los Anillos*. "Entre las lenguas más destacadas creadas por Tolkien se encuentran el **Quenya** y el **Sindarin**, las cuales están inspiradas en el finlandés, latín y galés". 

### Palabras modeladas

Las palabras que modelare con mi automata son las siguientes:

- **Parma**: Quenya para "Libro" ("Book").
- **Pelargir**: Sindarin para "Garth of Royal Ships" ("Puerto de las Naves Reales").
- **Peredhel**: Sindarin para "Half-elvish" o "Half-elf" ("Medio-elfo").
- **Palantíri**: Quenya para "Far seeing" ("Visión lejana"), hace referencia a las piedras videntes (*Seeing-Stones*).
- **Parf**: Variante en Sindarin de "Parma" ("Libro").

### DFA vs. NFA

Los autómatas finitos son maquinas abstractas que representan procesos secuenciales, con el proposito de formar un entendimiento basico de los lenguajes regulares en la computación. Consisten en estados, transiciones e input simbols, que se procesan de manera individual.  Un Automata Finito Deterministico (AFD) consta de:

-Un **conjunto finito de estados** -> Q

-Un **alfabeto** (conjunto de simbolos o letras) -> Σ

-**Transiciones** -> δ

-Un **estado inicial**

-Uno o más **estados finales**.

Se representa gráficamente con un grafo, donde los nodos son los estados y las flechas las transiciones. Cada transición está etiquetada con un símbolo del alfabeto representando el input symbol para realizar la transición.

Existen dos tipos principales de automatas finitos:

- **DFA (Deterministic Finite Automata)**: Un automata finito deterministico, tiene como caracteristica que por cada input symbol solo hay un estado resultante, osea una sola transición posible .
  
![Autómata](/NFA.png)

Este automata puede producir numeros que comiencen con 1 y le sigan 0. Como podemos observar es un automata finito debido a que solo existe una transición del mismo simbolo por estado. 

- **NFA (Non-Deterministic Finite Automata)**: Un automata finito no deterministico permite múltiples transiciones para el mismo input symbol desde un mismo estado y acepta transiciones vacías.

![Autómata](/DFA.png)

Este automata puede cadenas de este tipo bbabb, también acepta transiciónes nulas. Como podemos observar es un automata finito debido a que existe mas de una transición del mismo simbolo por estado. 


## Modelos

**Para este proyecto, implementare el automata DFA (debido a que solo son 5 palabras y se opueden implementar estados con una sola transición) y la expresion regular para modelar mi lenguaje debido a que este es de Tipo 2 (Gramatica regular).**

EL primer paso due definir el alfabeto que mi automata aceptara, solo seran validos los siguientes caracteres:

**∑ = {a, d, e, f, g, h, i, í, l, m, n, p, r, t}**

Cualquier carácter que no esté incluido en el alfabeto o en las transiciones del autómata no será aceptado.

![Autómata](/automata.png)

Mi autómata permite reconocer cada palabra de manera individual, pero presenta una limitante: no aceptaba secuencias donde una palabra este seguida de otra.
Mi automata me permite generar las palabras -> **parma|parf|pelargir|peredhel|palantíri|**

### Expresión regular del autómata:
Otra forma de representar un automata es usando las expresiones regulares. Las expresiones regulares son un equivalente algebraicoa un autómata, puede definir exactamente los mismos lenguajes que los autómatas pueden describir: Lenguajes regulares.

**(^p(a((lantíri) | r(ma|f)) | e(largir|redhel)))**

### Desglose
- ^p: La cadena debe iniciar con la letra "p".
- a: Después de la "p", puede venir la letra "a".
    - (lantíri): Despue de la "a" puede continuar con "lantíri". (Ejemplo: "palantíri")
  - r: Después de la "a", puede venir la letra "r".
    - (ma|f): Si viene una "r", puede continuar con:
      - "ma" (Ejemplo: "parma")
      - "f" (Ejemplo: "parf")
- e: Después de la "p", puede venir la letra "e".
  - (largir|redhel): Si viene una "e", puede continuar con:
    - "largir" (Ejemplo: "pelargir")
    - "redhel" (Ejemplo: "peredhel")
  
## Implementación
Utilicé el autómata para crear una base de conocimiento con estados en Prolog para implementar mi análisis léxico. La base de conocimiento tiene el estado inicial, el estado siguiente y el símbolo que se mueve de un estado a otro. Esto se modela de la siguiente manera:

```
mover(EstadoInicial, SiguienteEstado, Simbolo).
```
Definimos el ultimo estado (el aceptado), para mi gramatica solo hay un estado de aceptacion que es el w :
```
estado_de_aceptacion(w).
```
Verifica si los caracteres ingresados estan en la base de conocimiento comienza siempre desde el estado a.
```
iniciar_automata(ChecarLista) :-
```
Caso base: El programa continua hasta que ya no mas caracteres, verifica que el estado actual(ultimo) sea el w.
```
verificar_automata([], EstadoActual) :-
```
Regla recursiva: Divide la lista y va recorriendose a el siguiente estado.
```
verificar_automata([Simbolo | RestoLista], EstadoActual) :-
```
## Pruebas
El programa está implementado en **Prolog**. Para ejecutar el autómata, abre el archivo `elvish.pl` en un entorno compatible con Prolog, y escribe la palabra que quieras comprobar sea parte del lenguaje: parma. 

### Pruebas exitosas

A continuación se presentan las palabras que deberían ser aceptadas por el autómata (debe arrojar verdadero), ya que están definidas en el lenguaje:

1. Parma
2. Pelargir
3. Peredhel
4. Palantíri
5. Parf

### Pruebas fallidas

Estas son palabras similares a las del idioma, pero que no están incluidas en el lenguaje definido por el autómata. Por lo tanto, el programa debería devolver `falso` o error al procesarlas:

1. Parme
2. Pelargr
3. Peredel
4. Palantiri
5. Par

## Analisis
### Complejidad Temporal y espacial
Para que el programa verifique si una palabra es parte del lenguaje, debe de iterar por todos los estados esto significa que la complejidad temporal es de O(n), ademas es un a gramatica regular de tipo 3 y estas tienen complejidad de O(n) .Asimismo la complejidad espacial es de O (n) porque el programa guarda n elementos en la pila mientras recorre la lista.

## Referencias

- [1] Wikipedia Contributors. “Elvish Languages.” *Wikipedia*, Wikimedia Foundation, 22 de abril de 2024.
- [2] GeeksforGeeks. “Introduction of Finite Automata.” *GeeksforGeeks*, 9 de julio de 2015. [Enlace](https://www.geeksforgeeks.org/introduction-of-finite-automata/)
- [3]“Regular Expressions, Regular Grammar and Regular Languages - GeeksforGeeks.” GeeksforGeeks, 7 Feb. 2019, www.geeksforgeeks.org/regular-expressions-regular-grammar-and-regular-languages/.





