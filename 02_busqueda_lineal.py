"""
Búsqueda Lineal (Linear Search)

La búsqueda más simple que existe: revisas cada elemento uno por uno
hasta encontrar lo que buscas (o hasta llegar al final).

Es como buscar un libro en una pila desordenada:
¡No hay más remedio que revisar uno por uno!
"""


def busqueda_lineal(array, target):
    """
    Busca un elemento en un array revisando cada posición.
    
    Args:
        array: Lista de elementos (puede estar ordenada o no)
        target: El elemento que estamos buscando
    
    Returns:
        El índice del elemento si lo encuentra, None si no existe
    """
    print(f"🔍 Buscando {target} en el array...")
    print(f"Array: {array}\n")
    
    for i in range(len(array)):
        elemento_actual = array[i]
        print(f"  Posición {i}: {elemento_actual}", end="")
        
        if elemento_actual == target:
            print(f" ✅ ¡Encontrado!")
            return i
        else:
            print(f" ❌ No es {target}, seguimos...")
    
    print(f"\n❌ {target} no está en el array")
    return None


def busqueda_lineal_sin_prints(array, target):
    """
    Versión limpia de búsqueda lineal (sin prints para usar en otros algoritmos).
    """
    for i in range(len(array)):
        if array[i] == target:
            return i
    return None


# 🎯 EJEMPLOS DE USO

print("=" * 60)
print("EJEMPLO 1: Buscar en un array pequeño")
print("=" * 60)
array1 = [5, 2, 8, 1, 9, 3]
resultado1 = busqueda_lineal(array1, 8)

print("\n" + "=" * 60)
print("EJEMPLO 2: Buscar algo que no existe")
print("=" * 60)
array2 = [1, 2, 3, 4, 5]
resultado2 = busqueda_lineal(array2, 10)

print("\n" + "=" * 60)
print("EJEMPLO 3: Buscar en array con duplicados")
print("=" * 60)
array3 = [2, 5, 2, 8, 2, 9]
resultado3 = busqueda_lineal(array3, 2)  # Encuentra el primero

# 💡 CARACTERÍSTICAS IMPORTANTES

print("\n" + "=" * 60)
print("💡 CARACTERÍSTICAS DE BÚSQUEDA LINEAL")
print("=" * 60)
print("""
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
""")

# 🏋️ EJERCICIOS PARA PRACTICAR

print("\n" + "=" * 60)
print("🏋️  EJERCICIOS")
print("=" * 60)
print("""
1. Modifica la función para que cuente cuántas veces aparece el target
   Ejemplo: buscar 2 en [2, 5, 2, 8, 2] → aparece 3 veces

2. Crea una función que busque el elemento MÁXIMO usando búsqueda lineal

3. Crea una función que busque el elemento MÍNIMO usando búsqueda lineal

4. Modifica la función para que busque en un array de strings
   Ejemplo: buscar "hola" en ["hi", "hola", "hello"]

💡 Pista: Puedes usar el código de arriba como base y modificarlo
""")


