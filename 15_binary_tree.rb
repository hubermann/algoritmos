# Binary Tree (Árbol Binario)
#
# Un árbol binario es un árbol donde cada nodo tiene máximo 2 hijos:
# - Hijo izquierdo
# - Hijo derecho
#
# Es la base para muchos algoritmos y estructuras de datos avanzadas.

class BinaryTreeNode
  # Nodo de un árbol binario.
  attr_accessor :valor, :izquierda, :derecha
  
  def initialize(valor)
    @valor = valor
    @izquierda = nil  # Hijo izquierdo
    @derecha = nil    # Hijo derecho
  end
end

class BinaryTree
  # Árbol binario básico.
  attr_accessor :raiz
  
  def initialize(valor_raiz = nil)
    if valor_raiz
      @raiz = BinaryTreeNode.new(valor_raiz)
    else
      @raiz = nil
    end
  end
  
  def insertar(valor)
    # Inserta un valor en el árbol (inserción simple, no BST).
    if @raiz.nil?
      @raiz = BinaryTreeNode.new(valor)
    else
      _insertar_recursivo(@raiz, valor)
    end
  end
  
  def _insertar_recursivo(nodo, valor)
    # Inserción recursiva (busca primer espacio disponible).
    if nodo.izquierda.nil?
      nodo.izquierda = BinaryTreeNode.new(valor)
    elsif nodo.derecha.nil?
      nodo.derecha = BinaryTreeNode.new(valor)
    else
      # Si ambos hijos existen, inserta en el izquierdo
      _insertar_recursivo(nodo.izquierda, valor)
    end
  end
end

# 🎯 RECORRIDOS (TRAVERSAL)

def preorder(nodo, resultado = [])
  # Recorrido Preorder: Raíz -> Izquierda -> Derecha
  if nodo
    resultado << nodo.valor  # Visitar raíz
    preorder(nodo.izquierda, resultado)  # Izquierda
    preorder(nodo.derecha, resultado)    # Derecha
  end
  resultado
end

def inorder(nodo, resultado = [])
  # Recorrido Inorder: Izquierda -> Raíz -> Derecha
  # En un BST, esto da los valores en orden.
  if nodo
    inorder(nodo.izquierda, resultado)   # Izquierda
    resultado << nodo.valor              # Visitar raíz
    inorder(nodo.derecha, resultado)     # Derecha
  end
  resultado
end

def postorder(nodo, resultado = [])
  # Recorrido Postorder: Izquierda -> Derecha -> Raíz
  if nodo
    postorder(nodo.izquierda, resultado)  # Izquierda
    postorder(nodo.derecha, resultado)    # Derecha
    resultado << nodo.valor                # Visitar raíz
  end
  resultado
end

def level_order(nodo)
  # Recorrido por niveles (BFS).
  # Nivel por nivel, de izquierda a derecha.
  return [] unless nodo
  
  cola = [nodo]
  resultado = []
  
  while !cola.empty?
    actual = cola.shift
    resultado << actual.valor
    
    cola << actual.izquierda if actual.izquierda
    cola << actual.derecha if actual.derecha
  end
  
  resultado
end

# 🎯 OPERACIONES BÁSICAS

def altura(nodo)
  # Calcula la altura de un árbol binario.
  return -1 unless nodo
  
  altura_izq = altura(nodo.izquierda)
  altura_der = altura(nodo.derecha)
  
  1 + [altura_izq, altura_der].max
end

def contar_nodos(nodo)
  # Cuenta todos los nodos del árbol.
  return 0 unless nodo
  
  1 + contar_nodos(nodo.izquierda) + contar_nodos(nodo.derecha)
end

def buscar(nodo, valor)
  # Busca un valor en el árbol.
  return false unless nodo
  
  return true if nodo.valor == valor
  
  buscar(nodo.izquierda, valor) || buscar(nodo.derecha, valor)
end

# 🎯 EJEMPLOS

puts "=" * 60
puts "EJEMPLO: Árbol Binario"
puts "=" * 60

# Crear árbol:
#       1
#      / \
#     2   3
#    / \
#   4   5

raiz = BinaryTreeNode.new(1)
raiz.izquierda = BinaryTreeNode.new(2)
raiz.derecha = BinaryTreeNode.new(3)
raiz.izquierda.izquierda = BinaryTreeNode.new(4)
raiz.izquierda.derecha = BinaryTreeNode.new(5)

puts "\nPreorder: #{preorder(raiz)}"
puts "Inorder: #{inorder(raiz)}"
puts "Postorder: #{postorder(raiz)}"
puts "Level order: #{level_order(raiz)}"
puts "Altura: #{altura(raiz)}"
puts "Total nodos: #{contar_nodos(raiz)}"
puts "¿Existe 4?: #{buscar(raiz, 4)}"
puts "¿Existe 99?: #{buscar(raiz, 99)}"

puts "\n" + "=" * 60
puts "💡 ÁRBOL BINARIO"
puts "=" * 60
puts """
📊 RECORRIDOS:
   - Preorder: Raíz → Izquierda → Derecha
   - Inorder: Izquierda → Raíz → Derecha
   - Postorder: Izquierda → Derecha → Raíz
   - Level Order: Por niveles (BFS)

✅ VENTAJAS:
   - Estructura jerárquica natural
   - Base para BST, Heap, etc.
   - Recorridos eficientes

📊 COMPLEJIDAD:
   - Altura: O(n)
   - Contar nodos: O(n)
   - Buscar: O(n)
   - Recorridos: O(n)
"""

