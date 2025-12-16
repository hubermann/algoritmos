# Queues (Colas) - FIFO (First In First Out)
#
# Una cola es como una fila en el banco: el primero que llega
# es el primero que es atendido (FIFO - First In First Out).
#
# Operaciones principales:
# - enqueue: agregar elemento (al final)
# - dequeue: quitar elemento (del inicio)
# - front: ver el primer elemento
# - isEmpty: verificar si está vacía

class Queue
  # Implementación de cola usando array de Ruby.
  def initialize
    @items = []
  end
  
  def enqueue(item)
    # Agrega un elemento al final de la cola.
    @items << item
  end
  
  def dequeue
    # Quita y retorna el primer elemento de la cola.
    return nil if esta_vacia?
    @items.shift
  end
  
  def front
    # Muestra el primer elemento sin quitarlo.
    return nil if esta_vacia?
    @items[0]
  end
  
  def esta_vacia?
    # Verifica si la cola está vacía.
    @items.empty?
  end
  
  def tamano
    # Retorna el tamaño de la cola.
    @items.length
  end
  
  def mostrar
    # Muestra la cola (inicio a la izquierda).
    if esta_vacia?
      puts "Cola vacía"
      return
    end
    
    elementos = @items.map(&:to_s).join(" -> ")
    puts "Cola: [#{elementos}]"
  end
end

# 🎯 EJEMPLOS DE USO

puts "=" * 60
puts "EJEMPLO 1: Operaciones básicas"
puts "=" * 60
cola = Queue.new
puts "Agregando elementos:"
cola.enqueue(1)
cola.enqueue(2)
cola.enqueue(3)
cola.mostrar

puts "\nPrimer elemento (front): #{cola.front}"
puts "Tamaño: #{cola.tamano}"

puts "\nQuitando elementos:"
puts "Dequeue: #{cola.dequeue}"
puts "Dequeue: #{cola.dequeue}"
cola.mostrar

# 💡 COLA CIRCULAR (MÁS EFICIENTE)

class CircularQueue
  # Cola circular usando array de tamaño fijo.
  attr_accessor :capacidad, :items, :front_idx, :rear_idx, :tamano
  
  def initialize(capacidad)
    @capacidad = capacidad
    @items = Array.new(capacidad)
    @front_idx = 0
    @rear_idx = 0
    @tamano = 0
  end
  
  def enqueue(item)
    # Agrega un elemento.
    if @tamano == @capacidad
      puts "Cola llena!"
      return false
    end
    
    @items[@rear_idx] = item
    @rear_idx = (@rear_idx + 1) % @capacidad
    @tamano += 1
    true
  end
  
  def dequeue
    # Quita un elemento.
    return nil if esta_vacia?
    
    item = @items[@front_idx]
    @items[@front_idx] = nil
    @front_idx = (@front_idx + 1) % @capacidad
    @tamano -= 1
    item
  end
  
  def front
    # Retorna el primer elemento.
    return nil if esta_vacia?
    @items[@front_idx]
  end
  
  def esta_vacia?
    @tamano == 0
  end
  
  def esta_llena?
    @tamano == @capacidad
  end
end

# 💡 DEQUE (Double-Ended Queue)

class Deque
  # Deque (Cola de doble extremo).
  # Permite agregar/quitar tanto al inicio como al final.
  def initialize
    @items = []
  end
  
  def agregar_adelante(item)
    # Agrega al inicio.
    @items.unshift(item)
  end
  
  def agregar_atras(item)
    # Agrega al final.
    @items << item
  end
  
  def quitar_adelante
    # Quita del inicio.
    return nil if esta_vacia?
    @items.shift
  end
  
  def quitar_atras
    # Quita del final.
    return nil if esta_vacia?
    @items.pop
  end
  
  def ver_adelante
    # Ve el primer elemento.
    return nil if esta_vacia?
    @items[0]
  end
  
  def ver_atras
    # Ve el último elemento.
    return nil if esta_vacia?
    @items[-1]
  end
  
  def esta_vacia?
    @items.empty?
  end
  
  def tamano
    @items.length
  end
end

puts "\n" + "=" * 60
puts "EJEMPLO 2: Deque (Cola de doble extremo)"
puts "=" * 60
deque = Deque.new
deque.agregar_atras(1)
deque.agregar_atras(2)
deque.agregar_adelante(0)
puts "Deque: #{deque.instance_variable_get(:@items)}"
puts "Primero: #{deque.ver_adelante}, Último: #{deque.ver_atras}"

# 🎯 APLICACIONES PRÁCTICAS

def generar_numeros_binarios(n)
  # Genera los primeros n números binarios usando una cola.
  # Ejemplo: n=5 → ["1", "10", "11", "100", "101"]
  cola = Queue.new
  resultado = []
  
  cola.enqueue("1")
  
  n.times do
    numero = cola.dequeue
    resultado << numero
    
    cola.enqueue(numero + "0")
    cola.enqueue(numero + "1")
  end
  
  resultado
end

puts "\n" + "=" * 60
puts "EJEMPLO 3: Generar números binarios"
puts "=" * 60
binarios = generar_numeros_binarios(5)
puts "Primeros 5 números binarios: #{binarios}"

# 💡 PRIORITY QUEUE

class PriorityQueue
  # Cola de prioridad (elemento con mayor prioridad sale primero).
  def initialize
    @items = []
  end
  
  def enqueue(item, prioridad)
    # Agrega un elemento con su prioridad.
    @items << [prioridad, item]
    @items.sort_by! { |p, _| -p }  # Mayor prioridad primero
  end
  
  def dequeue
    # Quita el elemento con mayor prioridad.
    return nil if esta_vacia?
    @items.shift[1]
  end
  
  def esta_vacia?
    @items.empty?
  end
  
  def mostrar
    # Muestra la cola ordenada por prioridad.
    @items.each do |prioridad, item|
      puts "Prioridad #{prioridad}: #{item}"
    end
  end
end

puts "\n" + "=" * 60
puts "EJEMPLO 4: Priority Queue"
puts "=" * 60
pq = PriorityQueue.new
pq.enqueue("Tarea baja", 1)
pq.enqueue("Tarea alta", 5)
pq.enqueue("Tarea media", 3)
puts "Cola de prioridad (mayor primero):"
pq.mostrar

puts "\nProcesando tareas:"
while !pq.esta_vacia?
  puts "  Procesando: #{pq.dequeue}"
end

# 💡 CARACTERÍSTICAS

puts "\n" + "=" * 60
puts "💡 CARACTERÍSTICAS DE QUEUES"
puts "=" * 60
puts """
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
"""

puts "\n" + "=" * 60
puts "🏋️  EJERCICIOS"
puts "=" * 60
puts """
1. Implementa una cola usando dos pilas (stack)

2. Crea una función que invierta una cola usando recursión

3. Implementa una cola que tenga una función max() que retorne
   el elemento máximo en O(1)

4. Crea un sistema de tickets donde cada ticket tiene un número
   y se atienden en orden (simula una cola real)

💡 Las colas son esenciales para algoritmos de grafos como BFS!
"""

