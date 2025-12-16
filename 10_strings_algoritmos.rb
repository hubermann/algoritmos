# Algoritmos con Strings (Cadenas de Texto)
#
# Los strings son secuencias de caracteres. Son fundamentales
# para muchos problemas de programación y tienen algoritmos propios.

def operaciones_strings_basicas
  # Operaciones básicas con strings.
  puts "=" * 60
  puts "OPERACIONES BÁSICAS CON STRINGS"
  puts "=" * 60
  
  texto = "Hola Mundo"
  puts "\nString original: '#{texto}'"
  
  # Longitud
  puts "1. Longitud: #{texto.length}"
  
  # Acceder a caracteres
  puts "2. Primer carácter: '#{texto[0]}'"
  puts "   Último carácter: '#{texto[-1]}'"
  
  # Slicing
  puts "3. Primeros 4 caracteres: '#{texto[0, 4]}'"
  puts "   Desde índice 5: '#{texto[5..-1]}'"
  
  # Buscar substring
  posicion = texto.index("Mundo")
  puts "4. 'Mundo' encontrado en posición: #{posicion}"
  
  # Contar ocurrencias
  cantidad = texto.count("o")
  puts "5. Cantidad de 'o': #{cantidad}"
  
  # Reemplazar
  nuevo = texto.gsub("Mundo", "Ruby")
  puts "6. Reemplazar 'Mundo' por 'Ruby': '#{nuevo}'"
  
  # Convertir a mayúsculas/minúsculas
  puts "7. Mayúsculas: '#{texto.upcase}'"
  puts "   Minúsculas: '#{texto.downcase}'"
  
  # Dividir en palabras
  palabras = texto.split
  puts "8. Dividir por espacios: #{palabras}"
end

def invertir_string(texto)
  # Invierte un string.
  resultado = ""
  (texto.length - 1).downto(0) do |i|
    resultado += texto[i]
  end
  resultado
end

def es_palindromo(texto)
  # Verifica si un string es palíndromo (se lee igual al derecho y al revés).
  # Ejemplo: "oso", "reconocer", "ana"
  texto_limpio = texto.downcase.gsub(" ", "")
  texto_limpio == texto_limpio.reverse
end

def contar_vocales(texto)
  # Cuenta las vocales en un string.
  vocales = "aeiouAEIOU"
  contador = 0
  texto.each_char do |char|
    contador += 1 if vocales.include?(char)
  end
  contador
end

def encontrar_substring(texto, patron)
  # Busca un patrón en un texto (búsqueda de substring).
  # Retorna todas las posiciones donde aparece.
  posiciones = []
  len_patron = patron.length
  
  (0..texto.length - len_patron).each do |i|
    if texto[i, len_patron] == patron
      posiciones << i
    end
  end
  
  posiciones
end

def buscar_substring_naive(texto, patron, mostrar_pasos = false)
  # Algoritmo naive (simple) para buscar un patrón en un texto.
  # Compara el patrón en cada posición posible.
  posiciones = []
  n = texto.length
  m = patron.length
  
  if mostrar_pasos
    puts "Buscando '#{patron}' en '#{texto}'"
    puts "Longitud texto: #{n}, Longitud patrón: #{m}\n"
  end
  
  (0..n - m).each do |i|
    if mostrar_pasos
      print "Posición #{i}: Comparando '#{texto[i, m]}' con '#{patron}'"
    end
    
    match = true
    (0...m).each do |j|
      if texto[i + j] != patron[j]
        match = false
        break
      end
    end
    
    if match
      posiciones << i
      if mostrar_pasos
        puts " ✅ Coincide!"
      end
    else
      if mostrar_pasos
        puts " ❌ No coincide"
      end
    end
  end
  
  posiciones
end

def anagrama(str1, str2)
  # Verifica si dos strings son anagramas (tienen las mismas letras).
  # Ejemplo: "listen" y "silent" son anagramas
  # Eliminar espacios y convertir a minúsculas
  s1 = str1.downcase.gsub(" ", "")
  s2 = str2.downcase.gsub(" ", "")
  
  # Si tienen diferente longitud, no pueden ser anagramas
  return false if s1.length != s2.length
  
  # Ordenar y comparar
  s1.chars.sort == s2.chars.sort
end

def primera_letra_no_repetida(texto)
  # Encuentra la primera letra que no se repite en el string.
  contador = {}
  
  # Contar ocurrencias de cada carácter
  texto.each_char do |char|
    contador[char] = (contador[char] || 0) + 1
  end
  
  # Encontrar el primero que aparece solo una vez
  texto.each_char do |char|
    return char if contador[char] == 1
  end
  
  nil
