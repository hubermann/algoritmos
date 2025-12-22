"""
Trees (Árboles) - Conceptos Fundamentales

Un árbol es una estructura de datos jerárquica donde cada elemento
tiene un padre (excepto la raíz) y cero o más hijos.

Es como un árbol genealógico o la estructura de carpetas:
- Raíz: el nodo superior (no tiene padre)
- Nodos internos: tienen padre e hijos
- Hojas: nodos sin hijos
- Altura: distancia desde la raíz hasta el nodo más profundo
"""


class TreeNode:
    """Nodo básico de un árbol."""
    
    def __init__(self, valor):
        self.valor = valor
        self.hijos = []  # Lista de nodos hijos
    
    def agregar_hijo(self, nodo):
        """Agrega un hijo al nodo."""
        self.hijos.append(nodo)
    
    def mostrar(self, nivel=0):
        """Muestra el árbol de forma jerárquica."""
        indent = "  " * nivel
        print(f"{indent}{self.valor}")
        for hijo in self.hijos:
            hijo.mostrar(nivel + 1)


# 🎯 EJEMPLO: ÁRBOL GENERAL

print("=" * 60)
print("EJEMPLO 1: Árbol General (con múltiples hijos)")
print("=" * 60)

# Crear árbol:
#       A
#     / | \
#    B  C  D
#   /|\    |
#  E F G   H

raiz = TreeNode("A")
nodo_b = TreeNode("B")
nodo_c = TreeNode("C")
nodo_d = TreeNode("D")
nodo_e = TreeNode("E")
nodo_f = TreeNode("F")
nodo_g = TreeNode("G")
nodo_h = TreeNode("H")

raiz.agregar_hijo(nodo_b)
raiz.agregar_hijo(nodo_c)
raiz.agregar_hijo(nodo_d)

nodo_b.agregar_hijo(nodo_e)
nodo_b.agregar_hijo(nodo_f)
nodo_b.agregar_hijo(nodo_g)

nodo_d.agregar_hijo(nodo_h)

print("\nÁrbol:")
raiz.mostrar()


# 🎯 CONCEPTOS BÁSICOS

def altura_arbol(nodo):
    """Calcula la altura de un árbol."""
    if not nodo.hijos:
        return 0
    
    alturas_hijos = [altura_arbol(hijo) for hijo in nodo.hijos]
    return 1 + max(alturas_hijos)


def contar_nodos(nodo):
    """Cuenta todos los nodos del árbol."""
    if not nodo:
        return 0
    
    contador = 1
    for hijo in nodo.hijos:
        contador += contar_nodos(hijo)
    
    return contador


def contar_hojas(nodo):
    """Cuenta los nodos hoja (sin hijos)."""
    if not nodo.hijos:
        return 1
    
    total = 0
    for hijo in nodo.hijos:
        total += contar_hojas(hijo)
    
    return total


def buscar_nodo(nodo, valor):
    """Busca un nodo con un valor específico."""
    if nodo.valor == valor:
        return nodo
    
    for hijo in nodo.hijos:
        resultado = buscar_nodo(hijo, valor)
        if resultado:
            return resultado
    
    return None


print("\n" + "=" * 60)
print("OPERACIONES BÁSICAS EN ÁRBOLES")
print("=" * 60)
print(f"Altura del árbol: {altura_arbol(raiz)}")
print(f"Total de nodos: {contar_nodos(raiz)}")
print(f"Número de hojas: {contar_hojas(raiz)}")
print(f"Buscando 'F': {buscar_nodo(raiz, 'F') is not None}")
print(f"Buscando 'Z': {buscar_nodo(raiz, 'Z') is not None}")


# 🎯 TIPOS DE ÁRBOLES

print("\n" + "=" * 60)
print("TIPOS DE ÁRBOLES")
print("=" * 60)
print("""
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

6. ÁRBOL DE EXPRESIÓN:
   - Representa expresiones matemáticas

7. HEAP:
   - Árbol binario completo con propiedad de orden
   - Max Heap: padre > hijos
   - Min Heap: padre < hijos
""")


# 🎯 TERMINOLOGÍA

print("\n" + "=" * 60)
print("TERMINOLOGÍA IMPORTANTE")
print("=" * 60)
print("""
🌳 PARTES DE UN ÁRBOL:
   - Raíz (Root): Nodo superior, sin padre
   - Nodo: Cada elemento del árbol
   - Hoja (Leaf): Nodo sin hijos
   - Nodo interno: Nodo con al menos un hijo
   - Padre: Nodo que tiene hijos
   - Hijo: Nodo que tiene padre
   - Hermanos: Nodos con el mismo padre
   - Ancestros: Todos los nodos desde la raíz hasta el nodo
   - Descendientes: Todos los nodos debajo de un nodo

📏 MEDIDAS:
   - Altura: Distancia desde la raíz hasta el nodo más profundo
   - Profundidad: Distancia desde la raíz hasta un nodo
   - Nivel: Profundidad + 1
   - Grado: Número máximo de hijos de un nodo

🔗 RELACIONES:
   - Camino: Secuencia de nodos desde uno hasta otro
   - Longitud del camino: Número de aristas en el camino
   - Subárbol: Un nodo y todos sus descendientes
""")


# 🎯 VENTAJAS Y DESVENTAJAS

print("\n" + "=" * 60)
print("💡 CARACTERÍSTICAS DE ÁRBOLES")
print("=" * 60)
print("""
✅ VENTAJAS:
   - Representa relaciones jerárquicas naturalmente
   - Búsqueda más rápida que listas lineales (en BST)
   - Insertar/eliminar es eficiente (en árboles balanceados)
   - Flexible para diferentes tipos de datos

❌ DESVENTAJAS:
   - Más complejo que estructuras lineales
   - Puede degenerar en lista (si no está balanceado)
   - Requiere más memoria que arrays

📊 COMPLEJIDAD (en BST balanceado):
   - Buscar: O(log n)
   - Insertar: O(log n)
   - Eliminar: O(log n)
   - Recorrer: O(n)

🎯 CUÁNDO USAR:
   - Representar jerarquías (archivos, organización)
   - Búsqueda rápida ordenada
   - Expresiones matemáticas
   - Base para estructuras más complejas (heaps, tries)
""")


print("\n" + "=" * 60)
print("🏋️  EJERCICIOS")
print("=" * 60)
print("""
1. Crea una función que encuentre el nodo con el valor máximo en un árbol

2. Implementa una función que calcule la suma de todos los valores del árbol

3. Escribe una función que encuentre todos los nodos en un nivel específico

4. Crea una función que verifique si un árbol es simétrico

💡 Los árboles son fundamentales para entender estructuras más avanzadas!
""")






