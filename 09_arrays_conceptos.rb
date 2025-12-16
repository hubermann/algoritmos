# Arrays (Arreglos) - Conceptos Fundamentales
#
# Un array es una estructura de datos que almacena elementos
# del mismo tipo en posiciones contiguas de memoria.
#
# Es como un estante con compartimentos numerados:
# - Cada compartimento tiene un número (índice)
# - Puedes acceder directamente a cualquier compartimento
# - Los elementos están ordenados uno tras otro

def operaciones_array_basicas
  # Demuestra las operaciones básicas con arrays.
  puts "=" * 60
  puts "OPERACIONES BÁSICAS CON ARRAYS"
  puts "=" * 60
  
  # Crear un array
  arr = [1, 2, 3, 4, 5]
  puts "\n1. Crear array: #{arr}"
  
  # Acceder a un elemento por índice
  puts "2. Acceder al índice 2: arr[2] = #{arr[2]}"
  
  # Modificar un elemento
  arr[0] = 10
  puts "3. Modificar arr[0] = 10: #{arr}"
  
  # Agregar elemento al final
  arr << 6
  puts "4. Agregar 6 al final: #{arr}"
  
  # Insertar en una posición específica
  arr.insert(2, 99)
  puts "5. Insertar 99 en posición 2: #{arr}"
  
  # Eliminar elemento por valor
  arr.delete(99)
  puts "6. Eliminar 99: #{arr}"
  
  # Eliminar por índice
  elemento = arr.delete_at(0)
  puts "7. Eliminar y obtener elemento en índice 0: #{elemento}"
  puts "   Array después: #{arr}"
  
  # Buscar índice de un elemento
  indice = arr.index(4)
  puts "8. Índice del elemento 4: #{indice}"
  
  # Longitud del array
  puts "9. Longitud del array: #{arr.length}"
  
  # Verificar si un elemento existe
  existe = arr.include?(5)
  puts "10. ¿Existe el 5?: #{existe}"
  
  # Contar ocurrencias
  arr_con_duplicados = [1, 2, 2, 3, 2, 4]
  cantidad = arr_con_duplicados.count(2)
  puts "11. Cantidad de veces que aparece 2: #{cantidad}"
end

def recorrer_arrays
  # Diferentes formas de recorrer un array.
  puts "\n" + "=" * 60
  puts "FORMAS DE RECORRER UN ARRAY"
  puts "=" * 60
  
  arr = [10, 20, 30, 40, 50]
  
  # Método 1: Por índice
  puts "\n1. Recorrer por índice:"
  (0...arr.length).each do |i|
    puts "   arr[#{i}] = #{arr[i]}"
  end
  
  # Método 2: Por elemento directamente
  puts "\n2. Recorrer elementos directamente:"
  arr.each do |elemento|
    puts "   #{elemento}"
  end
  
  # Método 3: Con each_with_index (índice y valor)
  puts "\n3. Recorrer con índice y valor (each_with_index):"
  arr.each_with_index do |valor, indice|
    puts "   arr[#{indice}] = #{valor}"
  end
  
  # Método 4: Al revés
  puts "\n4. Recorrer al revés:"
  (arr.length - 1).downto(0) do |i|
    puts "   arr[#{i}] = #{arr[i]}"
  end
end

def arrays_multidimensionales
  # Arrays de múltiples dimensiones (matrices).
  puts "\n" + "=" * 60
  puts "ARRAYS MULTIDIMENSIONALES (MATRICES)"
  puts "=" * 60
  
  # Matriz 2D (3 filas, 4 columnas)
  matriz = [
    [1, 2, 3, 4],
    [5, 6, 7, 8],
    [9, 10, 11, 12]
  ]
  
  puts "\nMatriz 3x4:"
  matriz.each do |fila|
    puts "   #{fila}"
  end
  
  # Acceder a un elemento específico
  puts "\nElemento en fila 1, columna 2: #{matriz[1][2]}"
  
  # Modificar un elemento
  matriz[0][0] = 99
  puts "\nDespués de cambiar matriz[0][0] = 99:"
  matriz.each do |fila|
    puts "   #{fila}"
  end
end

def slicing_arrays
  # Rebanar arrays (slicing) en Ruby.
  puts "\n" + "=" * 60
  puts "REBANAR ARRAYS (SLICING)"
  puts "=" * 60
  
  arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  puts "Array original: #{arr}"
  
  puts "\narr[2, 4] = #{arr[2, 4]}"  # Desde índice 2, 4 elementos
  puts "arr[0..4] = #{arr[0..4]}"      # Desde el inicio hasta 4
  puts "arr[5..-1] = #{arr[5..-1]}"      # Desde 5 hasta el final
  puts "arr.select.with_index { |_, i| i.even? } = #{arr.select.with_index { |_, i| i.even? }}"    # Cada 2 elementos
  puts "arr.reverse = #{arr.reverse}"  # Al revés (invertir)
