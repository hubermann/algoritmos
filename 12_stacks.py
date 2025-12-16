"""
Stacks (Pilas) - LIFO (Last In First Out)

Una pila es como una pila de platos: el último que pones
es el primero que sacas (LIFO - Last In First Out).

Operaciones principales:
- push: agregar elemento (poner en la pila)
- pop: quitar elemento (sacar de la pila)
- peek/top: ver el elemento superior sin quitarlo
- isEmpty: verificar si está vacía
"""


class Stack:
    """Implementación de pila usando lista de Python."""
    
    def __init__(self):
        self.items = []
    
    def push(self, item):
        """Agrega un elemento a la pila."""
        self.items.append(item)
    
    def pop(self):
        """Quita y retorna el elemento superior."""
        if self.esta_vacia():
            return None
        return self.items.pop()
    
    def peek(self):
        """Muestra el elemento superior sin quitarlo."""
        if self.esta_vacia():
            return None
        return self.items[-1]
    
    def esta_vacia(self):
        """Verifica si la pila está vacía."""
        return len(self.items) == 0
    
    def tamano(self):
        """Retorna el tamaño de la pila."""
        return len(self.items)
    
    def mostrar(self):
        """Muestra la pila (último arriba)."""
        if self.esta_vacia():
            print("Pila vacía")
            return
        
        print("Pila (arriba = último):")
        for i in range(len(self.items) - 1, -1, -1):
            print(f"  [{self.items[i]}]")


# 🎯 EJEMPLOS DE USO

print("=" * 60)
print("EJEMPLO 1: Operaciones básicas")
print("=" * 60)
pila = Stack()
print("Agregando elementos:")
pila.push(1)
pila.push(2)
pila.push(3)
pila.mostrar()

print(f"\nElemento superior (peek): {pila.peek()}")
print(f"Tamaño: {pila.tamano()}")

print("\nQuitando elementos:")
print(f"Pop: {pila.pop()}")
print(f"Pop: {pila.pop()}")
pila.mostrar()


# 🎯 APLICACIONES PRÁCTICAS

def verificar_parentesis(expresion):
    """
    Verifica si los paréntesis están balanceados usando una pila.
    Ejemplo: "((()))" está balanceado, "(()" no lo está.
    """
    pila = Stack()
    
    for char in expresion:
        if char == '(':
            pila.push(char)
        elif char == ')':
            if pila.esta_vacia():
                return False
            pila.pop()
    
    return pila.esta_vacia()


def invertir_string_con_pila(texto):
    """Invierte un string usando una pila."""
    pila = Stack()
    
    # Agregar cada carácter a la pila
    for char in texto:
        pila.push(char)
    
    # Sacar todos los caracteres (saldrán en orden inverso)
    resultado = ""
    while not pila.esta_vacia():
        resultado += pila.pop()
    
    return resultado


def evaluar_expresion_postfija(expresion):
    """
    Evalúa una expresión en notación postfija (RPN).
    Ejemplo: "3 4 + 2 *" = (3+4)*2 = 14
    """
    pila = Stack()
    tokens = expresion.split()
    
    for token in tokens:
        if token.isdigit():
            pila.push(int(token))
        else:
            # Es un operador
            b = pila.pop()
            a = pila.pop()
            
            if token == '+':
                pila.push(a + b)
            elif token == '-':
                pila.push(a - b)
            elif token == '*':
                pila.push(a * b)
            elif token == '/':
                pila.push(a / b)
    
    return pila.pop()


print("\n" + "=" * 60)
print("EJEMPLO 2: Verificar paréntesis balanceados")
print("=" * 60)
expresiones = ["((()))", "(()", "()()", "((())"]
for expr in expresiones:
    resultado = verificar_parentesis(expr)
    print(f"'{expr}' está balanceado: {resultado}")

print("\n" + "=" * 60)
print("EJEMPLO 3: Invertir string con pila")
print("=" * 60)
texto = "Python"
invertido = invertir_string_con_pila(texto)
print(f"'{texto}' invertido: '{invertido}'")

print("\n" + "=" * 60)
print("EJEMPLO 4: Evaluar expresión postfija")
print("=" * 60)
expresiones_post = ["3 4 +", "3 4 + 2 *", "5 1 2 + 4 * + 3 -"]
for expr in expresiones_post:
    resultado = evaluar_expresion_postfija(expr)
    print(f"'{expr}' = {resultado}")


# 💡 IMPLEMENTACIÓN CON LINKED LIST

class StackNode:
    """Nodo para pila implementada con linked list."""
    
    def __init__(self, dato):
        self.dato = dato
        self.siguiente = None


class StackLinkedList:
    """Pila implementada con lista enlazada."""
    
    def __init__(self):
        self.top = None
        self.tamano = 0
    
    def push(self, item):
        nuevo_nodo = StackNode(item)
        nuevo_nodo.siguiente = self.top
        self.top = nuevo_nodo
        self.tamano += 1
    
    def pop(self):
        if self.esta_vacia():
            return None
        
        dato = self.top.dato
        self.top = self.top.siguiente
        self.tamano -= 1
        return dato
    
    def peek(self):
        if self.esta_vacia():
            return None
        return self.top.dato
    
    def esta_vacia(self):
        return self.top is None


print("\n" + "=" * 60)
print("EJEMPLO 5: Stack con Linked List")
print("=" * 60)
pila_ll = StackLinkedList()
pila_ll.push(10)
pila_ll.push(20)
pila_ll.push(30)
print(f"Top: {pila_ll.peek()}")
print(f"Pop: {pila_ll.pop()}")
print(f"Top después del pop: {pila_ll.peek()}")


# 💡 CARACTERÍSTICAS

print("\n" + "=" * 60)
print("💡 CARACTERÍSTICAS DE STACKS")
print("=" * 60)
print("""
✅ VENTAJAS:
   - Simple y eficiente
   - Útil para muchos problemas algorítmicos
   - Operaciones rápidas O(1)

📊 COMPLEJIDAD:
   - Push: O(1)
   - Pop: O(1)
   - Peek: O(1)
   - isEmpty: O(1)

🎯 APLICACIONES:
   - Verificar paréntesis balanceados
   - Evaluar expresiones (infija, postfija, prefija)
   - Navegación en navegadores (botón atrás)
   - Call stack en recursión
   - Algoritmos de backtracking
   - Undo/Redo en editores

💡 RECUERDA: LIFO = Last In First Out
   El último que entra es el primero que sale
""")

print("\n" + "=" * 60)
print("🏋️  EJERCICIOS")
print("=" * 60)
print("""
1. Implementa una función que verifique si múltiples tipos de
   paréntesis están balanceados: (), [], {}

2. Crea una función que convierta expresión infija a postfija
   Ejemplo: "3 + 4" → "3 4 +"

3. Implementa una función que encuentre el siguiente elemento
   mayor a la derecha para cada elemento de un array usando stack

4. Crea una pila que además tenga una función min() que retorne
   el elemento mínimo en O(1)

💡 Las pilas son fundamentales para muchos algoritmos!
""")





