"""
Backtracking (Vuelta Atrás)

Backtracking es una técnica algorítmica para resolver problemas
probando soluciones parciales y "retrocediendo" si no funcionan.

Es como explorar un laberinto: pruebas un camino, si no funciona,
vuelves atrás y pruebas otro.
"""


def permutaciones(nums):
    """
    Genera todas las permutaciones de una lista.
    Ejemplo: [1,2,3] → [[1,2,3], [1,3,2], [2,1,3], ...]
    """
    resultado = []
    
    def backtrack(permutacion_actual):
        # Caso base: permutación completa
        if len(permutacion_actual) == len(nums):
            resultado.append(permutacion_actual.copy())
            return
        
        # Probar cada número disponible
        for num in nums:
            if num not in permutacion_actual:
                permutacion_actual.append(num)  # Hacer elección
                backtrack(permutacion_actual)    # Explorar
                permutacion_actual.pop()         # Deshacer (backtrack)
    
    backtrack([])
    return resultado


def n_reinas(n):
    """
    Problema de las N Reinas: colocar n reinas en un tablero n×n
    de forma que ninguna se ataque.
    """
    soluciones = []
    
    def es_seguro(tablero, fila, col):
        """Verifica si es seguro colocar una reina en (fila, col)."""
        # Verificar columna
        for i in range(fila):
            if tablero[i] == col:
                return False
            # Verificar diagonales
            if abs(tablero[i] - col) == abs(i - fila):
                return False
        return True
    
    def backtrack(tablero, fila):
        if fila == n:
            soluciones.append(tablero.copy())
            return
        
        for col in range(n):
            if es_seguro(tablero, fila, col):
                tablero[fila] = col  # Colocar reina
                backtrack(tablero, fila + 1)  # Explorar siguiente fila
                tablero[fila] = -1  # Backtrack
    
    tablero = [-1] * n
    backtrack(tablero, 0)
    return soluciones


def sudoku_solver(tablero):
    """
    Resuelve un sudoku usando backtracking.
    """
    def es_valido(tablero, fila, col, num):
        # Verificar fila
        for j in range(9):
            if tablero[fila][j] == num:
                return False
        
        # Verificar columna
        for i in range(9):
            if tablero[i][col] == num:
                return False
        
        # Verificar subcuadrícula 3×3
        inicio_fila = (fila // 3) * 3
        inicio_col = (col // 3) * 3
        for i in range(inicio_fila, inicio_fila + 3):
            for j in range(inicio_col, inicio_col + 3):
                if tablero[i][j] == num:
                    return False
        
        return True
    
    def resolver():
        for i in range(9):
            for j in range(9):
                if tablero[i][j] == 0:
                    for num in range(1, 10):
                        if es_valido(tablero, i, j, num):
                            tablero[i][j] = num
                            if resolver():
                                return True
                            tablero[i][j] = 0  # Backtrack
                    return False
        return True
    
    resolver()
    return tablero


def subconjuntos(nums):
    """Genera todos los subconjuntos de una lista."""
    resultado = []
    
    def backtrack(subconjunto, inicio):
        resultado.append(subconjunto.copy())
        
        for i in range(inicio, len(nums)):
            subconjunto.append(nums[i])
            backtrack(subconjunto, i + 1)
            subconjunto.pop()  # Backtrack
    
    backtrack([], 0)
    return resultado


# 🎯 EJEMPLOS

print("=" * 60)
print("EJEMPLO 1: Permutaciones")
print("=" * 60)
nums = [1, 2, 3]
perms = permutaciones(nums)
print(f"Permutaciones de {nums}:")
for perm in perms:
    print(f"  {perm}")

print("\n" + "=" * 60)
print("EJEMPLO 2: 4 Reinas")
print("=" * 60)
soluciones = n_reinas(4)
print(f"Número de soluciones para 4 reinas: {len(soluciones)}")
print(f"Primera solución: {soluciones[0] if soluciones else None}")

print("\n" + "=" * 60)
print("EJEMPLO 3: Subconjuntos")
print("=" * 60)
nums = [1, 2, 3]
subs = subconjuntos(nums)
print(f"Subconjuntos de {nums}:")
for sub in subs:
    print(f"  {sub}")


print("\n" + "=" * 60)
print("💡 BACKTRACKING")
print("=" * 60)
print("""
🔑 IDEA PRINCIPAL:
   1. Construir soluciones incrementales
   2. Verificar restricciones en cada paso
   3. Si no funciona, retroceder y probar otra opción

✅ VENTAJAS:
   - Encuentra todas las soluciones
   - Muy flexible
   - Funciona para problemas complejos

❌ DESVENTAJAS:
   - Puede ser lento (explora muchas posibilidades)
   - Complejidad exponencial en muchos casos

🎯 PROBLEMAS TÍPICOS:
   - N Reinas
   - Sudoku
   - Laberintos
   - Permutaciones/Combinaciones
   - Problemas de optimización con restricciones
""")






