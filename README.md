# Evidencia 1: Implementación de métodos computacionales. 

Frida Xcaret Vargas Trejo - A01707168  

## Descripción  
El lenguaje que yo elegí se llama Elven, también llamadas lenguas élficas. Las lenguas élficas son un conjunto de idiomas ficticios creados por el escritor J.R.R. Tolkien para sus obras como *El Señor de los Anillos*. Entre estas lenguas destacan el Quenya y el Sindarin, que están basadas en el finlandés, latín y galés.  

Las palabras que elegí para modelar son:  
- **Parma** - Quenya para "Book".  
- **Pelargir** - Sindarin word for "Garth of Royal Ships".  
- **Peredhel** - Sindarin word for "Half-elvish" o "Half-elf".  
- **Palantíri** - Quenyan word que significa "Far seeing", raíz de Palantir o los Seeing-Stones.  
- **Parf** - Sindarin, ver *Parma*.

Los autómatas finitos son una de las maneras más simples de reconocer patrones. Existen dos tipos principales de autómatas: los DFA y los NFA.

Los Deterministic Finite Automata (DFA) se caracterizan porque, para cada estado y símbolo de entrada, solo existe una transición a otro estado. Por ejemplo, si hay una letra 'a', solo hay un estado al que se puede acceder con esa entrada.

Por otro lado, los Non-Deterministic Finite Automata (NFA) se diferencian en dos aspectos: aceptan transiciones vacías  y permiten múltiples transiciones para un mismo símbolo de entrada.

Basándome en esta información, decidí utilizar un DFA para mi propósito, ya que solo necesito que el autómata acepte cinco palabras. Puedo crear una ruta específica para cada una de las palabras, lo que hace innecesario el uso de un NFA.

---

### Modelos

Genere un atomata para todos los lenguajes, ya que el automata es válido para las cinco palabras del lenguaje. Es impotante mencionar que el automata solo es valido para el siguiente alfabeto. 

∑ = a, d, e, f, g, h, i, í, l, m, n, p, r, t.

Cualquier carater que no este incluido en el alfabeto o en las transiciones del automata no será aceptado. 

Este es el automata: 

```
(^p)(a(lantíri) | r(ma|f) | e(largir|redhel))
```
![Autómata](/automata.png)
---
### Implementación
llll

---
### Pruebas
Para correr el programa abra elvish.pl en Prolog. 


---
### Referencias
- Wikipedia Contributors. “Elvish Languages.” Wikipedia, Wikimedia Foundation, 22 Apr. 2024.
- GeeksforGeeks. “Introduction of Finite Automata.” GeeksforGeeks, 9 July 2015, www.geeksforgeeks.org/introduction-of-finite-automata/.




