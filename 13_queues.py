"""
Queues (Colas) - FIFO (First In First Out)

Una cola es como una fila en el banco: el primero que llega
es el primero que es atendido (FIFO - First In First Out).

Operaciones principales:
- enqueue: agregar elemento (al final)
- dequeue: quitar elemento (del inicio)
- front: ver el primer elemento
- isEmpty: verificar si está vacía
"""


class Queue:
    """Implementación de cola usando lista de Python."""
    
    def __init__(self):
        self.items = []
    
    def enqueue(self, item):
        """Agrega un elemento al final de la cola."""
        self.items.append(item)
    
    def dequeue(self):
        """Quita y retorna el primer elemento de la cola."""
        if self.esta_vacia():
            return None
        return self.items.pop(0)
    
    def front(self):
        """Muestra el primer elemento sin quitarlo."""
        if self.esta_vacia():
            return None
        return self.items[0]
    
    def esta_vacia(self):
        """Verifica si la cola está vacía."""
        return len(self.items) == 0
    
    def tamano(self):
        """Retorna el tamaño de la cola."""
        return len(self.items)
    
    def mostrar(self):
        """Muestra la cola (inicio a la izquierda)."""
        if self.esta_vacia():
            print("Cola vacía")
            return
        
        elementos = " -> ".join(map(str, self.items))
        print(f"Cola: [{elementos}]")


# 🎯 EJEMPLOS DE USO

print("=" * 60)
print("EJEMPLO 1: Operaciones básicas")
print("=" * 60)
cola = Queue()
print("Agregando elementos:")
cola.enqueue(1)
cola.enqueue(2)
cola.enqueue(3)
cola.mostrar()

print(f"\nPrimer elemento (front): {cola.front()}")
print(f"Tamaño: {cola.tamano()}")

print("\nQuitando elementos:")
print(f"Dequeue: {cola.dequeue()}")
print(f"Dequeue: {cola.dequeue()}")
cola.mostrar()


# 💡 COLA CIRCULAR (MÁS EFICIENTE)

class CircularQueue:
    """Cola circular usando array de tamaño fijo."""
    
    def __init__(self, capacidad):
        self.capacidad = capacidad
        self.items = [None] * capacidad
        self.front_idx = 0
        self.rear_idx = 0
        self.tamano = 0
    
    def enqueue(self, item):
        """Agrega un elemento."""
        if self.tamano == self.capacidad:
            print("Cola llena!")
            return False
        
        self.items[self.rear_idx] = item
        self.rear_idx = (self.rear_idx + 1) % self.capacidad
        self.tamano += 1
        return True
    
    def dequeue(self):
        """Quita un elemento."""
        if self.esta_vacia():
            return None
        
        item = self.items[self.front_idx]
        self.items[self.front_idx] = None
        self.front_idx = (self.front_idx + 1) % self.capacidad
        self.tamano -= 1
        return item
    
    def front(self):
        """Retorna el primer elemento."""
        if self.esta_vacia():
            return None
        return self.items[self.front_idx]
    
    def esta_vacia(self):
        return self.tamano == 0
    
    def esta_llena(self):
        return self.tamano == self.capacidad


# 💡 DEQUE (Double-Ended Queue)

class Deque:
    """
    Deque (Cola de doble extremo).
    Permite agregar/quitar tanto al inicio como al final.
    """
    
    def __init__(self):
        self.items = []
    
    def agregar_adelante(self, item):
        """Agrega al inicio."""
        self.items.insert(0, item)
    
    def agregar_atras(self, item):
        """Agrega al final."""
        self.items.append(item)
    
    def quitar_adelante(self):
        """Quita del inicio."""
        if self.esta_vacia():
            return None
        return self.items.pop(0)
    
    def quitar_atras(self):
        """Quita del final."""
        if self.esta_vacia():
            return None
        return self.items.pop()
    
    def ver_adelante(self):
        """Ve el primer elemento."""
        if self.esta_vacia():
            return None
        return self.items[0]
    
    def ver_atras(self):
        """Ve el último elemento."""
        if self.esta_vacia():
            return None
        return self.items[-1]
    
    def esta_vacia(self):
        return len(self.items) == 0
    
    def tamano(self):
        return len(self.items)


