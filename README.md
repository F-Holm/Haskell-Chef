# Haskell Chef

- Alumno: Holm, Federico
- Materia: Paradigmas de Programación
- Comisión: K2001

---

## Parte D

### 1. ¿Qué sucede si aplicamos cada uno de los trucos modelados en la Parte A al platinum?

- `endulzar` / `salar` / `darSabor`: Funcionan.
- `duplicarPorcion`: Funciona.
- `simplificar`: No funciona porque utiliza `length`.

### 2. ¿Cuáles de las preguntas de la Parte A (esVegano, esSinTacc, etc.) se pueden responder sobre el platinum?

- `esSinTacc`: No funciona porque utiliza `any`.
- `esVegano`: No funciona porque utiliza `any`.
- `esComplejo`: No funciona porque utiliza `length`.
- `noAptoHipertension`: No funciona porque utiliza `any`.

### 3. ¿Se puede saber si el platinum es mejor que otro plato?

No, no se puede saber porque utiliza `sum`.
