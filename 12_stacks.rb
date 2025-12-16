# Stacks (Pilas) - LIFO (Last In First Out)
#
# Una pila es como una pila de platos: el último que pones
# es el primero que sacas (LIFO - Last In First Out).
#
# Operaciones principales:
# - push: agregar elemento (poner en la pila)
# - pop: quitar elemento (sacar de la pila)
# - peek/top: ver el elemento superior sin quitarlo
# - isEmpty: verificar si está vacía

class Stack
  # Implementación de pila usando array de Ruby.
  def initialize
    @items = []
  end
  
  def push(item)
    # Agrega un elemento a la pila.
    @items << item
  end
  
  def pop
    # Quita y retorna el elemento superior.
    return nil if esta_vacia?
    @items.pop
  end
  
  def peek
    # Muestra el elemento superior sin quitarlo.
    return nil if esta_vacia?
    @items[-1]
  end
  
  def esta_vacia?
    # Verifica si la pila está vacía.
    @items.empty?
  end
  
  def tamano
    # Retorna el tamaño de la pila.
    @items.length
  end
  
  def mostrar
    # Muestra la pila (último arriba).
    if esta_vacia?
      puts "Pila vacía"
      return
    end
    
    puts "Pila (arriba = último):"
    (@items.length - 1).downto(0) do |i|
      puts "  [#{@items[i]}]"
    end
  end
end

# 🎯 EJEMPLOS DE USO

puts "=" * 60
puts "EJEMPLO 1: Operaciones básicas"
puts "=" * 60
pila = Stack.new
puts "Agregando elementos:"
pila.push(1)
pila.push(2)
pila.push(3)
pila.mostrar

puts "\nElemento superior (peek): #{pila.peek}"
puts "Tamaño: #{pila.tamano}"

puts "\nQuitando elementos:"
puts "Pop: #{pila.pop}"
puts "Pop: #{pila.pop}"
pila.mostrar

# 🎯 APLICACIONES PRÁCTICAS

def verificar_parentesis(expresion)
  # Verifica si los paréntesis están balanceados usando una pila.
  # Ejemplo: "((()))" está balanceado, "(()" no lo está.
  pila = Stack.new
  
  expresion.each_char do |char|
    if char == '('
      pila.push(char)
    elsif char == ')'
      return false if pila.esta_vacia?
      pila.pop
    end
  end
  
  pila.esta_vacia?
end

def invertir_string_con_pila(texto)
  # Invierte un string usando una pila.
  pila = Stack.new
  
  # Agregar cada carácter a la pila
  texto.each_char { |char| pila.push(char) }
  
  # Sacar todos los caracteres (saldrán en orden inverso)
  resultado = ""
  while !pila.esta_vacia?
    resultado += pila.pop
  end
  
  resultado
end

def evaluar_expresion_postfija(expresion)
  # Evalúa una expresión en notación postfija (RPN).
  # Ejemplo: "3 4 + 2 *" = (3+4)*2 = 14
  pila = Stack.new
  tokens = expresion.split
  
  tokens.each do |token|
    if token.match?(/^\d+$/)
      pila.push(token.to_i)
    else
      # Es un operador
      b = pila.pop
      a = pila.pop
      
      case token
      when '+'
        pila.push(a + b)
      when '-'
        pila.push(a - b)
      when '*'
        pila.push(a * b)
      when '/'
        pila.push(a / b)
      end
    end
  end
  
  pila.pop
end

puts "\n" + "=" * 60
puts "EJEMPLO 2: Verificar paréntesis balanceados"
puts "=" * 60
expresiones = ["((()))", "(()", "()()", "((())"]
expresiones.each do |expr|
  resultado = verificar_parentesis(expr)
  puts "'#{expr}' está balanceado: #{resultado}"
end

puts "\n" + "=" * 60
puts "EJEMPLO 3: Invertir string con pila"
puts "=" * 60
texto = "Ruby"
invertido = invertir_string_con_pila(texto)
puts "'#{texto}' invertido: '#{invertido}'"

puts "\n" + "=" * 60
puts "EJEMPLO 4: Evaluar expresión postfija"
puts "=" * 60
expresiones_post = ["3 4 +", "3 4 + 2 *", "5 1 2 + 4 * + 3 -"]
expresiones_post.each do |expr|
  resultado = evaluar_expresion_postfija(expr)
  puts "'#{expr}' = #{resultado}"
end

# 💡 IMPLEMENTACIÓN CON LINKED LIST

class StackNode
  # Nodo para pila implementada con linked list.
  attr_accessor :dato, :siguiente
  
  def initialize(dato)
    @dato = dato
    @siguiente = nil
  end
end

class StackLinkedList
  # Pila implementada con lista enlazada.
  attr_accessor :top, :tamano
  
  def initialize
    @top = nil
    @tamano = 0
  end
  
  def push(item)
    nuevo_nodo = StackNode.new(item)
    nuevo_nodo.siguiente = @top
    @top = nuevo_nodo
    @tamano += 1
  end
  
  def pop
    return nil if esta_vacia?
    
    dato = @top.dato
    @top = @top.siguiente
    @tamano -= 1
    dato
  end
  
  def peek
    return nil if esta_vacia?
    @top.dato
  end
  
  def esta_vacia?
    @top.nil?
  end
end

puts "\n" + "=" * 60
puts "EJEMPLO 5: Stack con Linked List"
puts "=" * 60
pila_ll = StackLinkedList.new
pila_ll.push(10)
pila_ll.push(20)
pila_ll.push(30)
puts "Top: #{pila_ll.peek}"
puts "Pop: #{pila_ll.pop}"
puts "Top después del pop: #{pila_ll.peek}"

# 💡 CARACTERÍSTICAS

puts "\n" + "=" * 60
puts "💡 CARACTERÍSTICAS DE STACKS"
puts "=" * 60
puts """
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
"""

puts "\n" + "=" * 60
puts "🏋️  EJERCICIOS"
puts "=" * 60
puts """
1. Implementa una función que verifique si múltiples tipos de
   paréntesis están balanceados: (), [], {}

2. Crea una función que convierta expresión infija a postfija
   Ejemplo: "3 + 4" → "3 4 +"

3. Implementa una función que encuentre el siguiente elemento
   mayor a la derecha para cada elemento de un array usando stack

4. Crea una pila que además tenga una función min() que retorne
   el elemento mínimo en O(1)

💡 Las pilas son fundamentales para muchos algoritmos!
"""

