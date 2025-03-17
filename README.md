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

---

### Modelos

Genere un atomata para todos los lenguajes, ya que el automata es válido para las cinco palabras del lenguaje. Es impotante mencionar que el automata solo es valido para el siguiente alfabeto. 

∑ = a, d, e, f, g, h, i, í, l, m, n, p, r, t.

Cualquier carater que no este incluido en el alfabeto o en las transiciones del automata no será aceptado. 
Este es el automata: 

```
(^p)(ar(ma|f) | e(largir | redhel) | alantíri)
```

---

### Referencias
- Wikipedia Contributors. “Elvish Languages.” Wikipedia, Wikimedia Foundation, 22 Apr. 2024.