end

def buscar_en_arrays
  # Algoritmos de búsqueda en arrays.
  puts "\n" + "=" * 60
  puts "BÚSQUEDA EN ARRAYS"
  puts "=" * 60
  
  arr = [10, 20, 30, 40, 50, 60, 70]
  target = 40
  
  # Búsqueda lineal
  puts "\nBuscando #{target} en #{arr}"
  arr.each_with_index do |num, i|
    if num == target
      puts "✅ Encontrado en índice #{i}"
      break
    end
  end
  
  # Búsqueda binaria (array debe estar ordenado)
  arr_ordenado = [64, 34, 25, 12, 22, 11, 90].sort
  target2 = 34
  puts "\nBúsqueda binaria de #{target2} en #{arr_ordenado}"
  
  low, high = 0, arr_ordenado.length - 1
  while low <= high
    mid = (low + high) / 2
    if arr_ordenado[mid] == target2
      puts "✅ Encontrado en índice #{mid}"
      break
    elsif arr_ordenado[mid] < target2
      low = mid + 1
    else
      high = mid - 1
    end
  end
end

def operaciones_comunes
  # Operaciones comunes y útiles con arrays.
  puts "\n" + "=" * 60
  puts "OPERACIONES COMUNES Y ÚTILES"
  puts "=" * 60
  
  # Ordenar
  arr = [64, 34, 25, 12, 22, 11, 90]
  puts "\n1. Array original: #{arr}"
  arr_ordenado = arr.sort  # No modifica el original
  puts "   Ordenado (nuevo): #{arr_ordenado}"
  arr.sort!  # Modifica el original
  puts "   Después de arr.sort!: #{arr}"
  
  # Revertir
  arr2 = [1, 2, 3, 4, 5]
  puts "\n2. Array original: #{arr2}"
  arr2.reverse!
  puts "   Después de reverse!: #{arr2}"
  
  # Suma, máximo, mínimo
  arr3 = [10, 20, 30, 40, 50]
  puts "\n3. Array: #{arr3}"
  puts "   Suma: #{arr3.sum}"
  puts "   Máximo: #{arr3.max}"
  puts "   Mínimo: #{arr3.min}"
  
  # Crear array con range
  arr4 = (0...10).to_a
  puts "\n4. Array con (0...10).to_a: #{arr4}"
  
  # Array comprehension (crear arrays de forma elegante)
  cuadrados = (0...10).map { |x| x**2 }
  puts "\n5. Cuadrados de 0-9: #{cuadrados}"
  
  pares = (0...20).select { |x| x.even? }
  puts "   Números pares 0-19: #{pares}"
end

# 🎯 EJECUTAR TODOS LOS EJEMPLOS

if __FILE__ == $0
  operaciones_array_basicas
  recorrer_arrays
  arrays_multidimensionales
  slicing_arrays
  buscar_en_arrays
  operaciones_comunes
  
  # 💡 RESUMEN
  puts "\n" + "=" * 60
  puts "💡 CARACTERÍSTICAS DE ARRAYS"
  puts "=" * 60
  puts """
✅ VENTAJAS:
   - Acceso rápido a cualquier elemento: O(1)
   - Fácil de entender y usar
   - Eficiente en memoria (elementos contiguos)

❌ DESVENTAJAS:
   - Tamaño fijo (en algunos lenguajes)
   - Insertar/eliminar en medio es costoso: O(n)
   - No puede almacenar diferentes tipos de datos

📊 COMPLEJIDAD DE OPERACIONES:
   - Acceder por índice: O(1)
   - Buscar elemento: O(n)
   - Insertar al final: O(1)
   - Insertar en medio: O(n)
   - Eliminar: O(n)

🎯 CUÁNDO USAR:
   - Cuando necesitas acceso aleatorio rápido
   - Cuando el tamaño es conocido de antemano
   - Para almacenar secuencias ordenadas
    """
  
  puts "\n" + "=" * 60
  puts "🏋️  EJERCICIOS"
  puts "=" * 60
  puts """
1. Crea una función que encuentre el segundo elemento más grande en un array

2. Escribe una función que invierta un array sin usar métodos built-in

3. Crea una función que elimine duplicados de un array manteniendo el orden

4. Implementa una función que rote un array k posiciones hacia la derecha
   Ejemplo: [1,2,3,4,5] rotado 2 → [4,5,1,2,3]

5. Escribe una función que encuentre la suma máxima de elementos contiguos
   Ejemplo: [-2, 1, -3, 4, -1, 2, 1, -5, 4] → suma máxima es 6

💡 Practica manipulando arrays, es fundamental para programar!
    """
end

