# Selection Sort (Ordenamiento por Selección)
#
# La idea es simple:
# 1. Busca el elemento más pequeño
# 2. Lo pone al principio
# 3. Repite con el resto del array
#
# Es como ordenar cartas en tu mano: eliges la más pequeña
# y la pones en su lugar.

def selection_sort(array, mostrar_pasos = true)
  # Ordena un array usando el algoritmo Selection Sort.
  #
  # Cómo funciona:
  # 1. Encuentra el elemento mínimo en el array
  # 2. Lo intercambia con el primer elemento no ordenado
  # 3. Repite para el resto del array
  #
  # Args:
  #     array: Lista de números a ordenar
  #     mostrar_pasos: Si true, muestra el proceso paso a paso
  #
  # Returns:
  #     El array ordenado
  arr = array.dup
  n = arr.length
  
  if mostrar_pasos
    puts "🔄 Ordenando: #{arr}"
    puts "Tamaño: #{n} elementos\n"
  end
  
  # Iteramos por cada posición del array
  (0...n).each do |i|
    # Buscamos el índice del elemento más pequeño en la parte no ordenada
    min_idx = i  # Asumimos que el actual es el mínimo
    
    if mostrar_pasos
      puts "--- PASADA #{i + 1} ---"
      puts "  Buscando mínimo desde posición #{i} hasta #{n - 1}"
    end
    
    # Buscamos el mínimo en la parte no ordenada (desde i hasta el final)
    ((i + 1)...n).each do |j|
      if mostrar_pasos
        print "    Comparando arr[#{min_idx}]=#{arr[min_idx]} con arr[#{j}]=#{arr[j]}"
      end
      
      if arr[j] < arr[min_idx]
        min_idx = j
        if mostrar_pasos
          puts " → Nuevo mínimo encontrado!"
        end
      else
        if mostrar_pasos
          puts " → No cambia"
        end
      end
    end
    
    # Intercambiamos el mínimo encontrado con la posición actual
    if min_idx != i
      if mostrar_pasos
        puts "  Intercambiando arr[#{i}]=#{arr[i]} con arr[#{min_idx}]=#{arr[min_idx]}"
      end
      arr[i], arr[min_idx] = arr[min_idx], arr[i]
    else
      if mostrar_pasos
        puts "  arr[#{i}]=#{arr[i]} ya está en su lugar correcto"
      end
    end
    
    if mostrar_pasos
      puts "  Estado actual: #{arr}\n"
    end
  end
  
  arr
end

def selection_sort_sin_prints(array)
  # Versión limpia sin prints (para usar en otros algoritmos).
  arr = array.dup
  n = arr.length
  
  (0...n).each do |i|
    min_idx = i
    ((i + 1)...n).each do |j|
      min_idx = j if arr[j] < arr[min_idx]
    end
    arr[i], arr[min_idx] = arr[min_idx], arr[i]
  end
  
  arr
end

# 🎯 EJEMPLOS DE USO

puts "=" * 60
puts "EJEMPLO 1: Ordenar array pequeño paso a paso"
puts "=" * 60
array1 = [64, 25, 12, 22, 11]
puts "Original: #{array1}\n"
ordenado1 = selection_sort(array1, true)
puts "✅ Resultado final: #{ordenado1}"

puts "\n" + "=" * 60
puts "EJEMPLO 2: Comparar antes y después"
puts "=" * 60
array2 = [5, 2, 8, 1, 9, 3]
puts "Antes:  #{array2}"
ordenado2 = selection_sort(array2, false)
puts "Después: #{ordenado2}"

puts "\n" + "=" * 60
puts "EJEMPLO 3: Visualización gráfica del proceso"
puts "=" * 60
array3 = [7, 3, 5, 1, 9, 2]
puts "Original: #{array3}"
ordenado3 = selection_sort(array3, true)

# 💡 COMPARACIÓN CON BUBBLE SORT

puts "\n" + "=" * 60
puts "💡 SELECTION SORT vs BUBBLE SORT"
puts "=" * 60
puts """
SELECTION SORT:
✅ Hace MENOS intercambios que Bubble Sort
   - Solo hace un intercambio por pasada
   - Bubble Sort puede hacer muchos intercambios

❌ Siempre hace la misma cantidad de comparaciones
   - No se optimiza si el array ya está ordenado

BUBBLE SORT:
✅ Se puede optimizar si el array ya está ordenado
❌ Hace muchos intercambios innecesarios

📊 AMBOS tienen complejidad O(n²) en promedio
"""

# 💡 CARACTERÍSTICAS IMPORTANTES

puts "\n" + "=" * 60
puts "💡 CARACTERÍSTICAS DE SELECTION SORT"
puts "=" * 60
puts """
✅ VENTAJAS:
   - Simple de entender e implementar
   - Hace menos intercambios que Bubble Sort
   - No necesita memoria extra (in-place)
   - Rendimiento predecible (siempre similar)

❌ DESVENTAJAS:
   - Lento con arrays grandes
   - No se adapta si el array ya está ordenado
   - No es estable (puede cambiar orden de elementos iguales)

📊 COMPLEJIDAD:
   - Tiempo: O(n²) - siempre, en todos los casos
   - Espacio: O(1) - solo usa memoria constante

🎯 CUÁNDO USARLO:
   - Para aprender conceptos básicos
   - Cuando quieres minimizar el número de intercambios
   - Arrays pequeños donde la simplicidad importa más
"""

# 🏋️ EJERCICIOS PARA PRACTICAR

puts "\n" + "=" * 60
puts "🏋️  EJERCICIOS"
puts "=" * 60
puts """
1. Modifica selection_sort para ordenar de MAYOR a MENOR

2. Crea una función que cuente cuántas comparaciones hace selection_sort

3. Compara cuántos intercambios hace Selection Sort vs Bubble Sort
   con el mismo array

4. Modifica el algoritmo para encontrar el MÁXIMO en lugar del mínimo
   y ordenar de mayor a menor usando esa lógica

💡 Experimenta y compara con bubble_sort
"""

