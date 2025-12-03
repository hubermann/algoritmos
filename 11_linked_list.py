"""
Linked List (Lista Enlazada)

Una lista enlazada es una estructura de datos donde cada elemento
(node/nodo) contiene un valor y una referencia al siguiente elemento.

Es como una cadena de eslabones: cada eslabón conoce al siguiente,
pero no necesariamente están uno al lado del otro en memoria.
"""


class Nodo:
    """Nodo de una lista enlazada simple."""
    
    def __init__(self, dato):
        self.dato = dato      # El valor almacenado
        self.siguiente = None # Referencia al siguiente nodo


class LinkedList:
    """Lista enlazada simple."""
    
    def __init__(self):
        self.cabeza = None    # Primer nodo de la lista
        self.tamano = 0
    
    def esta_vacia(self):
        """Verifica si la lista está vacía."""
        return self.cabeza is None
    
    def agregar_al_inicio(self, dato):
        """Agrega un elemento al inicio de la lista."""
        nuevo_nodo = Nodo(dato)
        nuevo_nodo.siguiente = self.cabeza
        self.cabeza = nuevo_nodo
        self.tamano += 1
    
    def agregar_al_final(self, dato):
        """Agrega un elemento al final de la lista."""
        nuevo_nodo = Nodo(dato)
        
        if self.esta_vacia():
            self.cabeza = nuevo_nodo
        else:
            actual = self.cabeza
            # Recorrer hasta el último nodo
            while actual.siguiente is not None:
                actual = actual.siguiente
            actual.siguiente = nuevo_nodo
        
        self.tamano += 1
    
    def eliminar(self, dato):
        """Elimina la primera ocurrencia de un dato."""
        if self.esta_vacia():
            return False
        
        # Si es el primer elemento
        if self.cabeza.dato == dato:
            self.cabeza = self.cabeza.siguiente
            self.tamano -= 1
            return True
        
        # Buscar el elemento
        actual = self.cabeza
        while actual.siguiente is not None:
            if actual.siguiente.dato == dato:
                actual.siguiente = actual.siguiente.siguiente
                self.tamano -= 1
                return True
            actual = actual.siguiente
        
        return False
    
    def buscar(self, dato):
        """Busca un dato en la lista. Retorna True si existe."""
        actual = self.cabeza
        while actual is not None:
            if actual.dato == dato:
                return True
            actual = actual.siguiente
        return False
    
    def obtener_indice(self, indice):
        """Obtiene el elemento en el índice dado."""
        if indice < 0 or indice >= self.tamano:
            return None
        
        actual = self.cabeza
        for i in range(indice):
            actual = actual.siguiente
        return actual.dato
    
    def mostrar(self):
        """Muestra todos los elementos de la lista."""
        if self.esta_vacia():
            print("Lista vacía")
            return
        
        elementos = []
        actual = self.cabeza
        while actual is not None:
            elementos.append(str(actual.dato))
            actual = actual.siguiente
        print(" -> ".join(elementos))
    
    def invertir(self):
        """Invierte la lista enlazada."""
        anterior = None
        actual = self.cabeza
        
        while actual is not None:
            siguiente = actual.siguiente
            actual.siguiente = anterior
            anterior = actual
            actual = siguiente
        
        self.cabeza = anterior


# 🎯 EJEMPLOS DE USO

print("=" * 60)
print("EJEMPLO 1: Crear y agregar elementos")
print("=" * 60)
lista = LinkedList()
print("Agregando elementos al inicio:")
lista.agregar_al_inicio(3)
lista.agregar_al_inicio(2)
lista.agregar_al_inicio(1)
lista.mostrar()

print("\nAgregando elementos al final:")
lista2 = LinkedList()
lista2.agregar_al_final(1)
lista2.agregar_al_final(2)
lista2.agregar_al_final(3)
lista2.mostrar()

print("\n" + "=" * 60)
print("EJEMPLO 2: Buscar y eliminar")
print("=" * 60)
lista3 = LinkedList()
for i in [5, 10, 15, 20, 25]:
    lista3.agregar_al_final(i)

print("Lista original:")
lista3.mostrar()

print(f"\n¿Existe el 15? {lista3.buscar(15)}")
print(f"¿Existe el 99? {lista3.buscar(99)}")

print("\nEliminando 15:")
lista3.eliminar(15)
lista3.mostrar()

