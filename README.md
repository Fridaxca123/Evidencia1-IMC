# Evidencia 1: Implementación de métodos computacionales

**Frida Xcaret Vargas Trejo - A01707168**

## Descripción

El lenguaje que yo elegí se llama *Elven*, también conocido como lenguas élficas. Estas lenguas son un conjunto de idiomas ficticios creados por el escritor J.R.R. Tolkien para sus obras, como *El Señor de los Anillos*. "Entre las más destacadas se encuentran el **Quenya** y el **Sindarin**, las cuales están inspiradas en el finlandés, latín y galés". [1]

### Palabras modeladas

Las palabras que elegí para modelar en el autómata son las siguientes:

- **Parma**: Quenya para "Libro" ("Book").
- **Pelargir**: Sindarin para "Garth of Royal Ships" ("Puerto de las Naves Reales").
- **Peredhel**: Sindarin para "Half-elvish" o "Half-elf" ("Medio-elfo").
- **Palantíri**: Quenya para "Far seeing" ("Visión lejana"), hace referencia a las piedras videntes (*Seeing-Stones*).
- **Parf**: Variante en Sindarin de "Parma" ("Libro").

### DFA vs. NFA

Los autómatas finitos son una de las formas más simples de reconocer patrones [2]. Existen dos tipos principales:

- **DFA (Deterministic Finite Automata)**: Por cada estado y símbolo de entrada, solo existe una transición posible a otro estado.
- **NFA (Non-Deterministic Finite Automata)**: Permite múltiples transiciones para el mismo símbolo de entrada y acepta transiciones vacías.

Para este proyecto, decidí utilizar un **DFA** porque únicamente necesito que el autómata reconozca cinco palabras específicas. Esto simplifica la implementación, ya que puedo definir una ruta única para cada palabra, haciendo innecesario el uso de un NFA.

Un Automata Finito Deterministico (AFD) consta de:

-Un **conjunto finito de estados** -> Q

-Un **alfabeto** (conjunto de simbolos o letras) -> Σ

-**Transiciones** -> δ

-Un **estado inicial**

-Uno o más **estados finales**.

Se representa gráficamente con un grafo, donde los nodos son los estados y las flechas las transiciones. Cada transición está etiquetada con un símbolo del alfabeto representando su condición para realizar la transición.

## Modelos

Generé un único autómata que es válido para las cinco palabras del lenguaje. Es importante mencionar que este autómata solo acepta el siguiente alfabeto:

**∑ = {a, d, e, f, g, h, i, í, l, m, n, p, r, t}**

Cualquier carácter que no esté incluido en el alfabeto o en las transiciones del autómata no será aceptado.

![Autómata](/automata.png)

Mi autómata permite reconocer cada palabra de manera individual, pero presenta un problema: no aceptaba secuencias donde una palabra este seguida de otra.
Mi automata ahora me permite generar las palabras -> **parma|parf|pelargir|peredhel|palantíri|**

### Expresión regular del autómata:
Otra forma de representar un automata es usando las expresiones regulares. Las expresiones regulares son un equivalente algebraico para un autómata, puede definir exactamente los mismos lenguajes que los autómatas pueden describir: Lenguajes regulares.[3]
```
(^p(a((lantíri) | r(ma|f)) | e(largir|redhel)))
```
### Desglose
- ^p: La cadena debe iniciar con la letra "p".
- a: Después de la "p", puede venir la letra "a".
  - (lantíri): Si viene una "a", debe continuar con la palabra "lantíri". (Ejemplo: "palantíri")
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
También existe una regla adicional que es el estado aceptado. Mi autómata solo tiene un estado aceptado:
```
estado_de_aceptacion(w).
```
El resto del código tiene una regla auxiliar que llama a la regla recursiva:
```
iniciar_automata(ChecarLista) :-
```
Caso base: 
```
verificar_automata([], EstadoInicial) :-
```
Regla recursiva: 
```
verificar_automata([Simbolo | RestoLista], EstadoInicial) :-
```
## Pruebas
El programa está implementado en **Prolog**. Para ejecutar el autómata, abre el archivo `elvish.pl` en un entorno compatible con Prolog o en una terminal de Prolog. 

### Pruebas exitosas

A continuación se presentan las palabras que deberían ser aceptadas por el autómata, ya que están definidas en el lenguaje:

1. Parma
2. Pelargir
3. Peredhel
4. Palantíri
5. Parf

### Pruebas fallidas

Estas son palabras similares a las del idioma, pero que no están incluidas en el lenguaje definido por el autómata. Por lo tanto, el programa debería devolver `falso` al procesarlas:

1. Parme
2. Pelargr
3. Peredel
4. Palantiri
5. Par

Las pruebas en sí tienen el resultado esperado y el resultado que da Prolog. Es importante mencionar que estas funciones a continuación tienen algo similar a este comando: iniciar_automata([p, a, r, m, a]). Esto significa que si desea ejecutar una palabra diferente a las palabras anteriores, ejecute iniciar_automata([palabra).. donde palabra-a-verificar es la palabra escrita en letras, y cada letra está separada por una coma.

Por ejemplo, para probar la palabra *hola*, debes ejecutar:

```
iniciar_automata([h, o, l, a]).
```
## Analisis
### Complejidad Temporal y espacial
Debido a que el programa utiliza recursion e itera sobre la base de conocimiento, se asimila a un loop. El caso base de la recursión se completa cuando la lista del programa está vacía y no se realiza ninguna operación adicional, asi que se puede decir que el programa tiene una complejidad temporal de O(n). No existe un loop anidado y sin importar cuántos hechos haya en la base de conocimiento, siempre se iterará sobre cada uno de ellos una vez, por lo que, en ese aspecto, es seguro decir que la solución del programa es eficiente. Asimismo la complejidad espacial es de O (n) porque el programa guarda n elementos en la pila mientras recorre la lista.

## Referencias

- [1] Wikipedia Contributors. “Elvish Languages.” *Wikipedia*, Wikimedia Foundation, 22 de abril de 2024.
- [2] GeeksforGeeks. “Introduction of Finite Automata.” *GeeksforGeeks*, 9 de julio de 2015. [Enlace](https://www.geeksforgeeks.org/introduction-of-finite-automata/)
- [3]“Regular Expressions, Regular Grammar and Regular Languages - GeeksforGeeks.” GeeksforGeeks, 7 Feb. 2019, www.geeksforgeeks.org/regular-expressions-regular-grammar-and-regular-languages/.





