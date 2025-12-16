"""
Bubble Sort (Ordenamiento de Burbuja)

Imagina burbujas subiendo en un vaso de refresco:
los elementos más grandes "suben" hacia el final del array.

Es el algoritmo de ordenamiento más simple (pero no el más eficiente).
¡Perfecto para entender cómo funcionan los ordenamientos!
"""


def bubble_sort(array, mostrar_pasos=True):
    """
    Ordena un array usando el algoritmo Bubble Sort.
    
    Cómo funciona:
    1. Compara elementos adyacentes (el actual con el siguiente)
    2. Si están en el orden incorrecto, los intercambia
    3. Repite hasta que no haya más intercambios
    
    Args:
        array: Lista de números a ordenar
        mostrar_pasos: Si True, muestra el proceso paso a paso
    
    Returns:
        El array ordenado
    """
    # Copiamos el array para no modificar el original
    arr = array.copy()
    n = len(arr)
    
    if mostrar_pasos:
        print(f"🔄 Ordenando: {arr}")
        print(f"Tamaño: {n} elementos\n")
    
    # Iteramos n-1 veces (pasadas por el array)
    for i in range(n - 1):
        swapped = False  # Para optimizar: si no hay intercambios, ya está ordenado
        
        if mostrar_pasos:
            print(f"--- PASADA {i + 1} ---")
        
        # En cada pasada, comparamos elementos adyacentes
        # El -i es porque los últimos elementos ya están ordenados
        for j in range(n - 1 - i):
            if mostrar_pasos:
                print(f"  Comparando {arr[j]} y {arr[j + 1]}", end="")
            
            if arr[j] > arr[j + 1]:
                # Intercambiamos los elementos
                arr[j], arr[j + 1] = arr[j + 1], arr[j]
                swapped = True
                
                if mostrar_pasos:
                    print(f" → Intercambio: {arr}")
            else:
                if mostrar_pasos:
                    print(f" → OK, sin cambios")
        
        if mostrar_pasos:
            print(f"  Resultado después de pasada {i + 1}: {arr}\n")
        
        # Optimización: si no hubo intercambios, ya está ordenado
        if not swapped:
            if mostrar_pasos:
                print("✨ ¡Ya está ordenado! Deteniendo antes de tiempo.\n")
            break
    
    return arr


def bubble_sort_sin_prints(array):
    """Versión limpia sin prints (para usar en otros algoritmos)."""
    arr = array.copy()
    n = len(arr)
    
    for i in range(n - 1):
        swapped = False
        for j in range(n - 1 - i):
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]
                swapped = True
        if not swapped:
            break
    
    return arr


# 🎯 EJEMPLOS DE USO

print("=" * 60)
print("EJEMPLO 1: Ordenar array pequeño paso a paso")
print("=" * 60)
array1 = [64, 34, 25, 12, 22, 11, 90]
print(f"Original: {array1}\n")
ordenado1 = bubble_sort(array1, mostrar_pasos=True)
print(f"✅ Resultado final: {ordenado1}")

print("\n" + "=" * 60)
print("EJEMPLO 2: Comparar antes y después")
print("=" * 60)
array2 = [5, 2, 8, 1, 9, 3]
print(f"Antes:  {array2}")
ordenado2 = bubble_sort(array2, mostrar_pasos=False)
print(f"Después: {ordenado2}")

print("\n" + "=" * 60)
print("EJEMPLO 3: Array que ya está ordenado (caso óptimo)")
print("=" * 60)
array3 = [1, 2, 3, 4, 5]
ordenado3 = bubble_sort(array3, mostrar_pasos=True)

print("\n" + "=" * 60)
print("EJEMPLO 4: Array ordenado al revés (caso peor)")
print("=" * 60)
array4 = [5, 4, 3, 2, 1]
ordenado4 = bubble_sort(array4, mostrar_pasos=True)

# 💡 CARACTERÍSTICAS IMPORTANTES

print("\n" + "=" * 60)
print("💡 CARACTERÍSTICAS DE BUBBLE SORT")
print("=" * 60)
print("""
✅ VENTAJAS:
   - Súper fácil de entender
   - Fácil de implementar
   - No necesita memoria extra (ordenamiento in-place)
   - Estable (mantiene el orden relativo de elementos iguales)

❌ DESVENTAJAS:
   - MUY lento con arrays grandes
   - Hace muchas comparaciones innecesarias

📊 COMPLEJIDAD:
   - Tiempo promedio: O(n²) - "O de n al cuadrado"
   - Tiempo mejor caso: O(n) - cuando ya está ordenado (con optimización)
   - Tiempo peor caso: O(n²) - cuando está ordenado al revés
   - Espacio: O(1) - solo usa memoria constante

🎯 CUÁNDO USARLO:
   - Para aprender conceptos básicos
   - Arrays muy pequeños (< 10 elementos)
   - Cuando la simplicidad es más importante que la velocidad
   
⚠️  EN PRODUCCIÓN: Usa algoritmos más eficientes como Quick Sort o Merge Sort
""")

# 🏋️ EJERCICIOS PARA PRACTICAR

print("\n" + "=" * 60)
print("🏋️  EJERCICIOS")
print("=" * 60)
print("""
1. Modifica bubble_sort para ordenar de MAYOR a MENOR (descendente)

2. Crea una función que cuente cuántos intercambios hace bubble_sort

3. Compara el tiempo que tarda bubble_sort con arrays de diferentes tamaños
   Tip: usa import time y time.time()

4. Ordena un array de strings alfabéticamente usando bubble_sort
   Ejemplo: ["banana", "apple", "cherry"]

💡 Experimenta cambiando el código y viendo qué pasa
""")


