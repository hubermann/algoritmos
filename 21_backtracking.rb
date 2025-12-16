# Backtracking (Vuelta Atrás)
#
# Backtracking es una técnica algorítmica para resolver problemas
# probando soluciones parciales y "retrocediendo" si no funcionan.
#
# Es como explorar un laberinto: pruebas un camino, si no funciona,
# vuelves atrás y pruebas otro.

def permutaciones(nums)
  # Genera todas las permutaciones de una lista.
  # Ejemplo: [1,2,3] → [[1,2,3], [1,3,2], [2,1,3], ...]
  resultado = []
  
  backtrack = lambda do |permutacion_actual|
    # Caso base: permutación completa
    if permutacion_actual.length == nums.length
      resultado << permutacion_actual.dup
      return
    end
    
    # Probar cada número disponible
    nums.each do |num|
      unless permutacion_actual.include?(num)
        permutacion_actual << num  # Hacer elección
        backtrack.call(permutacion_actual)  # Explorar
        permutacion_actual.pop  # Deshacer (backtrack)
      end
    end
  end
  
  backtrack.call([])
  resultado
end

def n_reinas(n)
  # Problema de las N Reinas: colocar n reinas en un tablero n×n
  # de forma que ninguna se ataque.
  soluciones = []
  
  es_seguro = lambda do |tablero, fila, col|
    # Verifica si es seguro colocar una reina en (fila, col).
    # Verificar columna
    (0...fila).each do |i|
      return false if tablero[i] == col
      # Verificar diagonales
      return false if (tablero[i] - col).abs == (i - fila).abs
    end
    true
  end
  
  backtrack = lambda do |tablero, fila|
    if fila == n
      soluciones << tablero.dup
      return
    end
    
    (0...n).each do |col|
      if es_seguro.call(tablero, fila, col)
        tablero[fila] = col  # Colocar reina
        backtrack.call(tablero, fila + 1)  # Explorar siguiente fila
        tablero[fila] = -1  # Backtrack
      end
    end
  end
  
  tablero = Array.new(n, -1)
  backtrack.call(tablero, 0)
  soluciones
end

def subconjuntos(nums)
  # Genera todos los subconjuntos de una lista.
  resultado = []
  
  backtrack = lambda do |subconjunto, inicio|
    resultado << subconjunto.dup
    
    (inicio...nums.length).each do |i|
      subconjunto << nums[i]
      backtrack.call(subconjunto, i + 1)
      subconjunto.pop  # Backtrack
    end
  end
  
  backtrack.call([], 0)
  resultado
end

# 🎯 EJEMPLOS

puts "=" * 60
puts "EJEMPLO 1: Permutaciones"
puts "=" * 60
nums = [1, 2, 3]
perms = permutaciones(nums)
puts "Permutaciones de #{nums}:"
perms.each { |perm| puts "  #{perm}" }

puts "\n" + "=" * 60
puts "EJEMPLO 2: 4 Reinas"
puts "=" * 60
soluciones = n_reinas(4)
puts "Número de soluciones para 4 reinas: #{soluciones.length}"
puts "Primera solución: #{soluciones[0] if soluciones.any?}"

puts "\n" + "=" * 60
puts "EJEMPLO 3: Subconjuntos"
puts "=" * 60
nums = [1, 2, 3]
subs = subconjuntos(nums)
puts "Subconjuntos de #{nums}:"
subs.each { |sub| puts "  #{sub}" }

puts "\n" + "=" * 60
puts "💡 BACKTRACKING"
puts "=" * 60
puts """
🔑 CONCEPTOS:
   - Prueba y error sistemático
   - Retrocede cuando no hay solución
   - Explora todas las posibilidades

✅ VENTAJAS:
   - Encuentra todas las soluciones
   - Útil para problemas de búsqueda exhaustiva

❌ DESVENTAJAS:
   - Puede ser lento (exponencial)
   - Usa mucha memoria (recursión profunda)

🎯 CUÁNDO USAR:
   - Problemas de búsqueda exhaustiva
   - Problemas de optimización combinatoria
   - Cuando necesitas todas las soluciones

📊 EJEMPLOS:
   - N Reinas
   - Sudoku
   - Permutaciones/Combinaciones
   - Laberintos
"""

