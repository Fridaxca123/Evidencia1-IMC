# Evidencia 1: Implementación de métodos computacionales

**Frida Xcaret Vargas Trejo - A01707168**

## Descripción

El lenguaje que yo elegí se llama *Elven*, también conocido como lenguas élficas. Estas lenguas son un conjunto de idiomas ficticios creados por el escritor J.R.R. Tolkien para sus obras, como *El Señor de los Anillos*. Entre las más destacadas se encuentran el **Quenya** y el **Sindarin**, las cuales están inspiradas en el finlandés, latín y galés.

### Palabras modeladas

Las palabras que elegí para modelar en el autómata son las siguientes:

- **Parma**: Quenya para "Libro" ("Book").
- **Pelargir**: Sindarin para "Garth of Royal Ships" ("Puerto de las Naves Reales").
- **Peredhel**: Sindarin para "Half-elvish" o "Half-elf" ("Medio-elfo").
- **Palantíri**: Quenya para "Far seeing" ("Visión lejana"), hace referencia a las piedras videntes (*Seeing-Stones*).
- **Parf**: Variante en Sindarin de "Parma" ("Libro").

### DFA vs. NFA

Los autómatas finitos son una de las formas más simples de reconocer patrones. Existen dos tipos principales:

- **DFA (Deterministic Finite Automata)**: Por cada estado y símbolo de entrada, solo existe una transición posible a otro estado.
- **NFA (Non-Deterministic Finite Automata)**: Permite múltiples transiciones para el mismo símbolo de entrada y acepta transiciones vacías.

Para este proyecto, decidí utilizar un **DFA** porque únicamente necesito que el autómata reconozca cinco palabras específicas. Esto simplifica la implementación, ya que puedo definir una ruta única para cada palabra, haciendo innecesario el uso de un NFA.

---

## Modelos

Generé un único autómata que es válido para las cinco palabras del lenguaje. Es importante mencionar que este autómata solo acepta el siguiente alfabeto:

**∑ = {a, d, e, f, g, h, i, í, l, m, n, p, r, t}**

Cualquier carácter que no esté incluido en el alfabeto o en las transiciones del autómata no será aceptado.

### Expresión regular del autómata:

```
(^p)(a(lantíri) | r(ma|f) | e(largir|redhel))
```

![Autómata](/automata.png)

---

## Implementación

El programa está implementado en **Prolog**. Para ejecutar el autómata, abre el archivo `elvish.pl` en un entorno compatible con Prolog o en una terminal de Prolog. 

Para abrir el archivo, ejecuta:

```
[ruta/al/archivo/elvish.pl].
```

---

## Pruebas

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

### Cómo ejecutar una prueba

Para verificar una palabra, utiliza el siguiente formato de comando en Prolog:

```
iniciar_automata([letra1, letra2, letra3, ...]).
```

Por ejemplo, para probar la palabra *hola*, debes ejecutar:

```
iniciar_automata([h, o, l, a]).
```

---

## Referencias

- Wikipedia Contributors. “Elvish Languages.” *Wikipedia*, Wikimedia Foundation, 22 de abril de 2024.
- GeeksforGeeks. “Introduction of Finite Automata.” *GeeksforGeeks*, 9 de julio de 2015. [Enlace](https://www.geeksforgeeks.org/introduction-of-finite-automata/)