end

def comprimir_string(texto)
  # Comprime un string reemplazando caracteres repetidos.
  # Ejemplo: "aaabbbccc" → "a3b3c3"
  return "" if texto.empty?
  
  resultado = ""
  contador = 1
  
  (1...texto.length).each do |i|
    if texto[i] == texto[i - 1]
      contador += 1
    else
      resultado += texto[i - 1] + contador.to_s
      contador = 1
    end
  end
  
  # Agregar el último grupo
  resultado += texto[-1] + contador.to_s
  resultado
end

# 🎯 EJEMPLOS DE USO

if __FILE__ == $0
  operaciones_strings_basicas
  
  puts "\n" + "=" * 60
  puts "EJEMPLO 1: Invertir String"
  puts "=" * 60
  texto1 = "Ruby"
  puts "'#{texto1}' invertido: '#{invertir_string(texto1)}'"
  
  puts "\n" + "=" * 60
  puts "EJEMPLO 2: Palíndromo"
  puts "=" * 60
  palabras = ["oso", "reconocer", "hola", "ana"]
  palabras.each do |palabra|
    resultado = es_palindromo(palabra)
    puts "'#{palabra}' es palíndromo: #{resultado}"
  end
  
  puts "\n" + "=" * 60
  puts "EJEMPLO 3: Contar Vocales"
  puts "=" * 60
  texto2 = "Algoritmos y Estructuras de Datos"
  puts "Texto: '#{texto2}'"
  puts "Vocales: #{contar_vocales(texto2)}"
  
  puts "\n" + "=" * 60
  puts "EJEMPLO 4: Buscar Substring (Naive)"
  puts "=" * 60
  texto3 = "ababcababcabc"
  patron = "abc"
  posiciones = buscar_substring_naive(texto3, patron, true)
  puts "\nPatrón '#{patron}' encontrado en posiciones: #{posiciones}"
  
  puts "\n" + "=" * 60
  puts "EJEMPLO 5: Anagrama"
  puts "=" * 60
  pares = [["listen", "silent"], ["hello", "world"], ["evil", "vile"]]
  pares.each do |str1, str2|
    resultado = anagrama(str1, str2)
    puts "'#{str1}' y '#{str2}' son anagramas: #{resultado}"
  end
  
  puts "\n" + "=" * 60
  puts "EJEMPLO 6: Primera Letra No Repetida"
  puts "=" * 60
  textos = ["programming", "algorithm", "aabbcc"]
  textos.each do |texto|
    resultado = primera_letra_no_repetida(texto)
    puts "En '#{texto}': '#{resultado}'"
  end
  
  puts "\n" + "=" * 60
  puts "EJEMPLO 7: Comprimir String"
  puts "=" * 60
  textos_comp = ["aaabbbccc", "aabbcc", "abcd"]
  textos_comp.each do |texto|
    comprimido = comprimir_string(texto)
    puts "'#{texto}' → '#{comprimido}'"
  end
  
  # 💡 CARACTERÍSTICAS
  puts "\n" + "=" * 60
  puts "💡 ALGORITMOS CON STRINGS"
  puts "=" * 60
  puts """
📊 COMPLEJIDAD DE OPERACIONES COMUNES:
   - Acceder a carácter por índice: O(1)
   - Buscar substring (naive): O(n × m) donde n=texto, m=patrón
   - Comparar dos strings: O(min(n, m))
   - Concatenar: O(n + m) - crea nuevo string

🔍 ALGORITMOS AVANZADOS DE STRINGS:
   - KMP (Knuth-Morris-Pratt): búsqueda más eficiente
   - Rabin-Karp: usando hash
   - Longest Common Subsequence (LCS)
   - Edit Distance (Levenshtein)

🎯 PROBLEMAS COMUNES:
   - Búsqueda de patrones
   - Validación de formatos
   - Parsing y procesamiento de texto
   - Compresión de strings
    """
  
  puts "\n" + "=" * 60
  puts "🏋️  EJERCICIOS"
  puts "=" * 60
  puts """
1. Crea una función que valide si un string es un email válido

2. Implementa una función que cuente las palabras en un texto

3. Escribe una función que elimine duplicados de caracteres consecutivos
   Ejemplo: "aaabbbccc" → "abc"

4. Crea una función que verifique si dos strings son permutaciones
   (tienen los mismos caracteres pero en diferente orden)

5. Implementa una función que encuentre la subcadena más larga
   sin caracteres repetidos
   Ejemplo: "abcabcbb" → "abc" (longitud 3)

💡 Los strings son fundamentales en programación, practica mucho!
    """
end

