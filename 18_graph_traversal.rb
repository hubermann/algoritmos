# Graph Traversal - BFS y DFS
#
# Recorrer un grafo significa visitar todos sus vértices.
# Los dos métodos principales son:
# - BFS (Breadth First Search): por niveles, usa cola
# - DFS (Depth First Search): en profundidad, usa pila/recursión

class Graph
  # Grafo para demostrar BFS y DFS.
  attr_accessor :adj_list
  
  def initialize
    @adj_list = {}
  end
  
  def agregar_arista(v1, v2)
    @adj_list[v1] ||= []
    @adj_list[v2] ||= []
    @adj_list[v1] << v2
    @adj_list[v2] << v1
  end
end

def BFS(grafo, inicio)
  # Breadth First Search - Recorrido por niveles.
  # Usa una cola para visitar vértices nivel por nivel.
  visitados = Set.new
  cola = [inicio]
  visitados.add(inicio)
  resultado = []
  
  while !cola.empty?
    vertice = cola.shift  # Dequeue
    resultado << vertice
    
    (grafo.adj_list[vertice] || []).each do |vecino|
      unless visitados.include?(vecino)
        visitados.add(vecino)
        cola << vecino  # Enqueue
      end
    end
  end
  
  resultado
end

def DFS_recursivo(grafo, inicio, visitados = nil, resultado = nil)
  # Depth First Search - Recursivo.
  # Visita tan profundo como puede antes de retroceder.
  visitados ||= Set.new
  resultado ||= []
  
  visitados.add(inicio)
  resultado << inicio
  
  (grafo.adj_list[inicio] || []).each do |vecino|
    unless visitados.include?(vecino)
      DFS_recursivo(grafo, vecino, visitados, resultado)
    end
  end
  
  resultado
end

def DFS_iterativo(grafo, inicio)
  # DFS usando una pila (iterativo).
  visitados = Set.new
  pila = [inicio]
  resultado = []
  
  while !pila.empty?
    vertice = pila.pop  # Pop
    
    unless visitados.include?(vertice)
      visitados.add(vertice)
      resultado << vertice
      
      # Agregar vecinos a la pila (al revés para mantener orden)
      (grafo.adj_list[vertice] || []).reverse.each do |vecino|
        pila << vecino unless visitados.include?(vecino)
      end
    end
  end
  
  resultado
end

# 🎯 EJEMPLOS

puts "=" * 60
puts "EJEMPLO: BFS vs DFS"
puts "=" * 60

g = Graph.new
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

puts "\nGrafo:"
puts "     0"
puts "    / \\"
puts "   1   2"
puts "  / \\   \\"
puts " 3   4   5"

require 'set'
puts "\nBFS desde 0: #{BFS(g, 0)}"
puts "DFS recursivo desde 0: #{DFS_recursivo(g, 0)}"
puts "DFS iterativo desde 0: #{DFS_iterativo(g, 0)}"

puts "\n" + "=" * 60
puts "💡 BFS vs DFS"
puts "=" * 60
puts """
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
"""

