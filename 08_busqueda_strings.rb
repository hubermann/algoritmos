# Búsqueda en Strings
#
# Algoritmos para buscar patrones dentro de textos.
# Fundamentales para procesamiento de texto.

def busqueda_naive(texto, patron)
  # Búsqueda simple: compara el patrón en cada posición.
  # Complejidad: O(n * m) donde n=texto, m=patrón
  n = texto.length
  m = patron.length
  posiciones = []
  
  (0..n - m).each do |i|
    if texto[i, m] == patron
      posiciones << i
    end
  end
  
  posiciones
end

# Más detalle en 10_strings_algoritmos.rb
# Este archivo es complementario

puts "Para más algoritmos de strings, ver: 10_strings_algoritmos.rb"

