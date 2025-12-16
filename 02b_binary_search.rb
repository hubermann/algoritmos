def binary_search(array, item)
  # Busca un item en un array ordenado usando búsqueda binaria.
  #
  # Args:
  #     array: Lista ordenada de números
  #     item: Elemento a buscar
  #
  # Returns:
  #     Índice del item si se encuentra, nil si no existe
  low = 0
  high = array.length - 1

  while low <= high
    # PASO 1: Calculamos el punto medio entre low y high
    mid = (low + high) / 2  # En Ruby, esto puede ser Float, pero funciona para índices
    puts "Paso 1 - Calculamos mid: (#{low} + #{high}) / 2 = #{mid}"
    
    # PASO 2: Obtenemos el valor que está en esa posición
    guess = array[mid]
    puts "Paso 2 - El valor en posición #{mid} es: #{guess}"
    
    # PASO 3: Comparamos con el item que buscamos
    if guess == item
      puts "Paso 3 - ¡Encontrado! #{guess} == #{item}"
      return mid
    elsif guess > item
      # PASO 4a: Si guess es mayor, buscamos en la mitad izquierda
      puts "Paso 3 - #{guess} > #{item}, entonces buscamos en la izquierda"
      high = mid - 1
      puts "Paso 4a - Nuevo high = #{high}"
    else
      # PASO 4b: Si guess es menor, buscamos en la mitad derecha
      puts "Paso 3 - #{guess} < #{item}, entonces buscamos en la derecha"
      low = mid + 1
      puts "Paso 4b - Nuevo low = #{low}"
    end
    puts ""  # Línea en blanco para separar cada iteración
  end
  nil
end

# Ejemplo de uso: el array DEBE estar ordenado para que funcione
sorted_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 23, 34, 56, 88]
target = 88

puts "Buscando #{target} en el array ordenado:"
puts "Resultado: #{binary_search(sorted_array, target)}"

