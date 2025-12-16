# Insertion Sort (Ordenamiento por Inserción)
#
# Es como ordenar cartas en tu mano:
# 1. Tomas una carta
# 2. La insertas en el lugar correcto
# 3. Repites con la siguiente
#
# Muy eficiente para arrays pequeños o casi ordenados!

def insertion_sort(array, mostrar_pasos = true)
  # Ordena un array usando el algoritmo Insertion Sort.
  #
  # Cómo funciona:
  # 1. Empieza desde el segundo elemento
  # 2. Lo compara con los anteriores y lo inserta en su lugar correcto
  # 3. Repite para cada elemento siguiente
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
  
  # Empezamos desde el segundo elemento (índice 1)
  (1...n).each do |i|
    # El elemento que vamos a insertar en su lugar
    valor_actual = arr[i]
    j = i - 1  # Índice del elemento anterior
    
    if mostrar_pasos
      puts "--- PASADA #{i} ---"
      puts "  Insertando #{valor_actual} (posición #{i}) en su lugar correcto"
    end
    
    # Movemos los elementos mayores hacia la derecha
    while j >= 0 && arr[j] > valor_actual
      if mostrar_pasos
        puts "    Moviendo #{arr[j]} de posición #{j} a #{j + 1}"
      end
      arr[j + 1] = arr[j]
      j -= 1
    end
    
    # Insertamos el valor en su lugar correcto
    arr[j + 1] = valor_actual
    
    if mostrar_pasos
      puts "  #{valor_actual} insertado en posición #{j + 1}"
      puts "  Estado actual: #{arr}\n"
    end
  end
  
  arr
end

def insertion_sort_sin_prints(array)
  # Versión limpia sin prints (para usar en otros algoritmos).
  arr = array.dup
  n = arr.length
  
  (1...n).each do |i|
    valor_actual = arr[i]
    j = i - 1
    
    while j >= 0 && arr[j] > valor_actual
      arr[j + 1] = arr[j]
      j -= 1
    end
    
    arr[j + 1] = valor_actual
  end
  
  arr
end

# 🎯 EJEMPLOS DE USO

puts "=" * 60
puts "EJEMPLO 1: Ordenar array pequeño paso a paso"
puts "=" * 60
array1 = [12, 11, 13, 5, 6]
puts "Original: #{array1}\n"
ordenado1 = insertion_sort(array1, true)
puts "✅ Resultado final: #{ordenado1}"

puts "\n" + "=" * 60
puts "EJEMPLO 2: Comparar antes y después"
puts "=" * 60
array2 = [5, 2, 8, 1, 9, 3]
puts "Antes:  #{array2}"
ordenado2 = insertion_sort(array2, false)
puts "Después: #{ordenado2}"

puts "\n" + "=" * 60
puts "EJEMPLO 3: Array casi ordenado (caso óptimo)"
puts "=" * 60
array3 = [1, 2, 3, 5, 4, 6, 7]  # Solo el 4 está fuera de lugar
puts "Original: #{array3}"
ordenado3 = insertion_sort(array3, true)

puts "\n" + "=" * 60
puts "EJEMPLO 4: Array ordenado al revés (caso peor)"
puts "=" * 60
array4 = [5, 4, 3, 2, 1]
ordenado4 = insertion_sort(array4, true)

# 💡 COMPARACIÓN CON OTROS ALGORITMOS

puts "\n" + "=" * 60
puts "💡 INSERTION SORT vs OTROS"
puts "=" * 60
puts """
INSERTION SORT:
✅ Muy eficiente para arrays pequeños (< 50 elementos)
✅ Excelente si el array está casi ordenado
✅ Estable (mantiene orden de elementos iguales)
✅ Simple de entender
✅ Funciona bien en arrays pequeños en la práctica

❌ Lento con arrays grandes desordenados

BUBBLE SORT vs SELECTION SORT:
- Insertion Sort es generalmente más eficiente
- Hace menos comparaciones en muchos casos
- Mejor comportamiento en arrays casi ordenados
"""

# 💡 CARACTERÍSTICAS IMPORTANTES

puts "\n" + "=" * 60
puts "💡 CARACTERÍSTICAS DE INSERTION SORT"
puts "=" * 60
puts """
✅ VENTAJAS:
   - Eficiente para arrays pequeños
   - Muy rápido si el array está casi ordenado
   - Estable (no cambia orden de elementos iguales)
   - Simple y fácil de implementar
   - No necesita memoria extra (in-place)
   - Adaptativo (se adapta a datos parcialmente ordenados)

❌ DESVENTAJAS:
   - Lento con arrays grandes y desordenados
   - Muchas comparaciones y movimientos en caso peor

📊 COMPLEJIDAD:
   - Tiempo mejor caso: O(n) - cuando ya está ordenado ✨
   - Tiempo promedio: O(n²)
   - Tiempo peor caso: O(n²) - cuando está ordenado al revés
   - Espacio: O(1) - solo usa memoria constante

🎯 CUÁNDO USARLO:
   - Arrays pequeños (< 50 elementos)
   - Arrays casi ordenados
   - Como parte de algoritmos más complejos (Tim Sort usa Insertion Sort)
   - En la vida real: muchos algoritmos híbridos lo usan para casos pequeños
"""

# 🏋️ EJERCICIOS PARA PRACTICAR

puts "\n" + "=" * 60
puts "🏋️  EJERCICIOS"
puts "=" * 60
puts """
1. Modifica insertion_sort para ordenar de MAYOR a MENOR

2. Crea una función que cuente cuántas comparaciones hace insertion_sort
   Compara con bubble_sort y selection_sort

3. Prueba insertion_sort con un array que ya está ordenado
   ¿Cuántas comparaciones hace? (Debería ser muy pocas)

4. Ordena un array de strings usando insertion_sort
   Ejemplo: ["zebra", "apple", "banana", "cherry"]

5. Compara el rendimiento de los 3 algoritmos básicos:
   - Bubble Sort
   - Selection Sort  
   - Insertion Sort
   ¿Cuál es más rápido en diferentes situaciones?

💡 Insertion Sort es muy usado en la práctica para arrays pequeños!
"""

