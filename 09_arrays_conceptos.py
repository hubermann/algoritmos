"""
Arrays (Arreglos) - Conceptos Fundamentales

Un array es una estructura de datos que almacena elementos
del mismo tipo en posiciones contiguas de memoria.

Es como un estante con compartimentos numerados:
- Cada compartimento tiene un número (índice)
- Puedes acceder directamente a cualquier compartimento
- Los elementos están ordenados uno tras otro
"""


def operaciones_array_basicas():
    """
    Demuestra las operaciones básicas con arrays.
    """
    print("=" * 60)
    print("OPERACIONES BÁSICAS CON ARRAYS")
    print("=" * 60)
    
    # Crear un array
    arr = [1, 2, 3, 4, 5]
    print(f"\n1. Crear array: {arr}")
    
    # Acceder a un elemento por índice
    print(f"2. Acceder al índice 2: arr[2] = {arr[2]}")
    
    # Modificar un elemento
    arr[0] = 10
    print(f"3. Modificar arr[0] = 10: {arr}")
    
    # Agregar elemento al final
    arr.append(6)
    print(f"4. Agregar 6 al final: {arr}")
    
    # Insertar en una posición específica
    arr.insert(2, 99)
    print(f"5. Insertar 99 en posición 2: {arr}")
    
    # Eliminar elemento por valor
    arr.remove(99)
    print(f"6. Eliminar 99: {arr}")
    
    # Eliminar por índice
    elemento = arr.pop(0)
    print(f"7. Eliminar y obtener elemento en índice 0: {elemento}")
    print(f"   Array después: {arr}")
    
    # Buscar índice de un elemento
    indice = arr.index(4)
    print(f"8. Índice del elemento 4: {indice}")
    
    # Longitud del array
    print(f"9. Longitud del array: {len(arr)}")
    
    # Verificar si un elemento existe
    existe = 5 in arr
    print(f"10. ¿Existe el 5?: {existe}")
    
    # Contar ocurrencias
    arr_con_duplicados = [1, 2, 2, 3, 2, 4]
    cantidad = arr_con_duplicados.count(2)
    print(f"11. Cantidad de veces que aparece 2: {cantidad}")


def recorrer_arrays():
    """Diferentes formas de recorrer un array."""
    print("\n" + "=" * 60)
    print("FORMAS DE RECORRER UN ARRAY")
    print("=" * 60)
    
    arr = [10, 20, 30, 40, 50]
    
    # Método 1: Por índice
    print("\n1. Recorrer por índice:")
    for i in range(len(arr)):
        print(f"   arr[{i}] = {arr[i]}")
    
    # Método 2: Por elemento directamente
    print("\n2. Recorrer elementos directamente:")
    for elemento in arr:
        print(f"   {elemento}")
    
    # Método 3: Con enumerate (índice y valor)
    print("\n3. Recorrer con índice y valor (enumerate):")
    for indice, valor in enumerate(arr):
        print(f"   arr[{indice}] = {valor}")
    
    # Método 4: Al revés
    print("\n4. Recorrer al revés:")
    for i in range(len(arr) - 1, -1, -1):
        print(f"   arr[{i}] = {arr[i]}")


def arrays_multidimensionales():
    """Arrays de múltiples dimensiones (matrices)."""
    print("\n" + "=" * 60)
    print("ARRAYS MULTIDIMENSIONALES (MATRICES)")
    print("=" * 60)
    
    # Matriz 2D (3 filas, 4 columnas)
    matriz = [
        [1, 2, 3, 4],
        [5, 6, 7, 8],
        [9, 10, 11, 12]
    ]
    
    print("\nMatriz 3x4:")
    for fila in matriz:
        print(f"   {fila}")
    
    # Acceder a un elemento específico
    print(f"\nElemento en fila 1, columna 2: {matriz[1][2]}")
    
    # Modificar un elemento
    matriz[0][0] = 99
    print(f"\nDespués de cambiar matriz[0][0] = 99:")
    for fila in matriz:
        print(f"   {fila}")


