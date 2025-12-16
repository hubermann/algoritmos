# Quick Sort (Ordenamiento Rápido)
#
# Uno de los algoritmos de ordenamiento más eficientes!
# Usa la estrategia "Divide y Vencerás":
# 1. Elige un "pivote"
# 2. Divide el array en dos partes: menores y mayores que el pivote
# 3. Repite recursivamente con cada parte
#
# Es como organizar una lista: eliges un punto medio y separas todo a los lados.

def quick_sort(array, mostrar_pasos = false)
  # Ordena un array usando el algoritmo Quick Sort.
  #
  # Args:
  #     array: Lista de números a ordenar
  #     mostrar_pasos: Si true, muestra el proceso (puede ser verbose)
  #
  # Returns:
  #     El array ordenado
  return array if array.length <= 1
  
  # Elegimos el pivote (puede ser el primer, último, o del medio)
  # Usamos el del medio para mejor rendimiento promedio
  pivot = array[array.length / 2]
  
  if mostrar_pasos
    puts "Pivote elegido: #{pivot}"
    puts "Array: #{array}"
  end
  
  # Dividimos en tres partes
  menores = array.select { |x| x < pivot }
  iguales = array.select { |x| x == pivot }
  mayores = array.select { |x| x > pivot }
  
  if mostrar_pasos
    puts "  Menores que #{pivot}: #{menores}"
    puts "  Iguales a #{pivot}: #{iguales}"
    puts "  Mayores que #{pivot}: #{mayores}\n"
  end
  
  # Ordenamos recursivamente las partes menores y mayores
  # Y combinamos: menores + iguales + mayores
  quick_sort(menores, mostrar_pasos) + iguales + quick_sort(mayores, mostrar_pasos)
end

def quick_sort_inplace(array, low = 0, high = nil, mostrar_pasos = false)
  # Versión in-place de Quick Sort (más eficiente en memoria).
  # Modifica el array original en lugar de crear nuevos.
  #
  # Args:
  #     array: Lista a ordenar (se modifica in-place)
  #     low: Índice inicial
  #     high: Índice final
  #     mostrar_pasos: Si true, muestra el proceso
  high = array.length - 1 if high.nil?
  
  if low < high
    # Particionamos y obtenemos la posición del pivote
    pivot_idx = partition(array, low, high, mostrar_pasos)
    
    # Ordenamos recursivamente las dos partes
    quick_sort_inplace(array, low, pivot_idx - 1, mostrar_pasos)
    quick_sort_inplace(array, pivot_idx + 1, high, mostrar_pasos)
  end
end

def partition(array, low, high, mostrar_pasos = false)
  # Particiona el array usando el último elemento como pivote.
  # Coloca el pivote en su posición correcta y coloca todos los
  # elementos menores a la izquierda y mayores a la derecha.
  #
  # Returns:
  #     La posición final del pivote
  pivot = array[high]  # Elegimos el último elemento como pivote
  i = low - 1  # Índice del elemento más pequeño
  
  if mostrar_pasos
    puts "\nParticionando desde #{low} hasta #{high}"
    puts "Pivote: #{pivot}"
    puts "Array: #{array[low..high]}"
  end
  
  (low...high).each do |j|
    if array[j] <= pivot
      i += 1
      array[i], array[j] = array[j], array[i]
      if mostrar_pasos
        puts "  Intercambiando #{array[i]} y #{array[j]}"
      end
    end
  end
  
  # Colocamos el pivote en su posición correcta
  array[i + 1], array[high] = array[high], array[i + 1]
  
  if mostrar_pasos
    puts "Pivote #{pivot} colocado en posición #{i + 1}"
    puts "Resultado: #{array[low..high]}\n"
  end
  
  i + 1
end

# 🎯 EJEMPLOS DE USO

puts "=" * 60
puts "EJEMPLO 1: Quick Sort (versión simple)"
puts "=" * 60
array1 = [64, 34, 25, 12, 22, 11, 90]
puts "Original: #{array1}"
ordenado1 = quick_sort(array1, true)
puts "✅ Resultado final: #{ordenado1}"

puts "\n" + "=" * 60
puts "EJEMPLO 2: Quick Sort in-place (más eficiente)"
puts "=" * 60
array2 = [5, 2, 8, 1, 9, 3, 7]
puts "Antes:  #{array2}"
quick_sort_inplace(array2, 0, nil, false)
puts "Después: #{array2}"

puts "\n" + "=" * 60
puts "EJEMPLO 3: Comparación de velocidad"
puts "=" * 60

array_grande = [64, 34, 25, 12, 22, 11, 90, 5, 77, 88, 99, 1, 2, 3, 4, 55, 66, 44, 33, 22]

# Quick Sort
start = Time.now
resultado_quick = quick_sort(array_grande.dup)
tiempo_quick = Time.now - start

# Bubble Sort (para comparar) - versión simple
def bubble_sort_simple(arr)
  arr = arr.dup
  n = arr.length
  (0...n - 1).each do |i|
    (0...n - 1 - i).each do |j|
      if arr[j] > arr[j + 1]
        arr[j], arr[j + 1] = arr[j + 1], arr[j]
      end
    end
  end
  arr
end

start = Time.now
resultado_bubble = bubble_sort_simple(array_grande.dup)
tiempo_bubble = Time.now - start

puts "Array de #{array_grande.length} elementos:"
puts "Quick Sort:  #{tiempo_quick.round(6)} segundos"
puts "Bubble Sort: #{tiempo_bubble.round(6)} segundos"
puts "Quick Sort es #{(tiempo_bubble / tiempo_quick).round(1)}x más rápido! 🚀"

# 💡 CARACTERÍSTICAS IMPORTANTES

puts "\n" + "=" * 60
puts "💡 CARACTERÍSTICAS DE QUICK SORT"
puts "=" * 60
puts """
✅ VENTAJAS:
   - MUY rápido en promedio (uno de los más rápidos)
   - Eficiente en memoria (versión in-place)
   - Ampliamente usado en la práctica
   - Divide y vencerás es un patrón útil

❌ DESVENTAJAS:
   - Peor caso puede ser lento O(n²) si el pivote es malo
   - No es estable (puede cambiar orden de elementos iguales)
   - Más complejo que algoritmos básicos

📊 COMPLEJIDAD:
   - Tiempo promedio: O(n log n) - MUY rápido ✨
   - Tiempo mejor caso: O(n log n)
   - Tiempo peor caso: O(n²) - raro, pero puede pasar
   - Espacio: O(log n) - para la recursión

🎯 CUÁNDO USARLO:
   - Arrays grandes (es el más usado en producción)
   - Cuando la velocidad es importante
   - Cuando no necesitas estabilidad
   
💡 NOTA: Ruby usa quicksort mejorado para ordenar arrays
   pero Quick Sort es excelente para entender Divide y Vencerás
"""

# 🏋️ EJERCICIOS PARA PRACTICAR

puts "\n" + "=" * 60
puts "🏋️  EJERCICIOS"
puts "=" * 60
puts """
1. Modifica quick_sort para elegir el pivote de diferentes formas:
   - Primer elemento
   - Último elemento
   - Elemento aleatorio
   Compara el rendimiento

2. Crea una función que cuente cuántas comparaciones hace quick_sort

3. Compara quick_sort con los otros algoritmos de ordenamiento
   en arrays de diferentes tamaños

4. Implementa una versión que ordene de MAYOR a MENOR

💡 Quick Sort es el algoritmo de ordenamiento más usado en la práctica!
"""

