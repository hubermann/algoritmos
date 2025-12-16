# Bubble Sort (Ordenamiento de Burbuja)
#
# Imagina burbujas subiendo en un vaso de refresco:
# los elementos más grandes "suben" hacia el final del array.
#
# Es el algoritmo de ordenamiento más simple (pero no el más eficiente).
# ¡Perfecto para entender cómo funcionan los ordenamientos!

def bubble_sort(array, mostrar_pasos = true)
  # Ordena un array usando el algoritmo Bubble Sort.
  #
  # Cómo funciona:
  # 1. Compara elementos adyacentes (el actual con el siguiente)
  # 2. Si están en el orden incorrecto, los intercambia
  # 3. Repite hasta que no haya más intercambios
  #
  # Args:
  #     array: Lista de números a ordenar
  #     mostrar_pasos: Si true, muestra el proceso paso a paso
  #
  # Returns:
  #     El array ordenado
  # Copiamos el array para no modificar el original
  arr = array.dup
  n = arr.length
  
  if mostrar_pasos
    puts "🔄 Ordenando: #{arr}"
    puts "Tamaño: #{n} elementos\n"
  end
  
  # Iteramos n-1 veces (pasadas por el array)
  (0...n - 1).each do |i|
    swapped = false  # Para optimizar: si no hay intercambios, ya está ordenado
    
    if mostrar_pasos
      puts "--- PASADA #{i + 1} ---"
    end
    
    # En cada pasada, comparamos elementos adyacentes
    # El -i es porque los últimos elementos ya están ordenados
    (0...n - 1 - i).each do |j|
      if mostrar_pasos
        print "  Comparando #{arr[j]} y #{arr[j + 1]}"
      end
      
      if arr[j] > arr[j + 1]
        # Intercambiamos los elementos
        arr[j], arr[j + 1] = arr[j + 1], arr[j]
        swapped = true
        
        if mostrar_pasos
          puts " → Intercambio: #{arr}"
        end
      else
        if mostrar_pasos
          puts " → OK, sin cambios"
        end
      end
    end
    
    if mostrar_pasos
      puts "  Resultado después de pasada #{i + 1}: #{arr}\n"
    end
    
    # Optimización: si no hubo intercambios, ya está ordenado
    unless swapped
      if mostrar_pasos
        puts "✨ ¡Ya está ordenado! Deteniendo antes de tiempo.\n"
      end
      break
    end
  end
  
  arr
end

def bubble_sort_sin_prints(array)
  # Versión limpia sin prints (para usar en otros algoritmos).
  arr = array.dup
  n = arr.length
  
  (0...n - 1).each do |i|
    swapped = false
    (0...n - 1 - i).each do |j|
      if arr[j] > arr[j + 1]
        arr[j], arr[j + 1] = arr[j + 1], arr[j]
        swapped = true
      end
    end
    break unless swapped
  end
  
  arr
end

# 🎯 EJEMPLOS DE USO

puts "=" * 60
puts "EJEMPLO 1: Ordenar array pequeño paso a paso"
puts "=" * 60
array1 = [64, 34, 25, 12, 22, 11, 90]
puts "Original: #{array1}\n"
ordenado1 = bubble_sort(array1, true)
puts "✅ Resultado final: #{ordenado1}"

puts "\n" + "=" * 60
puts "EJEMPLO 2: Comparar antes y después"
puts "=" * 60
array2 = [5, 2, 8, 1, 9, 3]
puts "Antes:  #{array2}"
ordenado2 = bubble_sort(array2, false)
puts "Después: #{ordenado2}"

puts "\n" + "=" * 60
puts "EJEMPLO 3: Array que ya está ordenado (caso óptimo)"
puts "=" * 60
array3 = [1, 2, 3, 4, 5]
ordenado3 = bubble_sort(array3, true)

puts "\n" + "=" * 60
puts "EJEMPLO 4: Array ordenado al revés (caso peor)"
puts "=" * 60
array4 = [5, 4, 3, 2, 1]
ordenado4 = bubble_sort(array4, true)

# 💡 CARACTERÍSTICAS IMPORTANTES

puts "\n" + "=" * 60
puts "💡 CARACTERÍSTICAS DE BUBBLE SORT"
puts "=" * 60
puts """
✅ VENTAJAS:
   - Súper fácil de entender
   - Fácil de implementar
   - No necesita memoria extra (ordenamiento in-place)
   - Estable (mantiene el orden relativo de elementos iguales)

❌ DESVENTAJAS:
   - MUY lento con arrays grandes
   - Hace muchas comparaciones innecesarias

📊 COMPLEJIDAD:
   - Tiempo promedio: O(n²) - "O de n al cuadrado"
   - Tiempo mejor caso: O(n) - cuando ya está ordenado (con optimización)
   - Tiempo peor caso: O(n²) - cuando está ordenado al revés
   - Espacio: O(1) - solo usa memoria constante

🎯 CUÁNDO USARLO:
   - Para aprender conceptos básicos
   - Arrays muy pequeños (< 10 elementos)
   - Cuando la simplicidad es más importante que la velocidad
   
⚠️  EN PRODUCCIÓN: Usa algoritmos más eficientes como Quick Sort o Merge Sort
"""

# 🏋️ EJERCICIOS PARA PRACTICAR

puts "\n" + "=" * 60
puts "🏋️  EJERCICIOS"
puts "=" * 60
puts """
1. Modifica bubble_sort para ordenar de MAYOR a MENOR (descendente)

2. Crea una función que cuente cuántos intercambios hace bubble_sort

3. Compara el tiempo que tarda bubble_sort con arrays de diferentes tamaños
   Tip: usa Time.now

4. Ordena un array de strings alfabéticamente usando bubble_sort
   Ejemplo: ["banana", "apple", "cherry"]

💡 Experimenta cambiando el código y viendo qué pasa
"""

