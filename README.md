# Novax_Compiler

Compilador para el lenguaje NOVAX, desarrollado para el curso de **Compiladores e Intérpretes** (I.T.C.R., II Semestre 2026).

## Estado actual: Scanner (Análisis Léxico)

Este repositorio contiene la primera etapa del compilador: un analizador léxico que recibe código fuente escrito en NOVAX, lo recorre carácter por carácter, y produce:

- Un listado de los tokens reconocidos (identificadores, palabras reservadas, operadores, literales, etc.), con el tipo y las líneas donde aparecen.
- Un listado de los errores léxicos encontrados, con recuperación de errores (el análisis continúa sin detenerse ni generar errores en cascada).

## Tecnologías

- **Java**
- **[JFlex](https://jflex.de/)** — generador del analizador léxico a partir de las reglas definidas en `src/codigo/Lexer.flex`
- **NetBeans IDE** (proyecto Ant, "Java with Existing Sources")

## Estructura del proyecto

    codigo/
    ├── src/codigo/
    │   ├── Lexer.flex        # Definición del lenguaje (reglas léxicas)
    │   ├── Lexer.java        # Generado por JFlex a partir de Lexer.flex
    │   ├── Tokens.java        # Tipos de token
    │   ├── Principal.java     # Utilidad para regenerar Lexer.java
    │   └── FrmPrincipal.java  # Interfaz gráfica
    └── lib/
        └── jflex-full-*.jar   # Librería de JFlex

## Cómo compilar y ejecutar

Ver el manual de usuario en la documentación entregada. En resumen: cada vez que se modifica `Lexer.flex`, hay que correr `Principal.java` para regenerar `Lexer.java` antes de compilar.

## Equipo

- Jose David Espinoza Brenes
- Samuel Garcés Castillo

## Curso

Compiladores e Intérpretes — Prof. Ing. Erika Marín Schumann
