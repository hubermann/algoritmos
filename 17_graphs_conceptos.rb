# Graphs (Grafos) - Conceptos Fundamentales
#
# Un grafo es una estructura de datos que representa relaciones
# entre objetos. Consiste en:
# - Vértices/Nodos: los objetos
# - Aristas/Edges: las conexiones entre ellos
#
# Ejemplos del mundo real:
# - Redes sociales (personas conectadas)
# - Mapas (ciudades conectadas por carreteras)
# - Internet (páginas web con enlaces)

# Representación de grafo usando hash (lista de adyacencia)
class Graph
  # Grafo no dirigido usando lista de adyacencia.
  attr_accessor :adj_list
  
  def initialize
    @adj_list = {}  # Hash: {vértice: [vecinos]}
  end
  
  def agregar_vertice(vertice)
    # Agrega un vértice al grafo.
    @adj_list[vertice] ||= []
  end
  
  def agregar_arista(v1, v2)
    # Agrega una arista entre v1 y v2 (no dirigida).
    agregar_vertice(v1)
    agregar_vertice(v2)
    
    @adj_list[v1] << v2
    @adj_list[v2] << v1  # No dirigido
  end
  
  def mostrar
    # Muestra el grafo.
    @adj_list.each do |vertice, vecinos|
      puts "#{vertice}: #{vecinos}"
    end
  end
end

# 🎯 EJEMPLO

puts "=" * 60
puts "EJEMPLO: Grafo No Dirigido"
puts "=" * 60

grafo = Graph.new
grafo.agregar_arista(0, 1)
grafo.agregar_arista(0, 2)
grafo.agregar_arista(1, 2)
grafo.agregar_arista(2, 3)
grafo.agregar_arista(3, 4)

puts "\nGrafo (lista de adyacencia):"
grafo.mostrar

# Visualización:
#     0
#    / \
#   1---2
#       |
#       3---4

puts "\n" + "=" * 60
puts "💡 CONCEPTOS DE GRAFOS"
puts "=" * 60
puts """
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
"""