print("\n" + "=" * 60)
print("EJEMPLO 3: Invertir lista")
print("=" * 60)
lista4 = LinkedList()
for i in [1, 2, 3, 4, 5]:
    lista4.agregar_al_final(i)

print("Lista original:")
lista4.mostrar()

print("\nLista invertida:")
lista4.invertir()
lista4.mostrar()

print("\n" + "=" * 60)
print("EJEMPLO 4: Obtener por índice")
print("=" * 60)
lista5 = LinkedList()
for i in [10, 20, 30, 40, 50]:
    lista5.agregar_al_final(i)

lista5.mostrar()
print(f"\nElemento en índice 0: {lista5.obtener_indice(0)}")
print(f"Elemento en índice 2: {lista5.obtener_indice(2)}")
print(f"Elemento en índice 4: {lista5.obtener_indice(4)}")


# 💡 LISTA DOBLEMENTE ENLAZADA

class NodoDoble:
    """Nodo para lista doblemente enlazada."""
    
    def __init__(self, dato):
        self.dato = dato
        self.anterior = None
        self.siguiente = None


class DoublyLinkedList:
    """Lista doblemente enlazada (puede recorrer en ambas direcciones)."""
    
    def __init__(self):
        self.cabeza = None
        self.cola = None
        self.tamano = 0
    
    def agregar_al_final(self, dato):
        """Agrega un elemento al final."""
        nuevo_nodo = NodoDoble(dato)
        
        if self.cabeza is None:
            self.cabeza = nuevo_nodo
            self.cola = nuevo_nodo
        else:
            nuevo_nodo.anterior = self.cola
            self.cola.siguiente = nuevo_nodo
            self.cola = nuevo_nodo
        
        self.tamano += 1
    
    def mostrar_adelante(self):
        """Muestra la lista desde el inicio."""
        actual = self.cabeza
        elementos = []
        while actual is not None:
            elementos.append(str(actual.dato))
            actual = actual.siguiente
        print(" <-> ".join(elementos))
    
    def mostrar_atras(self):
        """Muestra la lista desde el final."""
        actual = self.cola
        elementos = []
        while actual is not None:
            elementos.append(str(actual.dato))
            actual = actual.anterior
        print(" <-> ".join(elementos))


print("\n" + "=" * 60)
print("EJEMPLO 5: Lista Doblemente Enlazada")
print("=" * 60)
lista_doble = DoublyLinkedList()
for i in [1, 2, 3, 4, 5]:
    lista_doble.agregar_al_final(i)

print("Recorriendo hacia adelante:")
lista_doble.mostrar_adelante()

print("\nRecorriendo hacia atrás:")
lista_doble.mostrar_atras()


# 💡 CARACTERÍSTICAS

print("\n" + "=" * 60)
print("💡 CARACTERÍSTICAS DE LINKED LISTS")
print("=" * 60)
print("""
✅ VENTAJAS:
   - Tamaño dinámico (puede crecer/shrink)
   - Insertar/eliminar al inicio es O(1)
   - No necesita memoria contigua
   - Fácil de reordenar elementos

❌ DESVENTAJAS:
   - Acceso aleatorio es O(n) (no como arrays O(1))
   - Más memoria (almacena referencias)
   - No hay acceso directo por índice
   - Recorrer es más lento (menos cache-friendly)

📊 COMPLEJIDAD:
   - Insertar al inicio: O(1)
   - Insertar al final: O(n) - sin cola, O(1) - con cola
   - Eliminar: O(n) - buscar + O(1) eliminar
   - Buscar: O(n)
   - Acceder por índice: O(n)

🎯 CUÁNDO USAR:
   - Cuando necesitas insertar/eliminar frecuentemente
   - Cuando no sabes el tamaño de antemano
   - Para implementar Stacks y Queues
   - Cuando el orden es importante y cambia mucho

💡 COMPARACIÓN CON ARRAYS:
   - Arrays: acceso rápido O(1), tamaño fijo
   - Linked Lists: acceso lento O(n), tamaño dinámico
""")

print("\n" + "=" * 60)
print("🏋️  EJERCICIOS")
print("=" * 60)
print("""
1. Implementa una función que encuentre el elemento del medio de una lista

2. Crea una función que detecte si hay un ciclo en la lista (detectar loop)

3. Escribe una función que combine dos listas enlazadas ordenadas en una sola

4. Implementa una función que elimine todos los duplicados de una lista

5. Crea una función que rote la lista k posiciones a la derecha

💡 Linked Lists son fundamentales para entender estructuras más complejas!
""")

