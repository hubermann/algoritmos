"""
Quick Sort (Ordenamiento Rápido)

Uno de los algoritmos de ordenamiento más eficientes!
Usa la estrategia "Divide y Vencerás":
1. Elige un "pivote"
2. Divide el array en dos partes: menores y mayores que el pivote
3. Repite recursivamente con cada parte

Es como organizar una lista: eliges un punto medio y separas todo a los lados.
"""


def quick_sort(array, mostrar_pasos=False):
    """
    Ordena un array usando el algoritmo Quick Sort.
    
    Args:
        array: Lista de números a ordenar
        mostrar_pasos: Si True, muestra el proceso (puede ser verbose)
    
    Returns:
        El array ordenado
    """
    if len(array) <= 1:
        return array
    
    # Elegimos el pivote (puede ser el primer, último, o del medio)
    # Usamos el del medio para mejor rendimiento promedio
    pivot = array[len(array) // 2]
    
    if mostrar_pasos:
        print(f"Pivote elegido: {pivot}")
        print(f"Array: {array}")
    
    # Dividimos en tres partes
    menores = [x for x in array if x < pivot]
    iguales = [x for x in array if x == pivot]
    mayores = [x for x in array if x > pivot]
    
    if mostrar_pasos:
        print(f"  Menores que {pivot}: {menores}")
        print(f"  Iguales a {pivot}: {iguales}")
        print(f"  Mayores que {pivot}: {mayores}\n")
    
    # Ordenamos recursivamente las partes menores y mayores
    # Y combinamos: menores + iguales + mayores
    return quick_sort(menores, mostrar_pasos) + iguales + quick_sort(mayores, mostrar_pasos)


def quick_sort_inplace(array, low=0, high=None, mostrar_pasos=False):
    """
    Versión in-place de Quick Sort (más eficiente en memoria).
    Modifica el array original en lugar de crear nuevos.
    
    Args:
        array: Lista a ordenar (se modifica in-place)
        low: Índice inicial
        high: Índice final
        mostrar_pasos: Si True, muestra el proceso
    """
    if high is None:
        high = len(array) - 1
    
    if low < high:
        # Particionamos y obtenemos la posición del pivote
        pivot_idx = partition(array, low, high, mostrar_pasos)
        
        # Ordenamos recursivamente las dos partes
        quick_sort_inplace(array, low, pivot_idx - 1, mostrar_pasos)
        quick_sort_inplace(array, pivot_idx + 1, high, mostrar_pasos)


def partition(array, low, high, mostrar_pasos=False):
    """
    Particiona el array usando el último elemento como pivote.
    Coloca el pivote en su posición correcta y coloca todos los
    elementos menores a la izquierda y mayores a la derecha.
    
    Returns:
        La posición final del pivote
    """
    pivot = array[high]  # Elegimos el último elemento como pivote
    i = low - 1  # Índice del elemento más pequeño
    
    if mostrar_pasos:
        print(f"\nParticionando desde {low} hasta {high}")
        print(f"Pivote: {pivot}")
        print(f"Array: {array[low:high+1]}")
    
    for j in range(low, high):
        if array[j] <= pivot:
            i += 1
            array[i], array[j] = array[j], array[i]
            if mostrar_pasos:
                print(f"  Intercambiando {array[i]} y {array[j]}")
    
    # Colocamos el pivote en su posición correcta
    array[i + 1], array[high] = array[high], array[i + 1]
    
    if mostrar_pasos:
        print(f"Pivote {pivot} colocado en posición {i + 1}")
        print(f"Resultado: {array[low:high+1]}\n")
    
    return i + 1


# 🎯 EJEMPLOS DE USO

print("=" * 60)
print("EJEMPLO 1: Quick Sort (versión simple)")
print("=" * 60)
array1 = [64, 34, 25, 12, 22, 11, 90]
print(f"Original: {array1}")
ordenado1 = quick_sort(array1, mostrar_pasos=True)
print(f"✅ Resultado final: {ordenado1}")

print("\n" + "=" * 60)
print("EJEMPLO 2: Quick Sort in-place (más eficiente)")
print("=" * 60)
array2 = [5, 2, 8, 1, 9, 3, 7]
print(f"Antes:  {array2}")
quick_sort_inplace(array2, mostrar_pasos=False)
print(f"Después: {array2}")

print("\n" + "=" * 60)
print("EJEMPLO 3: Comparación de velocidad")
print("=" * 60)
import time

array_grande = [64, 34, 25, 12, 22, 11, 90, 5, 77, 88, 99, 1, 2, 3, 4, 55, 66, 44, 33, 22]

# Quick Sort
start = time.time()
resultado_quick = quick_sort(array_grande.copy())
tiempo_quick = time.time() - start

# Bubble Sort (para comparar) - versión simple
def bubble_sort_simple(arr):
    arr = arr.copy()
    n = len(arr)
    for i in range(n - 1):
        for j in range(n - 1 - i):
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]
    return arr

start = time.time()
resultado_bubble = bubble_sort_simple(array_grande.copy())
tiempo_bubble = time.time() - start

print(f"Array de {len(array_grande)} elementos:")
print(f"Quick Sort:  {tiempo_quick:.6f} segundos")
print(f"Bubble Sort: {tiempo_bubble:.6f} segundos")
print(f"Quick Sort es {tiempo_bubble/tiempo_quick:.1f}x más rápido! 🚀")

# 💡 CARACTERÍSTICAS IMPORTANTES

print("\n" + "=" * 60)
print("💡 CARACTERÍSTICAS DE QUICK SORT")
print("=" * 60)
print("""
✅ VENTAJAS:
   - MUY rápido en promedio (uno de los más rápidos)
   - Eficiente en memoria (versión in-place)
   - Ampliamente usado en la práctica
   - Divide y vencerás es un patrón útil

❌ DESVENTAJAS:
   - Peor caso puede ser lento O(n²) si el pivote es malo
   - No es estable (puede cambiar orden de elementos iguales)
   - Más complejo que algoritmos básicos

📊 COMPLEJIDAD:
   - Tiempo promedio: O(n log n) - MUY rápido ✨
   - Tiempo mejor caso: O(n log n)
   - Tiempo peor caso: O(n²) - raro, pero puede pasar
   - Espacio: O(log n) - para la recursión

🎯 CUÁNDO USARLO:
   - Arrays grandes (es el más usado en producción)
   - Cuando la velocidad es importante
   - Cuando no necesitas estabilidad
   
💡 NOTA: Python usa Timsort (una variante de Merge Sort + Insertion Sort)
   pero Quick Sort es excelente para entender Divide y Vencerás
""")

# 🏋️ EJERCICIOS PARA PRACTICAR

print("\n" + "=" * 60)
print("🏋️  EJERCICIOS")
print("=" * 60)
print("""
1. Modifica quick_sort para elegir el pivote de diferentes formas:
   - Primer elemento
   - Último elemento
   - Elemento aleatorio
   Compara el rendimiento

2. Crea una función que cuente cuántas comparaciones hace quick_sort

3. Compara quick_sort con los otros algoritmos de ordenamiento
   en arrays de diferentes tamaños

4. Implementa una versión que ordene de MAYOR a MENOR

💡 Quick Sort es el algoritmo de ordenamiento más usado en la práctica!
""")

