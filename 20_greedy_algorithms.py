"""
Greedy Algorithms (Algoritmos Voraces)

Un algoritmo greedy siempre hace la elección que parece mejor
en el momento (localmente óptima), esperando que lleve a una
solución globalmente óptima.

Regla: "El mejor ahora, sin pensar en el futuro"
"""


def cambio_monedas(monedas, cantidad):
    """
    Problema del cambio: encontrar el mínimo número de monedas
    para dar cambio de una cantidad.
    
    Algoritmo greedy: siempre elegir la moneda más grande posible.
    """
    monedas.sort(reverse=True)  # De mayor a menor
    resultado = []
    
    for moneda in monedas:
        while cantidad >= moneda:
            cantidad -= moneda
            resultado.append(moneda)
    
    return resultado


def actividad_selector(inicio, fin):
    """
    Problema de selección de actividades:
    Máximo número de actividades que no se solapan.
    
    Greedy: elegir la actividad que termina primero.
    """
    n = len(inicio)
    actividades = list(zip(inicio, fin, range(n)))
    actividades.sort(key=lambda x: x[1])  # Ordenar por tiempo de fin
    
    seleccionadas = [actividades[0][2]]  # Primera actividad
    ultima_fin = actividades[0][1]
    
    for i in range(1, n):
        if actividades[i][0] >= ultima_fin:
            seleccionadas.append(actividades[i][2])
            ultima_fin = actividades[i][1]
    
    return seleccionadas


def fractional_knapsack(pesos, valores, capacidad):
    """
    Problema de la mochila fraccional (puedes tomar fracciones).
    
    Greedy: elegir items con mejor ratio valor/peso primero.
    """
    n = len(pesos)
    items = [(valores[i]/pesos[i], pesos[i], valores[i], i) 
             for i in range(n)]
    items.sort(reverse=True)  # Mayor ratio primero
    
    valor_total = 0
    peso_restante = capacidad
    solucion = [0] * n
    
    for ratio, peso, valor, idx in items:
        if peso_restante >= peso:
            # Tomar todo el item
            solucion[idx] = 1.0
            valor_total += valor
            peso_restante -= peso
        else:
            # Tomar fracción
            fraccion = peso_restante / peso
            solucion[idx] = fraccion
            valor_total += valor * fraccion
            break
    
    return solucion, valor_total


# 🎯 EJEMPLOS

print("=" * 60)
print("EJEMPLO 1: Cambio de Monedas")
print("=" * 60)
monedas = [1, 5, 10, 25]
cantidad = 67
cambio = cambio_monedas(monedas, cantidad)
print(f"Monedas disponibles: {monedas}")
print(f"Cambio para ${cantidad}: {cambio}")
print(f"Total de monedas: {len(cambio)}")

print("\n" + "=" * 60)
print("EJEMPLO 2: Selección de Actividades")
print("=" * 60)
inicio = [1, 3, 0, 5, 8, 5]
fin = [2, 4, 6, 7, 9, 9]
seleccionadas = actividad_selector(inicio, fin)
print(f"Horarios: inicio={inicio}, fin={fin}")
print(f"Actividades seleccionadas (índices): {seleccionadas}")
print(f"Total de actividades: {len(seleccionadas)}")

print("\n" + "=" * 60)
print("EJEMPLO 3: Mochila Fraccional")
print("=" * 60)
pesos = [10, 20, 30]
valores = [60, 100, 120]
capacidad = 50
solucion, valor = fractional_knapsack(pesos, valores, capacidad)
print(f"Pesos: {pesos}, Valores: {valores}, Capacidad: {capacidad}")
print(f"Solución (fracciones): {solucion}")
print(f"Valor total: {valor}")


print("\n" + "=" * 60)
print("💡 GREEDY ALGORITMS")
print("=" * 60)
print("""
✅ VENTAJAS:
   - Fácil de entender e implementar
   - Eficiente (rápido)
   - Funciona bien para muchos problemas

❌ DESVENTAJAS:
   - No siempre da la solución óptima
   - Necesitas probar que funciona para cada problema
   - Puede quedar atrapado en mínimos/máximos locales

🎯 CUÁNDO FUNCIONA:
   - Problema tiene subestructura óptima
   - Propiedad de elección greedy (local óptimo = global óptimo)

📊 EJEMPLOS CLÁSICOS:
   - Minimum Spanning Tree (Kruskal, Prim)
   - Shortest Path (Dijkstra)
   - Cambio de monedas
   - Scheduling
""")

