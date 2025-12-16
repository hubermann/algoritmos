# Trees (Árboles) - Conceptos Fundamentales
#
# Un árbol es una estructura de datos jerárquica donde cada elemento
# tiene un padre (excepto la raíz) y cero o más hijos.
#
# Es como un árbol genealógico o la estructura de carpetas:
# - Raíz: el nodo superior (no tiene padre)
# - Nodos internos: tienen padre e hijos
# - Hojas: nodos sin hijos
# - Altura: distancia desde la raíz hasta el nodo más profundo

class TreeNode
  # Nodo básico de un árbol.
  attr_accessor :valor, :hijos
  
  def initialize(valor)
    @valor = valor
    @hijos = []  # Lista de nodos hijos
  end
  
  def agregar_hijo(nodo)
    # Agrega un hijo al nodo.
    @hijos << nodo
  end
  
  def mostrar(nivel = 0)
    # Muestra el árbol de forma jerárquica.
    indent = "  " * nivel
    puts "#{indent}#{@valor}"
    @hijos.each { |hijo| hijo.mostrar(nivel + 1) }
  end
end

# 🎯 EJEMPLO: ÁRBOL GENERAL

puts "=" * 60
puts "EJEMPLO 1: Árbol General (con múltiples hijos)"
puts "=" * 60

# Crear árbol:
#       A
#     / | \
#    B  C  D
#   /|\    |
#  E F G   H

raiz = TreeNode.new("A")
nodo_b = TreeNode.new("B")
nodo_c = TreeNode.new("C")
nodo_d = TreeNode.new("D")
nodo_e = TreeNode.new("E")
nodo_f = TreeNode.new("F")
nodo_g = TreeNode.new("G")
nodo_h = TreeNode.new("H")

raiz.agregar_hijo(nodo_b)
raiz.agregar_hijo(nodo_c)
raiz.agregar_hijo(nodo_d)

nodo_b.agregar_hijo(nodo_e)
nodo_b.agregar_hijo(nodo_f)
nodo_b.agregar_hijo(nodo_g)

nodo_d.agregar_hijo(nodo_h)

puts "\nÁrbol:"
raiz.mostrar

# 🎯 CONCEPTOS BÁSICOS

def altura_arbol(nodo)
  # Calcula la altura de un árbol.
  return 0 if nodo.hijos.empty?
  
  alturas_hijos = nodo.hijos.map { |hijo| altura_arbol(hijo) }
  1 + alturas_hijos.max
end

def contar_nodos(nodo)
  # Cuenta todos los nodos del árbol.
  return 0 if nodo.nil?
  
  contador = 1
  nodo.hijos.each { |hijo| contador += contar_nodos(hijo) }
  contador
end

def contar_hojas(nodo)
  # Cuenta los nodos hoja (sin hijos).
  return 1 if nodo.hijos.empty?
  
  total = 0
  nodo.hijos.each { |hijo| total += contar_hojas(hijo) }
  total
end

def buscar_nodo(nodo, valor)
  # Busca un nodo con un valor específico.
  return nodo if nodo.valor == valor
  
  nodo.hijos.each do |hijo|
    resultado = buscar_nodo(hijo, valor)
    return resultado if resultado
  end
  
  nil
end

puts "\n" + "=" * 60
puts "OPERACIONES BÁSICAS EN ÁRBOLES"
puts "=" * 60
puts "Altura del árbol: #{altura_arbol(raiz)}"
puts "Total de nodos: #{contar_nodos(raiz)}"
puts "Número de hojas: #{contar_hojas(raiz)}"
puts "Buscando 'F': #{!buscar_nodo(raiz, 'F').nil?}"
puts "Buscando 'Z': #{!buscar_nodo(raiz, 'Z').nil?}"

# 🎯 TIPOS DE ÁRBOLES

puts "\n" + "=" * 60
puts "TIPOS DE ÁRBOLES"
puts "=" * 60
puts """
1. ÁRBOL BINARIO:
   - Cada nodo tiene máximo 2 hijos (izquierdo y derecho)

2. ÁRBOL DE BÚSQUEDA BINARIA (BST):
   - Árbol binario ordenado
   - Hijo izquierdo < padre < hijo derecho

3. ÁRBOL BINARIO COMPLETO:
   - Todos los niveles están completamente llenos

4. ÁRBOL BINARIO PERFECTO:
   - Todos los nodos internos tienen 2 hijos
   - Todas las hojas están al mismo nivel

5. ÁRBOL EQUILIBRADO:
   - La diferencia de altura entre subárboles es ≤ 1
   - Ejemplo: AVL Tree, Red-Black Tree

💡 Los árboles son fundamentales para muchas estructuras de datos!
"""

