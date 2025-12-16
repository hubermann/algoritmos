# Linked List (Lista Enlazada)
#
# Una lista enlazada es una estructura de datos donde cada elemento
# (node/nodo) contiene un valor y una referencia al siguiente elemento.
#
# Es como una cadena de eslabones: cada eslabón conoce al siguiente,
# pero no necesariamente están uno al lado del otro en memoria.

class Nodo
  # Nodo de una lista enlazada simple.
  attr_accessor :dato, :siguiente
  
  def initialize(dato)
    @dato = dato      # El valor almacenado
    @siguiente = nil # Referencia al siguiente nodo
  end
end

class LinkedList
  # Lista enlazada simple.
  attr_accessor :cabeza, :tamano
  
  def initialize
    @cabeza = nil    # Primer nodo de la lista
    @tamano = 0
  end
  
  def esta_vacia?
    # Verifica si la lista está vacía.
    @cabeza.nil?
  end
  
  def agregar_al_inicio(dato)
    # Agrega un elemento al inicio de la lista.
    nuevo_nodo = Nodo.new(dato)
    nuevo_nodo.siguiente = @cabeza
    @cabeza = nuevo_nodo
    @tamano += 1
  end
  
  def agregar_al_final(dato)
    # Agrega un elemento al final de la lista.
    nuevo_nodo = Nodo.new(dato)
    
    if esta_vacia?
      @cabeza = nuevo_nodo
    else
      actual = @cabeza
      # Recorrer hasta el último nodo
      while !actual.siguiente.nil?
        actual = actual.siguiente
      end
      actual.siguiente = nuevo_nodo
    end
    
    @tamano += 1
  end
  
  def eliminar(dato)
    # Elimina la primera ocurrencia de un dato.
    return false if esta_vacia?
    
    # Si es el primer elemento
    if @cabeza.dato == dato
      @cabeza = @cabeza.siguiente
      @tamano -= 1
      return true
    end
    
    # Buscar el elemento
    actual = @cabeza
    while !actual.siguiente.nil?
      if actual.siguiente.dato == dato
        actual.siguiente = actual.siguiente.siguiente
        @tamano -= 1
        return true
      end
      actual = actual.siguiente
    end
    
    false
  end
  
  def buscar(dato)
    # Busca un dato en la lista. Retorna true si existe.
    actual = @cabeza
    while !actual.nil?
      return true if actual.dato == dato
      actual = actual.siguiente
    end
    false
  end
  
  def obtener_indice(indice)
    # Obtiene el elemento en el índice dado.
    return nil if indice < 0 || indice >= @tamano
    
    actual = @cabeza
    indice.times do
      actual = actual.siguiente
    end
    actual.dato
  end
  
  def mostrar
    # Muestra todos los elementos de la lista.
    if esta_vacia?
      puts "Lista vacía"
      return
    end
    
    elementos = []
    actual = @cabeza
    while !actual.nil?
      elementos << actual.dato.to_s
      actual = actual.siguiente
    end
    puts elementos.join(" -> ")
  end
  
  def invertir
    # Invierte la lista enlazada.
    anterior = nil
    actual = @cabeza
    
    while !actual.nil?
      siguiente = actual.siguiente
      actual.siguiente = anterior
      anterior = actual
      actual = siguiente
    end
    
    @cabeza = anterior
  end
end

# 🎯 EJEMPLOS DE USO

puts "=" * 60
puts "EJEMPLO 1: Crear y agregar elementos"
puts "=" * 60
lista = LinkedList.new
puts "Agregando elementos al inicio:"
lista.agregar_al_inicio(3)
lista.agregar_al_inicio(2)
lista.agregar_al_inicio(1)
lista.mostrar

puts "\nAgregando elementos al final:"
lista2 = LinkedList.new
lista2.agregar_al_final(1)
lista2.agregar_al_final(2)
lista2.agregar_al_final(3)
lista2.mostrar