print("\n" + "=" * 60)
print("EJEMPLO 2: Deque (Cola de doble extremo)")
print("=" * 60)
deque = Deque()
deque.agregar_atras(1)
deque.agregar_atras(2)
deque.agregar_adelante(0)
print(f"Deque: {deque.items}")
print(f"Primero: {deque.ver_adelante()}, Último: {deque.ver_atras()}")


# 🎯 APLICACIONES PRÁCTICAS

def generar_numeros_binarios(n):
    """
    Genera los primeros n números binarios usando una cola.
    Ejemplo: n=5 → ["1", "10", "11", "100", "101"]
    """
    cola = Queue()
    resultado = []
    
    cola.enqueue("1")
    
    for i in range(n):
        numero = cola.dequeue()
        resultado.append(numero)
        
        cola.enqueue(numero + "0")
        cola.enqueue(numero + "1")
    
    return resultado


def nivel_orden_traversal(raiz):
    """
    Recorrido por niveles de un árbol usando cola (BFS básico).
    """
    if raiz is None:
        return []
    
    cola = Queue()
    cola.enqueue(raiz)
    resultado = []
    
    while not cola.esta_vacia():
        nodo = cola.dequeue()
        resultado.append(nodo.valor)
        
        if nodo.izquierda:
            cola.enqueue(nodo.izquierda)
        if nodo.derecha:
            cola.enqueue(nodo.derecha)
    
    return resultado


print("\n" + "=" * 60)
print("EJEMPLO 3: Generar números binarios")
print("=" * 60)
binarios = generar_numeros_binarios(5)
print(f"Primeros 5 números binarios: {binarios}")


# 💡 PRIORITY QUEUE

class PriorityQueue:
    """Cola de prioridad (elemento con mayor prioridad sale primero)."""
    
    def __init__(self):
        self.items = []
    
    def enqueue(self, item, prioridad):
        """Agrega un elemento con su prioridad."""
        self.items.append((prioridad, item))
        self.items.sort(reverse=True)  # Mayor prioridad primero
    
    def dequeue(self):
        """Quita el elemento con mayor prioridad."""
        if self.esta_vacia():
            return None
        return self.items.pop(0)[1]
    
    def esta_vacia(self):
        return len(self.items) == 0
    
    def mostrar(self):
        """Muestra la cola ordenada por prioridad."""
        for prioridad, item in self.items:
            print(f"Prioridad {prioridad}: {item}")


print("\n" + "=" * 60)
print("EJEMPLO 4: Priority Queue")
print("=" * 60)
pq = PriorityQueue()
pq.enqueue("Tarea baja", 1)
pq.enqueue("Tarea alta", 5)
pq.enqueue("Tarea media", 3)
print("Cola de prioridad (mayor primero):")
pq.mostrar()

print("\nProcesando tareas:")
while not pq.esta_vacia():
    print(f"  Procesando: {pq.dequeue()}")


# 💡 CARACTERÍSTICAS

print("\n" + "=" * 60)
print("💡 CARACTERÍSTICAS DE QUEUES")
print("=" * 60)
print("""
✅ VENTAJAS:
   - Simple y eficiente
   - Útil para procesamiento en orden
   - Operaciones rápidas

📊 COMPLEJIDAD:
   - Enqueue: O(1) - con cola circular
   - Dequeue: O(1) - con cola circular
   - Front: O(1)
   - Con lista normal: dequeue es O(n)

🎯 APLICACIONES:
   - Procesamiento de tareas en orden
   - BFS (Breadth First Search) en grafos
   - Scheduling de procesos
   - Manejo de peticiones en servidores
   - Impresión de documentos
   - Simulación de líneas de espera

💡 RECUERDA: FIFO = First In First Out
   El primero que entra es el primero que sale

🔄 TIPOS DE QUEUES:
   - Queue normal: FIFO
   - Circular Queue: más eficiente en memoria
   - Deque: doble extremo
   - Priority Queue: por prioridad
""")

print("\n" + "=" * 60)
print("🏋️  EJERCICIOS")
print("=" * 60)
print("""
1. Implementa una cola usando dos pilas (stack)

2. Crea una función que invierta una cola usando recursión

3. Implementa una cola que tenga una función max() que retorne
   el elemento máximo en O(1)

4. Crea un sistema de tickets donde cada ticket tiene un número
   y se atienden en orden (simula una cola real)

💡 Las colas son esenciales para algoritmos de grafos como BFS!
""")

