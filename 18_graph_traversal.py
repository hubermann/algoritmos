"""
Graph Traversal - BFS y DFS

Recorrer un grafo significa visitar todos sus vértices.
Los dos métodos principales son:
- BFS (Breadth First Search): por niveles, usa cola
- DFS (Depth First Search): en profundidad, usa pila/recursión
"""


class Graph:
    """Grafo para demostrar BFS y DFS."""
    
    def __init__(self):
        self.adj_list = {}
    
    def agregar_arista(self, v1, v2):
        if v1 not in self.adj_list:
            self.adj_list[v1] = []
        if v2 not in self.adj_list:
            self.adj_list[v2] = []
        self.adj_list[v1].append(v2)
        self.adj_list[v2].append(v1)


def BFS(grafo, inicio):
    """
    Breadth First Search - Recorrido por niveles.
    Usa una cola para visitar vértices nivel por nivel.
    """
    visitados = set()
    cola = [inicio]
    visitados.add(inicio)
    resultado = []
    
    while cola:
        vertice = cola.pop(0)  # Dequeue
        resultado.append(vertice)
        
        for vecino in grafo.adj_list.get(vertice, []):
            if vecino not in visitados:
                visitados.add(vecino)
                cola.append(vecino)  # Enqueue
    
    return resultado


def DFS_recursivo(grafo, inicio, visitados=None, resultado=None):
    """
    Depth First Search - Recursivo.
    Visita tan profundo como puede antes de retroceder.
    """
    if visitados is None:
        visitados = set()
    if resultado is None:
        resultado = []
    
    visitados.add(inicio)
    resultado.append(inicio)
    
    for vecino in grafo.adj_list.get(inicio, []):
        if vecino not in visitados:
            DFS_recursivo(grafo, vecino, visitados, resultado)
    
    return resultado


def DFS_iterativo(grafo, inicio):
    """DFS usando una pila (iterativo)."""
    visitados = set()
    pila = [inicio]
    resultado = []
    
    while pila:
        vertice = pila.pop()  # Pop
        
        if vertice not in visitados:
            visitados.add(vertice)
            resultado.append(vertice)
            
            # Agregar vecinos a la pila (al revés para mantener orden)
            for vecino in reversed(grafo.adj_list.get(vertice, [])):
                if vecino not in visitados:
                    pila.append(vecino)
    
    return resultado


# 🎯 EJEMPLOS

print("=" * 60)
print("EJEMPLO: BFS vs DFS")
print("=" * 60)

g = Graph()
# Crear grafo:
#     0
#    / \
#   1   2
#  / \   \
# 3   4   5

g.agregar_arista(0, 1)
g.agregar_arista(0, 2)
g.agregar_arista(1, 3)
g.agregar_arista(1, 4)
g.agregar_arista(2, 5)

print("\nGrafo:")
print("     0")
print("    / \\")
print("   1   2")
print("  / \\   \\")
print(" 3   4   5")

print(f"\nBFS desde 0: {BFS(g, 0)}")
print(f"DFS recursivo desde 0: {DFS_recursivo(g, 0)}")
print(f"DFS iterativo desde 0: {DFS_iterativo(g, 0)}")

print("\n" + "=" * 60)
print("💡 BFS vs DFS")
print("=" * 60)
print("""
BFS (Breadth First Search):
   - Usa COLA (FIFO)
   - Visita nivel por nivel
   - Encuentra el camino más corto (sin pesos)
   - Usa más memoria
   - Complejidad: O(V + E)

DFS (Depth First Search):
   - Usa PILA o recursión (LIFO)
   - Visita tan profundo como puede
   - Más eficiente en memoria
   - Complejidad: O(V + E)

🎯 CUÁNDO USAR:
   - BFS: camino más corto, por niveles
   - DFS: explorar todo el grafo, menos memoria
""")

