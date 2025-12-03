"""
Merge Sort (Ordenamiento por Combinación)

Otro algoritmo "Divide y Vencerás" muy eficiente.
Es más predecible que Quick Sort porque siempre es O(n log n).

Cómo funciona:
1. Divide el array por la mitad
2. Ordena cada mitad recursivamente
3. Combina las dos mitades ordenadas
"""


def merge_sort(array, mostrar_pasos=False):
    """
    Ordena un array usando Merge Sort.
    
    Args:
        array: Lista de números a ordenar
        mostrar_pasos: Si True, muestra el proceso
    
    Returns:
        El array ordenado
    """
    # Caso base: array con 0 o 1 elemento ya está ordenado
    if len(array) <= 1:
        return array
    
    if mostrar_pasos:
        print(f"Dividiendo: {array}")
    
    # PASO 1: Dividir el array por la mitad
    medio = len(array) // 2
    izquierda = array[:medio]  # Primera mitad
    derecha = array[medio:]    # Segunda mitad
    
    if mostrar_pasos:
        print(f"  Izquierda: {izquierda}")
        print(f"  Derecha: {derecha}\n")
    
    # PASO 2: Ordenar recursivamente cada mitad
    izquierda_ordenada = merge_sort(izquierda, mostrar_pasos)
    derecha_ordenada = merge_sort(derecha, mostrar_pasos)
    
    # PASO 3: Combinar las dos mitades ordenadas
    resultado = merge(izquierda_ordenada, derecha_ordenada, mostrar_pasos)
    
    if mostrar_pasos:
        print(f"Combinando {izquierda_ordenada} y {derecha_ordenada}")
        print(f"Resultado: {resultado}\n")
    
    return resultado


def merge(izquierda, derecha, mostrar_pasos=False):
    """
    Combina dos arrays ordenados en uno solo ordenado.
    
    Es como tener dos mazos de cartas ordenados y combinarlos.
    """
    resultado = []
    i = 0  # Índice para el array izquierdo
    j = 0  # Índice para el array derecho
    
    if mostrar_pasos:
        print(f"    Mezclando: {izquierda} y {derecha}")
    
    # Mientras haya elementos en ambos arrays
    while i < len(izquierda) and j < len(derecha):
        if izquierda[i] <= derecha[j]:
            resultado.append(izquierda[i])
            i += 1
        else:
            resultado.append(derecha[j])
            j += 1
    
    # Agregar los elementos restantes (si los hay)
    resultado.extend(izquierda[i:])
    resultado.extend(derecha[j:])
    
    if mostrar_pasos:
        print(f"    Resultado de mezcla: {resultado}")
    
    return resultado


# 🎯 EJEMPLOS DE USO

print("=" * 60)
print("EJEMPLO 1: Merge Sort paso a paso")
print("=" * 60)
array1 = [38, 27, 43, 3, 9, 82, 10]
print(f"Original: {array1}\n")
ordenado1 = merge_sort(array1, mostrar_pasos=True)
print(f"✅ Resultado final: {ordenado1}")

print("\n" + "=" * 60)
print("EJEMPLO 2: Comparación con otros algoritmos")
print("=" * 60)
array2 = [64, 34, 25, 12, 22, 11, 90]
print(f"Original: {array2}")
ordenado2 = merge_sort(array2, mostrar_pasos=False)
print(f"Ordenado: {ordenado2}")

print("\n" + "=" * 60)
print("EJEMPLO 3: Array grande")
print("=" * 60)
import time

array_grande = [64, 34, 25, 12, 22, 11, 90, 5, 77, 88, 99, 1, 2, 3, 4, 55, 66, 44, 33, 22]

start = time.time()
resultado_merge = merge_sort(array_grande.copy(), mostrar_pasos=False)
tiempo_merge = time.time() - start

# Comparar con Quick Sort
from 06_ordenamiento_quick_sort import quick_sort
start = time.time()
resultado_quick = quick_sort(array_grande.copy(), mostrar_pasos=False)
tiempo_quick = time.time() - start

print(f"Array de {len(array_grande)} elementos:")
print(f"Merge Sort:  {tiempo_merge:.6f} segundos")
print(f"Quick Sort:  {tiempo_quick:.6f} segundos")

# 💡 CARACTERÍSTICAS IMPORTANTES

print("\n" + "=" * 60)
print("💡 CARACTERÍSTICAS DE MERGE SORT")
print("=" * 60)
print("""
✅ VENTAJAS:
   - SIEMPRE O(n log n) - muy predecible
   - Estable (mantiene orden de elementos iguales)
   - Excelente para ordenar listas enlazadas
   - Se puede paralelizar fácilmente

❌ DESVENTAJAS:
   - Necesita memoria extra O(n) para combinar
   - No es in-place (necesita crear nuevos arrays)
   - Más lento en la práctica que Quick Sort en arrays

📊 COMPLEJIDAD:
   - Tiempo mejor caso: O(n log n)
   - Tiempo promedio: O(n log n)
   - Tiempo peor caso: O(n log n) - SIEMPRE el mismo! ✨
   - Espacio: O(n) - necesita memoria extra

🎯 CUÁNDO USARLO:
   - Cuando necesitas garantía de O(n log n)
   - Cuando necesitas estabilidad
   - Para ordenar listas enlazadas
   - Cuando tienes memoria suficiente

💡 COMPARACIÓN CON QUICK SORT:
   - Merge Sort: predecible pero usa más memoria
   - Quick Sort: más rápido en promedio pero puede ser O(n²)
   - Ambos son excelentes algoritmos!
""")

# 🏋️ EJERCICIOS PARA PRACTICAR

print("\n" + "=" * 60)
print("🏋️  EJERCICIOS")
print("=" * 60)
print("""
1. Modifica merge_sort para contar cuántas comparaciones hace

2. Crea una versión que ordene de MAYOR a MENOR

3. Compara el uso de memoria de Merge Sort vs Quick Sort
   (Merge Sort usa más memoria, ¿puedes explicar por qué?)

4. Implementa una versión que muestre visualmente cómo se dividen
   los arrays en cada paso

💡 Merge Sort es el algoritmo que usa Python para ordenar listas grandes!
""")

