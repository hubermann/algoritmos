# Hashing y Hash Tables
#
# Un hash table (tabla hash) es una estructura de datos que permite
# acceso rápido a los datos usando una función hash.
#
# Es como un diccionario: puedes buscar una "palabra" (clave) y obtener
# su "definición" (valor) muy rápido.

class HashTable
  # Implementación simple de tabla hash.
  attr_accessor :capacidad, :buckets, :tamano
  
  def initialize(capacidad = 10)
    @capacidad = capacidad
    @buckets = Array.new(capacidad) { [] }  # Array de arrays
    @tamano = 0
  end
  
  def _hash(clave)
    # Función hash simple (usa el módulo).
    clave.hash % @capacidad
  end
  
  def insertar(clave, valor)
    # Inserta o actualiza un par clave-valor.
    indice = _hash(clave)
    bucket = @buckets[indice]
    
    # Buscar si la clave ya existe
    bucket.each_with_index do |(k, v), i|
      if k == clave
        bucket[i] = [clave, valor]  # Actualizar
        return
      end
    end
    
    # Si no existe, agregar nuevo
    bucket << [clave, valor]
    @tamano += 1
  end
  
  def obtener(clave)
    # Obtiene el valor asociado a una clave.
    indice = _hash(clave)
    bucket = @buckets[indice]
    
    bucket.each do |k, v|
      return v if k == clave
    end
    
    nil  # No encontrado
  end
  
  def eliminar(clave)
    # Elimina un par clave-valor.
    indice = _hash(clave)
    bucket = @buckets[indice]
    
    bucket.each_with_index do |(k, v), i|
      if k == clave
        bucket.delete_at(i)
        @tamano -= 1
        return true
      end
    end
    
    false
  end
  
  def mostrar
    # Muestra todos los elementos.
    @buckets.each_with_index do |bucket, i|
      puts "Bucket #{i}: #{bucket}" unless bucket.empty?
    end
  end
end

# 🎯 EJEMPLOS

puts "=" * 60
puts "EJEMPLO: Hash Table"
puts "=" * 60

ht = HashTable.new(5)

ht.insertar("nombre", "Juan")
ht.insertar("edad", 25)
ht.insertar("ciudad", "Madrid")
ht.insertar("profesion", "Ingeniero")

puts "\nTabla hash:"
ht.mostrar

puts "\nObtener 'nombre': #{ht.obtener('nombre')}"
puts "Obtener 'edad': #{ht.obtener('edad')}"

puts "\nEliminando 'ciudad':"
ht.eliminar("ciudad")
ht.mostrar

# 🎯 FUNCIONES HASH

def hash_string_simple(texto, capacidad)
  # Función hash simple para strings.
  hash_valor = 0
  texto.each_char { |char| hash_valor += char.ord }
  hash_valor % capacidad
end

def hash_string_mejorado(texto, capacidad)
  # Función hash mejorada (usando multiplicación).
  hash_valor = 0
  texto.each_char do |char|
    hash_valor = (hash_valor * 31 + char.ord) % capacidad
  end
  hash_valor
end

puts "\n" + "=" * 60
puts "EJEMPLO: Funciones Hash"
puts "=" * 60

palabras = ["hola", "mundo", "ruby", "algoritmo"]
puts "\nValores hash (capacidad=10):"
palabras.each do |palabra|
  hash1 = hash_string_simple(palabra, 10)
  hash2 = hash_string_mejorado(palabra, 10)
  puts "'#{palabra}': simple=#{hash1}, mejorado=#{hash2}"
end

puts "\n" + "=" * 60
puts "💡 HASHING"
puts "=" * 60
puts """
🔑 FUNCIÓN HASH:
   - Convierte una clave en un índice de la tabla
   - Debe ser determinística (misma clave → mismo hash)
   - Idealmente: distribución uniforme

✅ VENTAJAS:
   - Acceso muy rápido: O(1) promedio
   - Insertar/eliminar: O(1) promedio

❌ DESVENTAJAS:
   - Colisiones: dos claves con mismo hash
   - Peor caso: O(n) si muchas colisiones
   - No mantiene orden

📊 RESOLUCIÓN DE COLISIONES:
   1. Chaining: lista en cada bucket
   2. Open Addressing: buscar siguiente espacio libre

🎯 APLICACIONES:
   - Diccionarios/Mapas
   - Caché
   - Bases de datos
   - Verificación de integridad (checksums)
"""

