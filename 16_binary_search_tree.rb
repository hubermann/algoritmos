# Binary Search Tree (BST) - Árbol de Búsqueda Binaria
#
# Un BST es un árbol binario ordenado donde:
# - Todos los valores en el subárbol izquierdo < nodo actual
# - Todos los valores en el subárbol derecho > nodo actual
#
# Permite búsqueda, inserción y eliminación eficientes: O(log n) en promedio

class BSTNode
  # Nodo de un BST.
  attr_accessor :valor, :izquierda, :derecha
  
  def initialize(valor)
    @valor = valor
    @izquierda = nil
    @derecha = nil
  end
end

class BinarySearchTree
  # Árbol de búsqueda binaria.
  attr_accessor :raiz
  
  def initialize
    @raiz = nil
  end
  
  def insertar(valor)
    # Inserta un valor en el BST.
    @raiz = _insertar_rec(@raiz, valor)
  end
  
  def _insertar_rec(nodo, valor)
    # Inserción recursiva.
    return BSTNode.new(valor) if nodo.nil?
    
    if valor < nodo.valor
      nodo.izquierda = _insertar_rec(nodo.izquierda, valor)
    elsif valor > nodo.valor
      nodo.derecha = _insertar_rec(nodo.derecha, valor)
    end
    
    nodo
  end
  
  def buscar(valor)
    # Busca un valor en el BST. Retorna true si existe.
    _buscar_rec(@raiz, valor)
  end
  
  def _buscar_rec(nodo, valor)
    return false if nodo.nil?
    
    return true if valor == nodo.valor
    
    if valor < nodo.valor
      _buscar_rec(nodo.izquierda, valor)
    else
      _buscar_rec(nodo.derecha, valor)
    end
  end
  
  def eliminar(valor)
    # Elimina un valor del BST.
    @raiz = _eliminar_rec(@raiz, valor)
  end
  
  def _eliminar_rec(nodo, valor)
    return nodo if nodo.nil?
    
    if valor < nodo.valor
      nodo.izquierda = _eliminar_rec(nodo.izquierda, valor)
    elsif valor > nodo.valor
      nodo.derecha = _eliminar_rec(nodo.derecha, valor)
    else
      # Nodo a eliminar encontrado
      return nodo.derecha if nodo.izquierda.nil?
      return nodo.izquierda if nodo.derecha.nil?
      
      # Tiene dos hijos: encontrar el sucesor inorder (mínimo en subárbol derecho)
      nodo.valor = _min_valor(nodo.derecha)
      nodo.derecha = _eliminar_rec(nodo.derecha, nodo.valor)
    end
    
    nodo
  end
  
  def _min_valor(nodo)
    # Encuentra el valor mínimo en un subárbol.
    actual = nodo
    actual = actual.izquierda while actual.izquierda
    actual.valor
  end
  
  def inorder
    # Retorna los valores en orden (ordenados).
    resultado = []
    _inorder_rec(@raiz, resultado)
    resultado
  end
  
  def _inorder_rec(nodo, resultado)
    if nodo
      _inorder_rec(nodo.izquierda, resultado)
      resultado << nodo.valor
      _inorder_rec(nodo.derecha, resultado)
    end
  end
end

# 🎯 EJEMPLOS

puts "=" * 60
puts "EJEMPLO: Binary Search Tree"
puts "=" * 60

bst = BinarySearchTree.new
valores = [50, 30, 70, 20, 40, 60, 80]

puts "Insertando valores: #{valores}"
valores.each { |valor| bst.insertar(valor) }

puts "\nBuscando 40: #{bst.buscar(40)}"
puts "Buscando 99: #{bst.buscar(99)}"

puts "\nValores en orden (inorder): #{bst.inorder}"

puts "\nEliminando 20:"
bst.eliminar(20)
puts "Valores después de eliminar: #{bst.inorder}"

puts "\n" + "=" * 60
puts "💡 CARACTERÍSTICAS DEL BST"
puts "=" * 60
puts """
✅ VENTAJAS:
   - Búsqueda eficiente: O(log n) promedio
   - Inserción y eliminación eficientes
   - Mantiene datos ordenados automáticamente
   - Inorder traversal da valores ordenados

❌ DESVENTAJAS:
   - Puede degenerar en lista O(n) si no está balanceado
   - No hay garantía de balance

📊 COMPLEJIDAD:
   - Buscar/Insertar/Eliminar: O(log n) promedio, O(n) peor caso
   - Inorder traversal: O(n)

💡 Para árboles balanceados: usar AVL Tree o Red-Black Tree
"""