puts "\n" + "=" * 60
puts "EJEMPLO 2: Buscar y eliminar"
puts "=" * 60
lista3 = LinkedList.new
[5, 10, 15, 20, 25].each { |i| lista3.agregar_al_final(i) }

puts "Lista original:"
lista3.mostrar

puts "\n¿Existe el 15? #{lista3.buscar(15)}"
puts "¿Existe el 99? #{lista3.buscar(99)}"

puts "\nEliminando 15:"
lista3.eliminar(15)
lista3.mostrar

puts "\n" + "=" * 60
puts "EJEMPLO 3: Invertir lista"
puts "=" * 60
lista4 = LinkedList.new
[1, 2, 3, 4, 5].each { |i| lista4.agregar_al_final(i) }

puts "Lista original:"
lista4.mostrar

puts "\nLista invertida:"
lista4.invertir
lista4.mostrar

puts "\n" + "=" * 60
puts "EJEMPLO 4: Obtener por índice"
puts "=" * 60
lista5 = LinkedList.new
[10, 20, 30, 40, 50].each { |i| lista5.agregar_al_final(i) }

lista5.mostrar
puts "\nElemento en índice 0: #{lista5.obtener_indice(0)}"
puts "Elemento en índice 2: #{lista5.obtener_indice(2)}"
puts "Elemento en índice 4: #{lista5.obtener_indice(4)}"

# 💡 LISTA DOBLEMENTE ENLAZADA

class NodoDoble
  # Nodo para lista doblemente enlazada.
  attr_accessor :dato, :anterior, :siguiente
  
  def initialize(dato)
    @dato = dato
    @anterior = nil
    @siguiente = nil
  end
end

class DoublyLinkedList
  # Lista doblemente enlazada (puede recorrer en ambas direcciones).
  attr_accessor :cabeza, :cola, :tamano
  
  def initialize
    @cabeza = nil
    @cola = nil
    @tamano = 0
  end
  
  def agregar_al_final(dato)
    # Agrega un elemento al final.
    nuevo_nodo = NodoDoble.new(dato)
    
    if @cabeza.nil?
      @cabeza = nuevo_nodo
      @cola = nuevo_nodo
    else
      nuevo_nodo.anterior = @cola
      @cola.siguiente = nuevo_nodo
      @cola = nuevo_nodo
    end
    
    @tamano += 1
  end
  
  def mostrar_adelante
    # Muestra la lista desde el inicio.
    actual = @cabeza
    elementos = []
    while !actual.nil?
      elementos << actual.dato.to_s
      actual = actual.siguiente
    end
    puts elementos.join(" <-> ")
  end
  
  def mostrar_atras
    # Muestra la lista desde el final.
    actual = @cola
    elementos = []
    while !actual.nil?
      elementos << actual.dato.to_s
      actual = actual.anterior
    end
    puts elementos.join(" <-> ")
  end
end

puts "\n" + "=" * 60
puts "EJEMPLO 5: Lista Doblemente Enlazada"
puts "=" * 60
lista_doble = DoublyLinkedList.new
[1, 2, 3, 4, 5].each { |i| lista_doble.agregar_al_final(i) }

puts "Recorriendo hacia adelante:"
lista_doble.mostrar_adelante

puts "\nRecorriendo hacia atrás:"
lista_doble.mostrar_atras

# 💡 CARACTERÍSTICAS

puts "\n" + "=" * 60
puts "💡 CARACTERÍSTICAS DE LINKED LISTS"
puts "=" * 60
puts """
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
"""

puts "\n" + "=" * 60
puts "🏋️  EJERCICIOS"
puts "=" * 60
puts """
1. Implementa una función que encuentre el elemento del medio de una lista

2. Crea una función que detecte si hay un ciclo en la lista (detectar loop)

3. Escribe una función que combine dos listas enlazadas ordenadas en una sola

4. Implementa una función que elimine todos los duplicados de una lista

5. Crea una función que rote la lista k posiciones a la derecha

💡 Linked Lists son fundamentales para entender estructuras más complejas!
"""

