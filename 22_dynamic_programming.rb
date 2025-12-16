# Dynamic Programming (Programación Dinámica)
#
# DP es una técnica para resolver problemas complejos dividiéndolos
# en subproblemas más simples y almacenando sus soluciones.
#
# Regla: "No calcules lo mismo dos veces"
#
# Características:
# - Subproblemas superpuestos
# - Subestructura óptima
# - Memoización (guardar resultados)

# Memoización manual
def fibonacci_memo(n, memo = {})
  # Fibonacci con memoización.
  return memo[n] if memo.key?(n)
  
  return 1 if n <= 2
  
  memo[n] = fibonacci_memo(n - 1, memo) + fibonacci_memo(n - 2, memo)
  memo[n]
end

def fibonacci_tabulation(n)
  # Fibonacci con tabulación (bottom-up).
  return 1 if n <= 2
  
  tabla = Array.new(n + 1, 0)
  tabla[1] = 1
  tabla[2] = 1
  
  (3..n).each do |i|
    tabla[i] = tabla[i - 1] + tabla[i - 2]
  end
  
  tabla[n]
end

def coin_change(monedas, cantidad)
  # Mínimo número de monedas para formar una cantidad.
  # DP: tabla[monto] = mínimo monedas para formar monto
  # dp[i] = mínimo monedas para formar cantidad i
  dp = Array.new(cantidad + 1, Float::INFINITY)
  dp[0] = 0
  
  (1..cantidad).each do |monto|
    monedas.each do |moneda|
      if moneda <= monto
        dp[monto] = [dp[monto], dp[monto - moneda] + 1].min
      end
    end
  end
  
  dp[cantidad] == Float::INFINITY ? -1 : dp[cantidad]
end

def longest_common_subsequence(s1, s2)
  # Longest Common Subsequence (LCS).
  # Ejemplo: "ABCDGH" y "AEDFHR" → "ADH" (longitud 3)
  m, n = s1.length, s2.length
  # dp[i][j] = LCS de s1[0:i] y s2[0:j]
  dp = Array.new(m + 1) { Array.new(n + 1, 0) }
  
  (1..m).each do |i|
    (1..n).each do |j|
      if s1[i - 1] == s2[j - 1]
        dp[i][j] = dp[i - 1][j - 1] + 1
      else
        dp[i][j] = [dp[i - 1][j], dp[i][j - 1]].max
      end
    end
  end
  
  dp[m][n]
end

def knapsack_01(pesos, valores, capacidad)
  # Problema de la mochila 0-1 (cada item se toma o no).
  n = pesos.length
  # dp[i][w] = máximo valor con primeros i items y capacidad w
  dp = Array.new(n + 1) { Array.new(capacidad + 1, 0) }
  
  (1..n).each do |i|
    (0..capacidad).each do |w|
      if pesos[i - 1] <= w
        dp[i][w] = [
          dp[i - 1][w],  # No tomar item i
          dp[i - 1][w - pesos[i - 1]] + valores[i - 1]  # Tomar item i
        ].max
      else
        dp[i][w] = dp[i - 1][w]
      end
    end
  end
  
  dp[n][capacidad]
end

# 🎯 EJEMPLOS

puts "=" * 60
puts "EJEMPLO 1: Fibonacci"
puts "=" * 60
n = 10
puts "Fibonacci(#{n}) con memoización: #{fibonacci_memo(n)}"
puts "Fibonacci(#{n}) con tabulación: #{fibonacci_tabulation(n)}"

puts "\n" + "=" * 60
puts "EJEMPLO 2: Coin Change"
puts "=" * 60
monedas = [1, 3, 4]
cantidad = 6
min_monedas = coin_change(monedas, cantidad)
puts "Monedas: #{monedas}, Cantidad: #{cantidad}"
puts "Mínimo de monedas: #{min_monedas}"

puts "\n" + "=" * 60
puts "EJEMPLO 3: Longest Common Subsequence"
puts "=" * 60
s1 = "ABCDGH"
s2 = "AEDFHR"
lcs = longest_common_subsequence(s1, s2)
puts "LCS de '#{s1}' y '#{s2}': #{lcs}"

puts "\n" + "=" * 60
puts "EJEMPLO 4: 0-1 Knapsack"
puts "=" * 60
pesos = [1, 3, 4, 5]
valores = [1, 4, 5, 7]
capacidad = 7
max_valor = knapsack_01(pesos, valores, capacidad)
puts "Pesos: #{pesos}, Valores: #{valores}, Capacidad: #{capacidad}"
puts "Valor máximo: #{max_valor}"

puts "\n" + "=" * 60
puts "💡 DYNAMIC PROGRAMMING"
puts "=" * 60
puts """
🔑 TÉCNICAS:

1. MEMOIZATION (Top-Down):
   - Recursión + guardar resultados
   - Calcula cuando lo necesitas

2. TABULATION (Bottom-Up):
   - Llena tabla desde el principio
   - Más eficiente en memoria

✅ VENTAJAS:
   - Evita recalcular subproblemas
   - Optimiza problemas exponenciales a polinomiales

❌ DESVENTAJAS:
   - Requiere identificar subproblemas
   - Puede usar mucha memoria

🎯 CUÁNDO USAR:
   - Subproblemas superpuestos
   - Subestructura óptima
   - Problemas de optimización

📊 EJEMPLOS CLÁSICOS:
   - Fibonacci
   - Longest Common Subsequence
   - Edit Distance
   - Knapsack
   - Coin Change
"""

