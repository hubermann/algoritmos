# Merge Sort (Ordenamiento por Combinación)
#
# Otro algoritmo "Divide y Vencerás" muy eficiente.
# Es más predecible que Quick Sort porque siempre es O(n log n).
#
# Cómo funciona:
# 1. Divide el array por la mitad
# 2. Ordena cada mitad recursivamente
# 3. Combina las dos mitades ordenadas

def merge_sort(array, mostrar_pasos = false)
  # Ordena un array usando Merge Sort.
  #
  # Args:
  #     array: Lista de números a ordenar
  #     mostrar_pasos: Si true, muestra el proceso
  #
  # Returns:
  #     El array ordenado
  # Caso base: array con 0 o 1 elemento ya está ordenado
  return array if array.length <= 1
  
  if mostrar_pasos
    puts "Dividiendo: #{array}"
  end
  
  # PASO 1: Dividir el array por la mitad
  medio = array.length / 2
  izquierda = array[0...medio]  # Primera mitad
  derecha = array[medio..-1]    # Segunda mitad
  
  if mostrar_pasos
    puts "  Izquierda: #{izquierda}"
    puts "  Derecha: #{derecha}\n"
  end
  
  # PASO 2: Ordenar recursivamente cada mitad
  izquierda_ordenada = merge_sort(izquierda, mostrar_pasos)
  derecha_ordenada = merge_sort(derecha, mostrar_pasos)
  
  # PASO 3: Combinar las dos mitades ordenadas
  resultado = merge(izquierda_ordenada, derecha_ordenada, mostrar_pasos)
  
  if mostrar_pasos
    puts "Combinando #{izquierda_ordenada} y #{derecha_ordenada}"
    puts "Resultado: #{resultado}\n"
  end
  
  resultado
end

def merge(izquierda, derecha, mostrar_pasos = false)
  # Combina dos arrays ordenados en uno solo ordenado.
  #
  # Es como tener dos mazos de cartas ordenados y combinarlos.
  resultado = []
  i = 0  # Índice para el array izquierdo
  j = 0  # Índice para el array derecho
  
  if mostrar_pasos
    puts "    Mezclando: #{izquierda} y #{derecha}"
  end
  
  # Mientras haya elementos en ambos arrays
  while i < izquierda.length && j < derecha.length
    if izquierda[i] <= derecha[j]
      resultado << izquierda[i]
      i += 1
    else
      resultado << derecha[j]
      j += 1
    end
  end
  
  # Agregar los elementos restantes (si los hay)
  resultado.concat(izquierda[i..-1]) if i < izquierda.length
  resultado.concat(derecha[j..-1]) if j < derecha.length
  
  if mostrar_pasos
    puts "    Resultado de mezcla: #{resultado}"
  end
  
  resultado
end

# 🎯 EJEMPLOS DE USO

puts "=" * 60
puts "EJEMPLO 1: Merge Sort paso a paso"
puts "=" * 60
array1 = [38, 27, 43, 3, 9, 82, 10]
puts "Original: #{array1}\n"
ordenado1 = merge_sort(array1, true)
puts "✅ Resultado final: #{ordenado1}"

puts "\n" + "=" * 60
puts "EJEMPLO 2: Comparación con otros algoritmos"
puts "=" * 60
array2 = [64, 34, 25, 12, 22, 11, 90]
puts "Original: #{array2}"
ordenado2 = merge_sort(array2, false)
puts "Ordenado: #{ordenado2}"

puts "\n" + "=" * 60
puts "EJEMPLO 3: Array grande"
puts "=" * 60

array_grande = [64, 34, 25, 12, 22, 11, 90, 5, 77, 88, 99, 1, 2, 3, 4, 55, 66, 44, 33, 22]

start = Time.now
resultado_merge = merge_sort(array_grande.dup, false)
tiempo_merge = Time.now - start

# Comparar con Quick Sort (versión simple para comparación)
def quick_sort_simple(array)
  return array if array.length <= 1
  pivot = array[array.length / 2]
  menores = array.select { |x| x < pivot }
  iguales = array.select { |x| x == pivot }
  mayores = array.select { |x| x > pivot }
  quick_sort_simple(menores) + iguales + quick_sort_simple(mayores)
end

start = Time.now
resultado_quick = quick_sort_simple(array_grande.dup)
tiempo_quick = Time.now - start

puts "Array de #{array_grande.length} elementos:"
puts "Merge Sort:  #{tiempo_merge.round(6)} segundos"
puts "Quick Sort:  #{tiempo_quick.round(6)} segundos"

# 💡 CARACTERÍSTICAS IMPORTANTES

puts "\n" + "=" * 60
puts "💡 CARACTERÍSTICAS DE MERGE SORT"
puts "=" * 60
puts """
✅ VENTAJAS:
   - SIEMPRE O(n log n) - muy predecible
   - Estable (mantiene orden de elementos iguales)
   - Excelente para ordenar listas enlazadas
   - Se puede paralelizar fácilmente

❌ DESVENTAJAS:
   - Necesita memoria extra O(n) para combinar
   - No es in-place (necesita crear nuevos arrays)
   - Más lento en la práctica que Quick Sort en arrays

📊 COMPLEJIDAD:
   - Tiempo mejor caso: O(n log n)
   - Tiempo promedio: O(n log n)
   - Tiempo peor caso: O(n log n) - SIEMPRE el mismo! ✨
   - Espacio: O(n) - necesita memoria extra

🎯 CUÁNDO USARLO:
   - Cuando necesitas garantía de O(n log n)
   - Cuando necesitas estabilidad
   - Para ordenar listas enlazadas
   - Cuando tienes memoria suficiente

💡 COMPARACIÓN CON QUICK SORT:
   - Merge Sort: predecible pero usa más memoria
   - Quick Sort: más rápido en promedio pero puede ser O(n²)
   - Ambos son excelentes algoritmos!
"""

# 🏋️ EJERCICIOS PARA PRACTICAR

puts "\n" + "=" * 60
puts "🏋️  EJERCICIOS"
puts "=" * 60
puts """
1. Modifica merge_sort para contar cuántas comparaciones hace

2. Crea una versión que ordene de MAYOR a MENOR

3. Compara el uso de memoria de Merge Sort vs Quick Sort
   (Merge Sort usa más memoria, ¿puedes explicar por qué?)

4. Implementa una versión que muestre visualmente cómo se dividen
   los arrays en cada paso

💡 Merge Sort es el algoritmo que usa Ruby para ordenar listas grandes!
"""

