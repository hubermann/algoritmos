# Búsqueda Lineal (Linear Search)
#
# La búsqueda más simple que existe: revisas cada elemento uno por uno
# hasta encontrar lo que buscas (o hasta llegar al final).
#
# Es como buscar un libro en una pila desordenada:
# ¡No hay más remedio que revisar uno por uno!

def busqueda_lineal(array, target)
  # Busca un elemento en un array revisando cada posición.
  #
  # Args:
  #     array: Lista de elementos (puede estar ordenada o no)
  #     target: El elemento que estamos buscando
  #
  # Returns:
  #     El índice del elemento si lo encuentra, nil si no existe
  puts "🔍 Buscando #{target} en el array..."
  puts "Array: #{array}\n"
  
  array.each_with_index do |elemento_actual, i|
    print "  Posición #{i}: #{elemento_actual}"
    
    if elemento_actual == target
      puts " ✅ ¡Encontrado!"
      return i
    else
      puts " ❌ No es #{target}, seguimos..."
    end
  end
  
  puts "\n❌ #{target} no está en el array"
  nil
end

def busqueda_lineal_sin_prints(array, target)
  # Versión limpia de búsqueda lineal (sin prints para usar en otros algoritmos).
  array.each_with_index do |elemento, i|
    return i if elemento == target
  end
  nil
end

# 🎯 EJEMPLOS DE USO

puts "=" * 60
puts "EJEMPLO 1: Buscar en un array pequeño"
puts "=" * 60
array1 = [5, 2, 8, 1, 9, 3]
resultado1 = busqueda_lineal(array1, 8)

puts "\n" + "=" * 60
puts "EJEMPLO 2: Buscar algo que no existe"
puts "=" * 60
array2 = [1, 2, 3, 4, 5]
resultado2 = busqueda_lineal(array2, 10)

puts "\n" + "=" * 60
puts "EJEMPLO 3: Buscar en array con duplicados"
puts "=" * 60
array3 = [2, 5, 2, 8, 2, 9]
resultado3 = busqueda_lineal(array3, 2)  # Encuentra el primero

# 💡 CARACTERÍSTICAS IMPORTANTES

puts "\n" + "=" * 60
puts "💡 CARACTERÍSTICAS DE BÚSQUEDA LINEAL"
puts "=" * 60
puts """
✅ VENTAJAS:
   - Súper simple de entender y programar
   - Funciona con arrays ordenados Y desordenados
   - No necesita que el array esté ordenado

❌ DESVENTAJAS:
   - Lento con arrays grandes
   - En el peor caso, revisa TODOS los elementos

📊 COMPLEJIDAD:
   - Tiempo: O(n) - revisa hasta n elementos
   - Espacio: O(1) - solo usa memoria constante

🎯 CUÁNDO USARLA:
   - Arrays pequeños (< 100 elementos)
   - Cuando no sabes si está ordenado
   - Cuando es más importante la simplicidad que la velocidad
"""

# 🏋️ EJERCICIOS PARA PRACTICAR

puts "\n" + "=" * 60
puts "🏋️  EJERCICIOS"
puts "=" * 60
puts """
1. Modifica la función para que cuente cuántas veces aparece el target
   Ejemplo: buscar 2 en [2, 5, 2, 8, 2] → aparece 3 veces

2. Crea una función que busque el elemento MÁXIMO usando búsqueda lineal

3. Crea una función que busque el elemento MÍNIMO usando búsqueda lineal

4. Modifica la función para que busque en un array de strings
   Ejemplo: buscar "hola" en ["hi", "hola", "hello"]

💡 Pista: Puedes usar el código de arriba como base y modificarlo
"""

