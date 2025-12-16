"""
Binary Search Tree (BST) - Árbol de Búsqueda Binaria

Un BST es un árbol binario ordenado donde:
- Todos los valores en el subárbol izquierdo < nodo actual
- Todos los valores en el subárbol derecho > nodo actual

Permite búsqueda, inserción y eliminación eficientes: O(log n) en promedio
"""


class BSTNode:
    """Nodo de un BST."""
    
    def __init__(self, valor):
        self.valor = valor
        self.izquierda = None
        self.derecha = None


class BinarySearchTree:
    """Árbol de búsqueda binaria."""
    
    def __init__(self):
        self.raiz = None
    
    def insertar(self, valor):
        """Inserta un valor en el BST."""
        self.raiz = self._insertar_rec(self.raiz, valor)
    
    def _insertar_rec(self, nodo, valor):
        """Inserción recursiva."""
        if nodo is None:
            return BSTNode(valor)
        
        if valor < nodo.valor:
            nodo.izquierda = self._insertar_rec(nodo.izquierda, valor)
        elif valor > nodo.valor:
            nodo.derecha = self._insertar_rec(nodo.derecha, valor)
        
        return nodo
    
    def buscar(self, valor):
        """Busca un valor en el BST. Retorna True si existe."""
        return self._buscar_rec(self.raiz, valor)
    
    def _buscar_rec(self, nodo, valor):
        if nodo is None:
            return False
        
        if valor == nodo.valor:
            return True
        elif valor < nodo.valor:
            return self._buscar_rec(nodo.izquierda, valor)
        else:
            return self._buscar_rec(nodo.derecha, valor)
    
    def eliminar(self, valor):
        """Elimina un valor del BST."""
        self.raiz = self._eliminar_rec(self.raiz, valor)
    
    def _eliminar_rec(self, nodo, valor):
        if nodo is None:
            return nodo
        
        if valor < nodo.valor:
            nodo.izquierda = self._eliminar_rec(nodo.izquierda, valor)
        elif valor > nodo.valor:
            nodo.derecha = self._eliminar_rec(nodo.derecha, valor)
        else:
            # Nodo a eliminar encontrado
            if nodo.izquierda is None:
                return nodo.derecha
            elif nodo.derecha is None:
                return nodo.izquierda
            
            # Tiene dos hijos: encontrar el sucesor inorder (mínimo en subárbol derecho)
            nodo.valor = self._min_valor(nodo.derecha)
            nodo.derecha = self._eliminar_rec(nodo.derecha, nodo.valor)
        
        return nodo
    
    def _min_valor(self, nodo):
        """Encuentra el valor mínimo en un subárbol."""
        actual = nodo
        while actual.izquierda:
            actual = actual.izquierda
        return actual.valor
    
    def inorder(self):
        """Retorna los valores en orden (ordenados)."""
        resultado = []
        self._inorder_rec(self.raiz, resultado)
        return resultado
    
    def _inorder_rec(self, nodo, resultado):
        if nodo:
            self._inorder_rec(nodo.izquierda, resultado)
            resultado.append(nodo.valor)
            self._inorder_rec(nodo.derecha, resultado)


# 🎯 EJEMPLOS

print("=" * 60)
print("EJEMPLO: Binary Search Tree")
print("=" * 60)

bst = BinarySearchTree()
valores = [50, 30, 70, 20, 40, 60, 80]

print("Insertando valores:", valores)
for valor in valores:
    bst.insertar(valor)

print(f"\nBuscando 40: {bst.buscar(40)}")
print(f"Buscando 99: {bst.buscar(99)}")

print(f"\nValores en orden (inorder): {bst.inorder()}")

print("\nEliminando 20:")
bst.eliminar(20)
print(f"Valores después de eliminar: {bst.inorder()}")

print("\n" + "=" * 60)
print("💡 CARACTERÍSTICAS DEL BST")
print("=" * 60)
print("""
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
""")





