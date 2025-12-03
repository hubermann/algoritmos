"""
Recursión - Concepto Fundamental

La recursión es cuando una función se llama a sí misma.
Es como las muñecas rusas: cada una contiene otra igual pero más pequeña.

Conceptos clave:
- Caso base: cuándo parar (sin esto, sería infinito)
- Caso recursivo: cómo avanzar hacia el caso base
"""


# 🎯 EJEMPLO 1: Factorial
def factorial(n):
    """
    Calcula el factorial de n usando recursión.
    
    Factorial de 5 = 5 × 4 × 3 × 2 × 1 = 120
    
    Caso base: factorial(0) = 1, factorial(1) = 1
    Caso recursivo: factorial(n) = n × factorial(n-1)
    """
    # Caso base: detener la recursión
    if n <= 1:
        print(f"  factorial({n}) = 1 (caso base)")
        return 1
    
    # Caso recursivo: llamar a la función otra vez
    print(f"  Calculando factorial({n}) = {n} × factorial({n-1})")
    resultado = n * factorial(n - 1)
    print(f"  factorial({n}) = {resultado}")
    return resultado


# 🎯 EJEMPLO 2: Fibonacci
def fibonacci(n):
    """
    Calcula el n-ésimo número de Fibonacci usando recursión.
    
    Secuencia: 0, 1, 1, 2, 3, 5, 8, 13, 21, ...
    Cada número es la suma de los dos anteriores.
    
    Caso base: fibonacci(0) = 0, fibonacci(1) = 1
    Caso recursivo: fibonacci(n) = fibonacci(n-1) + fibonacci(n-2)
    """
    if n <= 1:
        return n
    
    return fibonacci(n - 1) + fibonacci(n - 2)


# 🎯 EJEMPLO 3: Suma de elementos de un array
def suma_recursiva(array):
    """
    Suma todos los elementos de un array usando recursión.
    
    Idea: suma = primer elemento + suma del resto
    """
    # Caso base: array vacío
    if len(array) == 0:
        return 0
    
    # Caso recursivo: primer elemento + suma del resto
    return array[0] + suma_recursiva(array[1:])


# 🎯 EJEMPLO 4: Potencia
def potencia(base, exponente):
    """
    Calcula base^exponente usando recursión.
    
    Caso base: cualquier número a la 0 es 1
    Caso recursivo: base^n = base × base^(n-1)
    """
    if exponente == 0:
        return 1
    
    return base * potencia(base, exponente - 1)


# 🎯 EJEMPLO 5: Contar elementos en un array
def contar_elementos(array):
    """
    Cuenta cuántos elementos hay en un array usando recursión.
    
    Idea: si está vacío, hay 0 elementos
          si no, hay 1 + cantidad en el resto
    """
    if len(array) == 0:
        return 0
    
    return 1 + contar_elementos(array[1:])


# 🎯 EJEMPLO 6: Encontrar máximo en un array
def maximo_recursivo(array):
    """
    Encuentra el elemento máximo en un array usando recursión.
    """
    # Caso base: array con un solo elemento
    if len(array) == 1:
        return array[0]
    
    # Caso recursivo: compara el primero con el máximo del resto
    max_resto = maximo_recursivo(array[1:])
    return array[0] if array[0] > max_resto else max_resto


# 🎯 EJEMPLO 7: Búsqueda binaria recursiva
def busqueda_binaria_recursiva(array, target, low=0, high=None):
    """
    Búsqueda binaria usando recursión en lugar de loops.
    """
    if high is None:
        high = len(array) - 1
    
    # Caso base 1: no encontrado
    if low > high:
        return None
    
    # Calculamos el punto medio
    mid = (low + high) // 2
    
    # Caso base 2: encontrado
    if array[mid] == target:
        return mid
    
    # Caso recursivo: buscar en la mitad izquierda o derecha
    elif array[mid] > target:
        return busqueda_binaria_recursiva(array, target, low, mid - 1)
    else:
        return busqueda_binaria_recursiva(array, target, mid + 1, high)


# 🎯 DEMOSTRACIONES

print("=" * 60)
print("EJEMPLO 1: Factorial")
print("=" * 60)
print("\nCalculando factorial(5):")
resultado = factorial(5)
print(f"\n✅ Resultado: {resultado}")

print("\n" + "=" * 60)
print("EJEMPLO 2: Fibonacci")
print("=" * 60)
print("\nPrimeros 10 números de Fibonacci:")
for i in range(10):
    print(f"fibonacci({i}) = {fibonacci(i)}")

print("\n" + "=" * 60)
print("EJEMPLO 3: Suma Recursiva")
print("=" * 60)
array = [1, 2, 3, 4, 5]
print(f"Array: {array}")
print(f"Suma: {suma_recursiva(array)}")

print("\n" + "=" * 60)
print("EJEMPLO 4: Potencia")
print("=" * 60)
print(f"2^8 = {potencia(2, 8)}")
print(f"5^3 = {potencia(5, 3)}")

print("\n" + "=" * 60)
print("EJEMPLO 5: Contar Elementos")
print("=" * 60)
array = [1, 2, 3, 4, 5, 6, 7]
print(f"Array: {array}")
print(f"Cantidad de elementos: {contar_elementos(array)}")

print("\n" + "=" * 60)
print("EJEMPLO 6: Máximo Recursivo")
print("=" * 60)
array = [3, 7, 2, 9, 1, 5]
print(f"Array: {array}")
print(f"Máximo: {maximo_recursivo(array)}")

print("\n" + "=" * 60)
print("EJEMPLO 7: Búsqueda Binaria Recursiva")
print("=" * 60)
array_ordenado = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
target = 11
print(f"Array ordenado: {array_ordenado}")
print(f"Buscando: {target}")
resultado = busqueda_binaria_recursiva(array_ordenado, target)
print(f"Encontrado en posición: {resultado}")

# 💡 CONCEPTOS IMPORTANTES

print("\n" + "=" * 60)
print("💡 CONCEPTOS CLAVE DE RECURSIÓN")
print("=" * 60)
print("""
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
""")

# 🏋️ EJERCICIOS PARA PRACTICAR

print("\n" + "=" * 60)
print("🏋️  EJERCICIOS")
print("=" * 60)
print("""
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
""")

