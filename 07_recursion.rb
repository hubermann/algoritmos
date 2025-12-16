# Recursión - Concepto Fundamental
#
# La recursión es cuando una función se llama a sí misma.
# Es como las muñecas rusas: cada una contiene otra igual pero más pequeña.
#
# Conceptos clave:
# - Caso base: cuándo parar (sin esto, sería infinito)
# - Caso recursivo: cómo avanzar hacia el caso base

# 🎯 EJEMPLO 1: Factorial
def factorial(n)
  # Calcula el factorial de n usando recursión.
  #
  # Factorial de 5 = 5 × 4 × 3 × 2 × 1 = 120
  #
  # Caso base: factorial(0) = 1, factorial(1) = 1
  # Caso recursivo: factorial(n) = n × factorial(n-1)
  # Caso base: detener la recursión
  if n <= 1
    puts "  factorial(#{n}) = 1 (caso base)"
    return 1
  end
  
  # Caso recursivo: llamar a la función otra vez
  puts "  Calculando factorial(#{n}) = #{n} × factorial(#{n-1})"
  resultado = n * factorial(n - 1)
  puts "  factorial(#{n}) = #{resultado}"
  resultado
end

# 🎯 EJEMPLO 2: Fibonacci
def fibonacci(n)
  # Calcula el n-ésimo número de Fibonacci usando recursión.
  #
  # Secuencia: 0, 1, 1, 2, 3, 5, 8, 13, 21, ...
  # Cada número es la suma de los dos anteriores.
  #
  # Caso base: fibonacci(0) = 0, fibonacci(1) = 1
  # Caso recursivo: fibonacci(n) = fibonacci(n-1) + fibonacci(n-2)
  return n if n <= 1
  
  fibonacci(n - 1) + fibonacci(n - 2)
end

# 🎯 EJEMPLO 3: Suma de elementos de un array
def suma_recursiva(array)
  # Suma todos los elementos de un array usando recursión.
  #
  # Idea: suma = primer elemento + suma del resto
  return 0 if array.empty?
  
  # Caso recursivo: primer elemento + suma del resto
  array[0] + suma_recursiva(array[1..-1])
end

# 🎯 EJEMPLO 4: Potencia
def potencia(base, exponente)
  # Calcula base^exponente usando recursión.
  #
  # Caso base: cualquier número a la 0 es 1
  # Caso recursivo: base^n = base × base^(n-1)
  return 1 if exponente == 0
  
  base * potencia(base, exponente - 1)
end

# 🎯 EJEMPLO 5: Contar elementos en un array
def contar_elementos(array)
  # Cuenta cuántos elementos hay en un array usando recursión.
  #
  # Idea: si está vacío, hay 0 elementos
  #       si no, hay 1 + cantidad en el resto
  return 0 if array.empty?
  
  1 + contar_elementos(array[1..-1])
end

# 🎯 EJEMPLO 6: Encontrar máximo en un array
def maximo_recursivo(array)
  # Encuentra el elemento máximo en un array usando recursión.
  # Caso base: array con un solo elemento
  return array[0] if array.length == 1
  
  # Caso recursivo: compara el primero con el máximo del resto
  max_resto = maximo_recursivo(array[1..-1])
  array[0] > max_resto ? array[0] : max_resto
end

# 🎯 EJEMPLO 7: Búsqueda binaria recursiva
def busqueda_binaria_recursiva(array, target, low = 0, high = nil)
  # Búsqueda binaria usando recursión en lugar de loops.
  high = array.length - 1 if high.nil?
  
  # Caso base 1: no encontrado
  return nil if low > high
  
  # Calculamos el punto medio
  mid = (low + high) / 2
  
  # Caso base 2: encontrado
  return mid if array[mid] == target
  
  # Caso recursivo: buscar en la mitad izquierda o derecha
  if array[mid] > target
    busqueda_binaria_recursiva(array, target, low, mid - 1)
  else
    busqueda_binaria_recursiva(array, target, mid + 1, high)
  end
