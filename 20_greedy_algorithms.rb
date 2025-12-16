# Greedy Algorithms (Algoritmos Voraces)
#
# Un algoritmo greedy siempre hace la elección que parece mejor
# en el momento (localmente óptima), esperando que lleve a una
# solución globalmente óptima.
#
# Regla: "El mejor ahora, sin pensar en el futuro"

def cambio_monedas(monedas, cantidad)
  # Problema del cambio: encontrar el mínimo número de monedas
  # para dar cambio de una cantidad.
  #
  # Algoritmo greedy: siempre elegir la moneda más grande posible.
  monedas = monedas.sort.reverse  # De mayor a menor
  resultado = []
  
  monedas.each do |moneda|
    while cantidad >= moneda
      cantidad -= moneda
      resultado << moneda
    end
  end
  
  resultado
end

def actividad_selector(inicio, fin)
  # Problema de selección de actividades:
  # Máximo número de actividades que no se solapan.
  #
  # Greedy: elegir la actividad que termina primero.
  n = inicio.length
  actividades = inicio.zip(fin, (0...n).to_a)
  actividades.sort_by! { |_, f, _| f }  # Ordenar por tiempo de fin
  
  seleccionadas = [actividades[0][2]]  # Primera actividad
  ultima_fin = actividades[0][1]
  
  (1...n).each do |i|
    if actividades[i][0] >= ultima_fin
      seleccionadas << actividades[i][2]
      ultima_fin = actividades[i][1]
    end
  end
  
  seleccionadas
end

def fractional_knapsack(pesos, valores, capacidad)
  # Problema de la mochila fraccional (puedes tomar fracciones).
  #
  # Greedy: elegir items con mejor ratio valor/peso primero.
  n = pesos.length
  items = (0...n).map do |i|
    [valores[i].to_f / pesos[i], pesos[i], valores[i], i]
  end
  items.sort_by! { |ratio, _, _, _| -ratio }  # Mayor ratio primero
  
  valor_total = 0
  peso_restante = capacidad
  solucion = Array.new(n, 0)
  
  items.each do |ratio, peso, valor, idx|
    if peso_restante >= peso
      # Tomar todo el item
      solucion[idx] = 1.0
      valor_total += valor
      peso_restante -= peso
    else
      # Tomar fracción
      fraccion = peso_restante.to_f / peso
      solucion[idx] = fraccion
      valor_total += valor * fraccion
      break
    end
  end
  
  [solucion, valor_total]
end

# 🎯 EJEMPLOS

puts "=" * 60
puts "EJEMPLO 1: Cambio de Monedas"
puts "=" * 60
monedas = [1, 5, 10, 25]
cantidad = 67
cambio = cambio_monedas(monedas, cantidad)
puts "Monedas disponibles: #{monedas}"
puts "Cambio para $#{cantidad}: #{cambio}"
puts "Total de monedas: #{cambio.length}"

puts "\n" + "=" * 60
puts "EJEMPLO 2: Selección de Actividades"
puts "=" * 60
inicio = [1, 3, 0, 5, 8, 5]
fin = [2, 4, 6, 7, 9, 9]
seleccionadas = actividad_selector(inicio, fin)
puts "Horarios: inicio=#{inicio}, fin=#{fin}"
puts "Actividades seleccionadas (índices): #{seleccionadas}"
puts "Total de actividades: #{seleccionadas.length}"

puts "\n" + "=" * 60
puts "EJEMPLO 3: Mochila Fraccional"
puts "=" * 60
pesos = [10, 20, 30]
valores = [60, 100, 120]
capacidad = 50
solucion, valor = fractional_knapsack(pesos, valores, capacidad)
puts "Pesos: #{pesos}, Valores: #{valores}, Capacidad: #{capacidad}"
puts "Solución (fracciones): #{solucion}"
puts "Valor total: #{valor}"

puts "\n" + "=" * 60
puts "💡 GREEDY ALGORITMS"
puts "=" * 60
puts """
✅ VENTAJAS:
   - Fácil de entender e implementar
   - Eficiente (rápido)
   - Funciona bien para muchos problemas

❌ DESVENTAJAS:
   - No siempre da la solución óptima
   - Necesitas probar que funciona para cada problema
   - Puede quedar atrapado en mínimos/máximos locales

🎯 CUÁNDO FUNCIONA:
   - Problema tiene subestructura óptima
   - Propiedad de elección greedy (local óptimo = global óptimo)

📊 EJEMPLOS CLÁSICOS:
   - Minimum Spanning Tree (Kruskal, Prim)
   - Shortest Path (Dijkstra)
   - Cambio de monedas
   - Scheduling
"""

