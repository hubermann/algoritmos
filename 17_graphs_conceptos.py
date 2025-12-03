"""
Graphs (Grafos) - Conceptos Fundamentales

Un grafo es una estructura de datos que representa relaciones
entre objetos. Consiste en:
- Vértices/Nodos: los objetos
- Aristas/Edges: las conexiones entre ellos

Ejemplos del mundo real:
- Redes sociales (personas conectadas)
- Mapas (ciudades conectadas por carreteras)
- Internet (páginas web con enlaces)
"""


# Representación de grafo usando diccionario (lista de adyacencia)
class Graph:
    """Grafo no dirigido usando lista de adyacencia."""
    
    def __init__(self):
        self.adj_list = {}  # Diccionario: {vértice: [vecinos]}
    
    def agregar_vertice(self, vertice):
        """Agrega un vértice al grafo."""
        if vertice not in self.adj_list:
            self.adj_list[vertice] = []
    
    def agregar_arista(self, v1, v2):
        """Agrega una arista entre v1 y v2 (no dirigida)."""
        if v1 not in self.adj_list:
            self.agregar_vertice(v1)
        if v2 not in self.adj_list:
            self.agregar_vertice(v2)
        
        self.adj_list[v1].append(v2)
        self.adj_list[v2].append(v1)  # No dirigido
    
    def mostrar(self):
        """Muestra el grafo."""
        for vertice, vecinos in self.adj_list.items():
            print(f"{vertice}: {vecinos}")


# 🎯 EJEMPLO

print("=" * 60)
print("EJEMPLO: Grafo No Dirigido")
print("=" * 60)

grafo = Graph()
grafo.agregar_arista(0, 1)
grafo.agregar_arista(0, 2)
grafo.agregar_arista(1, 2)
grafo.agregar_arista(2, 3)
grafo.agregar_arista(3, 4)

print("\nGrafo (lista de adyacencia):")
grafo.mostrar()

# Visualización:
#     0
#    / \
#   1---2
#       |
#       3---4


print("\n" + "=" * 60)
print("💡 CONCEPTOS DE GRAFOS")
print("=" * 60)
print("""
📐 TIPOS DE GRAFOS:
   1. Grafo No Dirigido: las aristas no tienen dirección
   2. Grafo Dirigido (Digraph): las aristas tienen dirección
   3. Grafo Ponderado: las aristas tienen pesos/costos
   4. Grafo Ciclico: tiene ciclos
   5. Grafo Acíclico: sin ciclos (DAG: Directed Acyclic Graph)

🔗 REPRESENTACIONES:
   1. Lista de Adyacencia: {vértice: [vecinos]}
      - Eficiente en memoria para grafos dispersos
      - O(V + E) espacio
   
   2. Matriz de Adyacencia: matriz V×V
      - Rápido para verificar si existe arista
      - O(V²) espacio

📊 TERMINOLOGÍA:
   - Vértice/Nodo: elemento del grafo
   - Arista/Edge: conexión entre vértices
   - Grado: número de aristas conectadas a un vértice
   - Camino: secuencia de vértices conectados
   - Ciclo: camino que empieza y termina en el mismo vértice
   - Conexo: existe camino entre cualquier par de vértices

🎯 ALGORITMOS IMPORTANTES:
   - BFS (Breadth First Search): recorrido por niveles
   - DFS (Depth First Search): recorrido en profundidad
   - Shortest Path: Dijkstra, Bellman-Ford
   - Minimum Spanning Tree: Kruskal, Prim
   - Topological Sort: para DAGs
""")

