# ¿Qué es Complejidad? (Big O Notation)
#
# Imagina que tienes que buscar un número en una lista:
# - Si tienes 10 números, es fácil
# - Si tienes 1,000,000 números... ¿cuánto tardará?
#
# La complejidad nos dice cuánto tiempo o memoria necesita un algoritmo
# según el tamaño de los datos que le damos.

def ejemplo_busqueda_lineal(array, target)
  # Búsqueda lineal: revisa uno por uno
  #
  # Complejidad: O(n) - "O de n"
  # - n = cantidad de elementos
  # - En el peor caso, revisa TODOS los elementos
  pasos = 0
  array.each_with_index do |num, i|
    pasos += 1
    puts "Paso #{pasos}: Revisando posición #{i}, valor = #{num}"
    if num == target
      puts "✅ ¡Encontrado en #{pasos} pasos!"
      return i
    end
  end
  puts "❌ No encontrado después de #{pasos} pasos"
  nil
end

def ejemplo_busqueda_binaria(array, target)
  # Búsqueda binaria: divide por la mitad cada vez
  #
  # Complejidad: O(log n) - "O de logaritmo de n"
  # - Mucho más rápido que búsqueda lineal
  # - Pero el array DEBE estar ordenado
  pasos = 0
  low = 0
  high = array.length - 1
  
  while low <= high
    pasos += 1
    mid = (low + high) / 2
    guess = array[mid]
    puts "Paso #{pasos}: Revisando posición #{mid}, valor = #{guess}"
    
    if guess == target
      puts "✅ ¡Encontrado en #{pasos} pasos!"
      return mid
    elsif guess > target
      high = mid - 1
    else
      low = mid + 1
    end
  end
  
  puts "❌ No encontrado después de #{pasos} pasos"
  nil
end

# 🎯 COMPARACIÓN PRÁCTICA

puts "=" * 60
puts "COMPARACIÓN: Búsqueda Lineal vs Búsqueda Binaria"
puts "=" * 60

# Crear un array grande
array_grande = (1..1_000_000).to_a  # 1 a 1,000,000
target = 500_000

puts "\n🔍 Buscando #{target} en un array de 1,000,000 elementos\n"

puts "1️⃣  BÚSQUEDA LINEAL (O(n)):"
puts "-" * 60
# Nota: Esto tardará mucho, así que usemos un ejemplo más pequeño para ver los pasos
array_pequeño = (1..100).to_a  # 1 a 100
ejemplo_busqueda_lineal(array_pequeño, 75)

puts "\n2️⃣  BÚSQUEDA BINARIA (O(log n)):"
puts "-" * 60
ejemplo_busqueda_binaria(array_pequeño, 75)

puts "\n" + "=" * 60
puts "💡 CONCLUSIÓN:"
puts "=" * 60
puts """
Con 100 elementos:
- Búsqueda lineal: hasta 100 pasos
- Búsqueda binaria: máximo ~7 pasos

Con 1,000,000 elementos:
- Búsqueda lineal: hasta 1,000,000 pasos 😱
- Búsqueda binaria: máximo ~20 pasos 🚀

¡La diferencia es ENORME cuando el array es grande!
"""

# 📊 TABLA DE COMPLEJIDADES COMUNES
puts "=" * 60
puts "📊 COMPLEJIDADES MÁS COMUNES (de mejor a peor):"
puts "=" * 60
puts """
O(1)        - Constante:      Acceder a un elemento del array
O(log n)    - Logarítmica:    Búsqueda binaria
O(n)        - Lineal:         Recorrer un array
O(n log n)  - Cuasi-lineal:   Quick sort, Merge sort
O(n²)       - Cuadrática:     Dos loops anidados
O(2^n)      - Exponencial:    Muy lento, evitar si es posible

Regla general: mientras más a la derecha, más lento ⏱️
"""

