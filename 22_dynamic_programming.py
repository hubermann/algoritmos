"""
Dynamic Programming (Programación Dinámica)

DP es una técnica para resolver problemas complejos dividiéndolos
en subproblemas más simples y almacenando sus soluciones.

Regla: "No calcules lo mismo dos veces"

Características:
- Subproblemas superpuestos
- Subestructura óptima
- Memoización (guardar resultados)
"""


# Memoización manual
def fibonacci_memo(n, memo={}):
    """Fibonacci con memoización."""
    if n in memo:
        return memo[n]
    
    if n <= 2:
        return 1
    
    memo[n] = fibonacci_memo(n - 1, memo) + fibonacci_memo(n - 2, memo)
    return memo[n]


def fibonacci_tabulation(n):
    """Fibonacci con tabulación (bottom-up)."""
    if n <= 2:
        return 1
    
    tabla = [0] * (n + 1)
    tabla[1] = 1
    tabla[2] = 1
    
    for i in range(3, n + 1):
        tabla[i] = tabla[i - 1] + tabla[i - 2]
    
    return tabla[n]


def coin_change(monedas, cantidad):
    """
    Mínimo número de monedas para formar una cantidad.
    DP: tabla[monto] = mínimo monedas para formar monto
    """
    # dp[i] = mínimo monedas para formar cantidad i
    dp = [float('inf')] * (cantidad + 1)
    dp[0] = 0
    
    for monto in range(1, cantidad + 1):
        for moneda in monedas:
            if moneda <= monto:
                dp[monto] = min(dp[monto], dp[monto - moneda] + 1)
    
    return dp[cantidad] if dp[cantidad] != float('inf') else -1


def longest_common_subsequence(s1, s2):
    """
    Longest Common Subsequence (LCS).
    Ejemplo: "ABCDGH" y "AEDFHR" → "ADH" (longitud 3)
    """
    m, n = len(s1), len(s2)
    # dp[i][j] = LCS de s1[0:i] y s2[0:j]
    dp = [[0] * (n + 1) for _ in range(m + 1)]
    
    for i in range(1, m + 1):
        for j in range(1, n + 1):
            if s1[i - 1] == s2[j - 1]:
                dp[i][j] = dp[i - 1][j - 1] + 1
            else:
                dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
    
    return dp[m][n]


def knapsack_01(pesos, valores, capacidad):
    """
    Problema de la mochila 0-1 (cada item se toma o no).
    """
    n = len(pesos)
    # dp[i][w] = máximo valor con primeros i items y capacidad w
    dp = [[0] * (capacidad + 1) for _ in range(n + 1)]
    
    for i in range(1, n + 1):
        for w in range(capacidad + 1):
            if pesos[i - 1] <= w:
                dp[i][w] = max(
                    dp[i - 1][w],  # No tomar item i
                    dp[i - 1][w - pesos[i - 1]] + valores[i - 1]  # Tomar item i
                )
            else:
                dp[i][w] = dp[i - 1][w]
    
    return dp[n][capacidad]


# 🎯 EJEMPLOS

print("=" * 60)
print("EJEMPLO 1: Fibonacci")
print("=" * 60)
n = 10
print(f"Fibonacci({n}) con memoización: {fibonacci_memo(n)}")
print(f"Fibonacci({n}) con tabulación: {fibonacci_tabulation(n)}")

print("\n" + "=" * 60)
print("EJEMPLO 2: Coin Change")
print("=" * 60)
monedas = [1, 3, 4]
cantidad = 6
min_monedas = coin_change(monedas, cantidad)
print(f"Monedas: {monedas}, Cantidad: {cantidad}")
print(f"Mínimo de monedas: {min_monedas}")

print("\n" + "=" * 60)
print("EJEMPLO 3: Longest Common Subsequence")
print("=" * 60)
s1 = "ABCDGH"
s2 = "AEDFHR"
lcs = longest_common_subsequence(s1, s2)
print(f"LCS de '{s1}' y '{s2}': {lcs}")

print("\n" + "=" * 60)
print("EJEMPLO 4: 0-1 Knapsack")
print("=" * 60)
pesos = [1, 3, 4, 5]
valores = [1, 4, 5, 7]
capacidad = 7
max_valor = knapsack_01(pesos, valores, capacidad)
print(f"Pesos: {pesos}, Valores: {valores}, Capacidad: {capacidad}")
print(f"Valor máximo: {max_valor}")


print("\n" + "=" * 60)
print("💡 DYNAMIC PROGRAMMING")
print("=" * 60)
print("""
🔑 TÉCNICAS:

1. MEMOIZATION (Top-Down):
   - Recursión + guardar resultados
   - Calcula cuando lo necesitas

2. TABULATION (Bottom-Up):
   - Llena tabla desde el principio
   - Más eficiente en memoria

📋 PASOS PARA RESOLVER:
   1. Identificar subproblemas
   2. Definir estado (qué guardar)
   3. Relación de recurrencia
   4. Caso base
   5. Orden de llenado

✅ VENTAJAS:
   - Optimiza recursión con subproblemas superpuestos
   - Garantiza solución óptima
   - Muy eficiente

❌ DESVENTAJAS:
   - Más complejo de entender
   - Puede usar mucha memoria

🎯 PROBLEMAS TÍPICOS:
   - Fibonacci, Factorial
   - Coin Change
   - Longest Common Subsequence
   - Edit Distance
   - Knapsack
   - Longest Increasing Subsequence
""")






