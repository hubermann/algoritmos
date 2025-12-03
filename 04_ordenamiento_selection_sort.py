"""
Selection Sort (Ordenamiento por Selección)

La idea es simple:
1. Busca el elemento más pequeño
2. Lo pone al principio
3. Repite con el resto del array

Es como ordenar cartas en tu mano: eliges la más pequeña
y la pones en su lugar.
"""


def selection_sort(array, mostrar_pasos=True):
    """
    Ordena un array usando el algoritmo Selection Sort.
    
    Cómo funciona:
    1. Encuentra el elemento mínimo en el array
    2. Lo intercambia con el primer elemento no ordenado
    3. Repite para el resto del array
    
    Args:
        array: Lista de números a ordenar
        mostrar_pasos: Si True, muestra el proceso paso a paso
    
    Returns:
        El array ordenado
    """
    arr = array.copy()
    n = len(arr)
    
    if mostrar_pasos:
        print(f"🔄 Ordenando: {arr}")
        print(f"Tamaño: {n} elementos\n")
    
    # Iteramos por cada posición del array
    for i in range(n):
        # Buscamos el índice del elemento más pequeño en la parte no ordenada
        min_idx = i  # Asumimos que el actual es el mínimo
        
        if mostrar_pasos:
            print(f"--- PASADA {i + 1} ---")
            print(f"  Buscando mínimo desde posición {i} hasta {n - 1}")
        
        # Buscamos el mínimo en la parte no ordenada (desde i hasta el final)
        for j in range(i + 1, n):
            if mostrar_pasos:
                print(f"    Comparando arr[{min_idx}]={arr[min_idx]} con arr[{j}]={arr[j]}", end="")
            
            if arr[j] < arr[min_idx]:
                min_idx = j
                if mostrar_pasos:
                    print(f" → Nuevo mínimo encontrado!")
            else:
                if mostrar_pasos:
                    print(f" → No cambia")
        
        # Intercambiamos el mínimo encontrado con la posición actual
        if min_idx != i:
            if mostrar_pasos:
                print(f"  Intercambiando arr[{i}]={arr[i]} con arr[{min_idx}]={arr[min_idx]}")
            arr[i], arr[min_idx] = arr[min_idx], arr[i]
        else:
            if mostrar_pasos:
                print(f"  arr[{i}]={arr[i]} ya está en su lugar correcto")
        
        if mostrar_pasos:
            print(f"  Estado actual: {arr}\n")
    
    return arr


def selection_sort_sin_prints(array):
    """Versión limpia sin prints (para usar en otros algoritmos)."""
    arr = array.copy()
    n = len(arr)
    
    for i in range(n):
        min_idx = i
        for j in range(i + 1, n):
            if arr[j] < arr[min_idx]:
                min_idx = j
        arr[i], arr[min_idx] = arr[min_idx], arr[i]
    
    return arr


# 🎯 EJEMPLOS DE USO

print("=" * 60)
print("EJEMPLO 1: Ordenar array pequeño paso a paso")
print("=" * 60)
array1 = [64, 25, 12, 22, 11]
print(f"Original: {array1}\n")
ordenado1 = selection_sort(array1, mostrar_pasos=True)
print(f"✅ Resultado final: {ordenado1}")

print("\n" + "=" * 60)
print("EJEMPLO 2: Comparar antes y después")
print("=" * 60)
array2 = [5, 2, 8, 1, 9, 3]
print(f"Antes:  {array2}")
ordenado2 = selection_sort(array2, mostrar_pasos=False)
print(f"Después: {ordenado2}")

print("\n" + "=" * 60)
print("EJEMPLO 3: Visualización gráfica del proceso")
print("=" * 60)
array3 = [7, 3, 5, 1, 9, 2]
print(f"Original: {array3}")
ordenado3 = selection_sort(array3, mostrar_pasos=True)

# 💡 COMPARACIÓN CON BUBBLE SORT

print("\n" + "=" * 60)
print("💡 SELECTION SORT vs BUBBLE SORT")
print("=" * 60)
print("""
SELECTION SORT:
✅ Hace MENOS intercambios que Bubble Sort
   - Solo hace un intercambio por pasada
   - Bubble Sort puede hacer muchos intercambios

❌ Siempre hace la misma cantidad de comparaciones
   - No se optimiza si el array ya está ordenado

BUBBLE SORT:
✅ Se puede optimizar si el array ya está ordenado
❌ Hace muchos intercambios innecesarios

📊 AMBOS tienen complejidad O(n²) en promedio
""")

# 💡 CARACTERÍSTICAS IMPORTANTES

print("\n" + "=" * 60)
print("💡 CARACTERÍSTICAS DE SELECTION SORT")
print("=" * 60)
print("""
✅ VENTAJAS:
   - Simple de entender e implementar
   - Hace menos intercambios que Bubble Sort
   - No necesita memoria extra (in-place)
   - Rendimiento predecible (siempre similar)

❌ DESVENTAJAS:
   - Lento con arrays grandes
   - No se adapta si el array ya está ordenado
   - No es estable (puede cambiar orden de elementos iguales)

📊 COMPLEJIDAD:
   - Tiempo: O(n²) - siempre, en todos los casos
   - Espacio: O(1) - solo usa memoria constante

🎯 CUÁNDO USARLO:
   - Para aprender conceptos básicos
   - Cuando quieres minimizar el número de intercambios
   - Arrays pequeños donde la simplicidad importa más
""")

# 🏋️ EJERCICIOS PARA PRACTICAR

print("\n" + "=" * 60)
print("🏋️  EJERCICIOS")
print("=" * 60)
print("""
1. Modifica selection_sort para ordenar de MAYOR a MENOR

2. Crea una función que cuente cuántas comparaciones hace selection_sort

3. Compara cuántos intercambios hace Selection Sort vs Bubble Sort
   con el mismo array

4. Modifica el algoritmo para encontrar el MÁXIMO en lugar del mínimo
   y ordenar de mayor a menor usando esa lógica

💡 Experimenta y compara con bubble_sort
""")