def slicing_arrays():
    """Rebanar arrays (slicing) en Python."""
    print("\n" + "=" * 60)
    print("REBANAR ARRAYS (SLICING)")
    print("=" * 60)
    
    arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    print(f"Array original: {arr}")
    
    print(f"\narr[2:6] = {arr[2:6]}")  # Desde índice 2 hasta 6 (sin incluir)
    print(f"arr[:5] = {arr[:5]}")      # Desde el inicio hasta 5
    print(f"arr[5:] = {arr[5:]}")      # Desde 5 hasta el final
    print(f"arr[::2] = {arr[::2]}")    # Cada 2 elementos
    print(f"arr[::-1] = {arr[::-1]}")  # Al revés (invertir)


def buscar_en_arrays():
    """Algoritmos de búsqueda en arrays."""
    print("\n" + "=" * 60)
    print("BÚSQUEDA EN ARRAYS")
    print("=" * 60)
    
    arr = [10, 20, 30, 40, 50, 60, 70]
    target = 40
    
    # Búsqueda lineal
    print(f"\nBuscando {target} en {arr}")
    for i, num in enumerate(arr):
        if num == target:
            print(f"✅ Encontrado en índice {i}")
            break
    else:
        print("❌ No encontrado")
    
    # Búsqueda binaria (array debe estar ordenado)
    arr_ordenado = sorted([64, 34, 25, 12, 22, 11, 90])
    target2 = 34
    print(f"\nBúsqueda binaria de {target2} en {arr_ordenado}")
    
    low, high = 0, len(arr_ordenado) - 1
    while low <= high:
        mid = (low + high) // 2
        if arr_ordenado[mid] == target2:
            print(f"✅ Encontrado en índice {mid}")
            break
        elif arr_ordenado[mid] < target2:
            low = mid + 1
        else:
            high = mid - 1


def operaciones_comunes():
    """Operaciones comunes y útiles con arrays."""
    print("\n" + "=" * 60)
    print("OPERACIONES COMUNES Y ÚTILES")
    print("=" * 60)
    
    # Ordenar
    arr = [64, 34, 25, 12, 22, 11, 90]
    print(f"\n1. Array original: {arr}")
    arr_ordenado = sorted(arr)  # No modifica el original
    print(f"   Ordenado (nuevo): {arr_ordenado}")
    arr.sort()  # Modifica el original
    print(f"   Después de arr.sort(): {arr}")
    
    # Revertir
    arr2 = [1, 2, 3, 4, 5]
    print(f"\n2. Array original: {arr2}")
    arr2.reverse()
    print(f"   Después de reverse(): {arr2}")
    
    # Suma, máximo, mínimo
    arr3 = [10, 20, 30, 40, 50]
    print(f"\n3. Array: {arr3}")
    print(f"   Suma: {sum(arr3)}")
    print(f"   Máximo: {max(arr3)}")
    print(f"   Mínimo: {min(arr3)}")
    
    # Crear array con range
    arr4 = list(range(10))
    print(f"\n4. Array con range(10): {arr4}")
    
    # List comprehension (crear arrays de forma elegante)
    cuadrados = [x**2 for x in range(10)]
    print(f"\n5. Cuadrados de 0-9: {cuadrados}")
    
    pares = [x for x in range(20) if x % 2 == 0]
    print(f"   Números pares 0-19: {pares}")


# 🎯 EJECUTAR TODOS LOS EJEMPLOS

if __name__ == "__main__":
    operaciones_array_basicas()
    recorrer_arrays()
    arrays_multidimensionales()
    slicing_arrays()
    buscar_en_arrays()
    operaciones_comunes()
    
    # 💡 RESUMEN
    print("\n" + "=" * 60)
    print("💡 CARACTERÍSTICAS DE ARRAYS")
    print("=" * 60)
    print("""
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
    """)
    
    print("\n" + "=" * 60)
    print("🏋️  EJERCICIOS")
    print("=" * 60)
    print("""
1. Crea una función que encuentre el segundo elemento más grande en un array

2. Escribe una función que invierta un array sin usar métodos built-in

3. Crea una función que elimine duplicados de un array manteniendo el orden

4. Implementa una función que rote un array k posiciones hacia la derecha
   Ejemplo: [1,2,3,4,5] rotado 2 → [4,5,1,2,3]

5. Escribe una función que encuentre la suma máxima de elementos contiguos
   Ejemplo: [-2, 1, -3, 4, -1, 2, 1, -5, 4] → suma máxima es 6

💡 Practica manipulando arrays, es fundamental para programar!
    """)