end

# 🎯 DEMOSTRACIONES

puts "=" * 60
puts "EJEMPLO 1: Factorial"
puts "=" * 60
puts "\nCalculando factorial(5):"
resultado = factorial(5)
puts "\n✅ Resultado: #{resultado}"

puts "\n" + "=" * 60
puts "EJEMPLO 2: Fibonacci"
puts "=" * 60
puts "\nPrimeros 10 números de Fibonacci:"
(0...10).each do |i|
  puts "fibonacci(#{i}) = #{fibonacci(i)}"
end

puts "\n" + "=" * 60
puts "EJEMPLO 3: Suma Recursiva"
puts "=" * 60
array = [1, 2, 3, 4, 5]
puts "Array: #{array}"
puts "Suma: #{suma_recursiva(array)}"

puts "\n" + "=" * 60
puts "EJEMPLO 4: Potencia"
puts "=" * 60
puts "2^8 = #{potencia(2, 8)}"
puts "5^3 = #{potencia(5, 3)}"

puts "\n" + "=" * 60
puts "EJEMPLO 5: Contar Elementos"
puts "=" * 60
array = [1, 2, 3, 4, 5, 6, 7]
puts "Array: #{array}"
puts "Cantidad de elementos: #{contar_elementos(array)}"

puts "\n" + "=" * 60
puts "EJEMPLO 6: Máximo Recursivo"
puts "=" * 60
array = [3, 7, 2, 9, 1, 5]
puts "Array: #{array}"
puts "Máximo: #{maximo_recursivo(array)}"

puts "\n" + "=" * 60
puts "EJEMPLO 7: Búsqueda Binaria Recursiva"
puts "=" * 60
array_ordenado = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
target = 11
puts "Array ordenado: #{array_ordenado}"
puts "Buscando: #{target}"
resultado = busqueda_binaria_recursiva(array_ordenado, target)
puts "Encontrado en posición: #{resultado}"

# 💡 CONCEPTOS IMPORTANTES

puts "\n" + "=" * 60
puts "💡 CONCEPTOS CLAVE DE RECURSIÓN"
puts "=" * 60
puts """
1. CASO BASE:
   - Es la condición que detiene la recursión
   - Sin caso base, la función se llamaría infinitamente
   - Ejemplo: en factorial, el caso base es n <= 1

2. CASO RECURSIVO:
   - Es la parte que llama a la función otra vez
   - Debe acercarse al caso base en cada llamada
   - Ejemplo: factorial(n) llama a factorial(n-1)

3. PILA DE LLAMADAS (Call Stack):
   - Cada llamada recursiva se apila en memoria
   - Cuando llega al caso base, se desapila
   - Demasiada recursión puede causar "Stack Overflow"

✅ VENTAJAS:
   - Código más limpio y fácil de leer
   - Expresa problemas complejos de forma elegante
   - Natural para problemas que tienen estructura recursiva

❌ DESVENTAJAS:
   - Puede ser más lento que iterativo
   - Usa más memoria (pila de llamadas)
   - Puede causar stack overflow con recursión profunda

💡 TIP: Muchas funciones recursivas se pueden convertir a iterativas
   y viceversa. Cada una tiene sus ventajas.
"""

# 🏋️ EJERCICIOS PARA PRACTICAR

puts "\n" + "=" * 60
puts "🏋️  EJERCICIOS"
puts "=" * 60
puts """
1. Implementa factorial de forma ITERATIVA (con un loop)
   Compara con la versión recursiva

2. Crea una función recursiva para invertir un string
   Ejemplo: "hola" → "aloh"

3. Implementa una función recursiva para verificar si un string es palíndromo
   Ejemplo: "oso" es palíndromo, "hola" no lo es

4. Crea una función recursiva para encontrar el mínimo en un array

5. Implementa la suma de dígitos de un número usando recursión
   Ejemplo: suma_digitos(123) = 1 + 2 + 3 = 6

💡 La recursión es muy útil para problemas de "Divide y Vencerás"
"""

