"""
Binary Tree (Árbol Binario)

Un árbol binario es un árbol donde cada nodo tiene máximo 2 hijos:
- Hijo izquierdo
- Hijo derecho

Es la base para muchos algoritmos y estructuras de datos avanzadas.
"""


class BinaryTreeNode:
    """Nodo de un árbol binario."""
    
    def __init__(self, valor):
        self.valor = valor
        self.izquierda = None  # Hijo izquierdo
        self.derecha = None    # Hijo derecho


class BinaryTree:
    """Árbol binario básico."""
    
    def __init__(self, valor_raiz=None):
        if valor_raiz is not None:
            self.raiz = BinaryTreeNode(valor_raiz)
        else:
            self.raiz = None
    
    def insertar(self, valor):
        """Inserta un valor en el árbol (inserción simple, no BST)."""
        if self.raiz is None:
            self.raiz = BinaryTreeNode(valor)
        else:
            self._insertar_recursivo(self.raiz, valor)
    
    def _insertar_recursivo(self, nodo, valor):
        """Inserción recursiva (busca primer espacio disponible)."""
        if nodo.izquierda is None:
            nodo.izquierda = BinaryTreeNode(valor)
        elif nodo.derecha is None:
            nodo.derecha = BinaryTreeNode(valor)
        else:
            # Si ambos hijos existen, inserta en el izquierdo
            self._insertar_recursivo(nodo.izquierda, valor)


# 🎯 RECORRIDOS (TRAVERSAL)

def preorder(nodo, resultado=None):
    """
    Recorrido Preorder: Raíz -> Izquierda -> Derecha
    """
    if resultado is None:
        resultado = []
    
    if nodo:
        resultado.append(nodo.valor)  # Visitar raíz
        preorder(nodo.izquierda, resultado)  # Izquierda
        preorder(nodo.derecha, resultado)    # Derecha
    
    return resultado


def inorder(nodo, resultado=None):
    """
    Recorrido Inorder: Izquierda -> Raíz -> Derecha
    En un BST, esto da los valores en orden.
    """
    if resultado is None:
        resultado = []
    
    if nodo:
        inorder(nodo.izquierda, resultado)   # Izquierda
        resultado.append(nodo.valor)         # Visitar raíz
        inorder(nodo.derecha, resultado)     # Derecha
    
    return resultado


def postorder(nodo, resultado=None):
    """
    Recorrido Postorder: Izquierda -> Derecha -> Raíz
    """
    if resultado is None:
        resultado = []
    
    if nodo:
        postorder(nodo.izquierda, resultado)  # Izquierda
        postorder(nodo.derecha, resultado)    # Derecha
        resultado.append(nodo.valor)          # Visitar raíz
    
    return resultado


def level_order(nodo):
    """
    Recorrido por niveles (BFS).
    Nivel por nivel, de izquierda a derecha.
    """
    if not nodo:
        return []
    
    from collections import deque
    cola = deque([nodo])
    resultado = []
    
    while cola:
        actual = cola.popleft()
        resultado.append(actual.valor)
        
        if actual.izquierda:
            cola.append(actual.izquierda)
        if actual.derecha:
            cola.append(actual.derecha)
    
    return resultado


# 🎯 OPERACIONES BÁSICAS

def altura(nodo):
    """Calcula la altura de un árbol binario."""
    if not nodo:
        return -1
    
    altura_izq = altura(nodo.izquierda)
    altura_der = altura(nodo.derecha)
    
    return 1 + max(altura_izq, altura_der)


def contar_nodos(nodo):
    """Cuenta todos los nodos del árbol."""
    if not nodo:
        return 0
    
    return 1 + contar_nodos(nodo.izquierda) + contar_nodos(nodo.derecha)


def buscar(nodo, valor):
    """Busca un valor en el árbol."""
    if not nodo:
        return False
    
    if nodo.valor == valor:
        return True
    
    return buscar(nodo.izquierda, valor) or buscar(nodo.derecha, valor)


# 🎯 EJEMPLOS

print("=" * 60)
print("EJEMPLO 1: Crear árbol binario")
print("=" * 60)

# Crear árbol:
#       1
#      / \
#     2   3
#    / \
#   4   5

raiz = BinaryTreeNode(1)
raiz.izquierda = BinaryTreeNode(2)
raiz.derecha = BinaryTreeNode(3)
raiz.izquierda.izquierda = BinaryTreeNode(4)
raiz.izquierda.derecha = BinaryTreeNode(5)

print("\nÁrbol:")
print("       1")
print("      / \\")
print("     2   3")
print("    / \\")
print("   4   5")

print("\n" + "=" * 60)
print("RECORRIDOS DEL ÁRBOL")
print("=" * 60)

print(f"\nPreorder  (Raíz-Izq-Der): {preorder(raiz)}")
print(f"Inorder   (Izq-Raíz-Der):  {inorder(raiz)}")
print(f"Postorder (Izq-Der-Raíz):  {postorder(raiz)}")
print(f"Level-order (por niveles): {level_order(raiz)}")

print("\n" + "=" * 60)
print("OPERACIONES")
print("=" * 60)

print(f"Altura del árbol: {altura(raiz)}")
print(f"Total de nodos: {contar_nodos(raiz)}")
print(f"¿Existe el valor 3? {buscar(raiz, 3)}")
print(f"¿Existe el valor 99? {buscar(raiz, 99)}")


# 💡 CARACTERÍSTICAS

print("\n" + "=" * 60)
print("💡 RECORRIDOS DE ÁRBOLES BINARIOS")
print("=" * 60)
print("""
1. PREORDER (NLR):
   - Visita: Nodo, Izquierda, Derecha
   - Útil para copiar árboles
   - Ejemplo: [1, 2, 4, 5, 3]

2. INORDER (LNR):
   - Visita: Izquierda, Nodo, Derecha
   - En BST: da valores ordenados
   - Ejemplo: [4, 2, 5, 1, 3]

3. POSTORDER (LRN):
   - Visita: Izquierda, Derecha, Nodo
   - Útil para eliminar árboles
   - Ejemplo: [4, 5, 2, 3, 1]

4. LEVEL-ORDER (BFS):
   - Nivel por nivel, izquierda a derecha
   - Usa una cola
   - Ejemplo: [1, 2, 3, 4, 5]

💡 MEMORIZA: Pre/In/Post se refiere a cuándo visitas la RAÍZ
""")

print("\n" + "=" * 60)
print("🏋️  EJERCICIOS")
print("=" * 60)
print("""
1. Implementa una función que calcule el ancho máximo del árbol

2. Crea una función que encuentre el camino más largo entre dos nodos

3. Escribe una función que verifique si un árbol es completo

4. Implementa una función que invierta un árbol binario (espejo)

💡 Los árboles binarios son la base de estructuras más complejas!
""")





