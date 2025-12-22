"""
Algoritmos con Strings (Cadenas de Texto)

Los strings son secuencias de caracteres. Son fundamentales
para muchos problemas de programación y tienen algoritmos propios.
"""


def operaciones_strings_basicas():
    """Operaciones básicas con strings."""
    print("=" * 60)
    print("OPERACIONES BÁSICAS CON STRINGS")
    print("=" * 60)
    
    texto = "Hola Mundo"
    print(f"\nString original: '{texto}'")
    
    # Longitud
    print(f"1. Longitud: {len(texto)}")
    
    # Acceder a caracteres
    print(f"2. Primer carácter: '{texto[0]}'")
    print(f"   Último carácter: '{texto[-1]}'")
    
    # Slicing
    print(f"3. Primeros 4 caracteres: '{texto[:4]}'")
    print(f"   Desde índice 5: '{texto[5:]}'")
    
    # Buscar substring
    posicion = texto.find("Mundo")
    print(f"4. 'Mundo' encontrado en posición: {posicion}")
    
    # Contar ocurrencias
    cantidad = texto.count("o")
    print(f"5. Cantidad de 'o': {cantidad}")
    
    # Reemplazar
    nuevo = texto.replace("Mundo", "Python")
    print(f"6. Reemplazar 'Mundo' por 'Python': '{nuevo}'")
    
    # Convertir a mayúsculas/minúsculas
    print(f"7. Mayúsculas: '{texto.upper()}'")
    print(f"   Minúsculas: '{texto.lower()}'")
    
    # Dividir en palabras
    palabras = texto.split()
    print(f"8. Dividir por espacios: {palabras}")


def invertir_string(texto):
    """Invierte un string."""
    resultado = ""
    for i in range(len(texto) - 1, -1, -1):
        resultado += texto[i]
    return resultado


def es_palindromo(texto):
    """
    Verifica si un string es palíndromo (se lee igual al derecho y al revés).
    Ejemplo: "oso", "reconocer", "ana"
    """
    texto_limpio = texto.lower().replace(" ", "")
    return texto_limpio == texto_limpio[::-1]


def contar_vocales(texto):
    """Cuenta las vocales en un string."""
    vocales = "aeiouAEIOU"
    contador = 0
    for char in texto:
        if char in vocales:
            contador += 1
    return contador


def encontrar_substring(texto, patron):
    """
    Busca un patrón en un texto (búsqueda de substring).
    Retorna todas las posiciones donde aparece.
    """
    posiciones = []
    len_patron = len(patron)
    
    for i in range(len(texto) - len_patron + 1):
        if texto[i:i + len_patron] == patron:
            posiciones.append(i)
    
    return posiciones


def buscar_substring_naive(texto, patron, mostrar_pasos=False):
    """
    Algoritmo naive (simple) para buscar un patrón en un texto.
    Compara el patrón en cada posición posible.
    """
    posiciones = []
    n = len(texto)
    m = len(patron)
    
    if mostrar_pasos:
        print(f"Buscando '{patron}' en '{texto}'")
        print(f"Longitud texto: {n}, Longitud patrón: {m}\n")
    
    for i in range(n - m + 1):
        if mostrar_pasos:
            print(f"Posición {i}: Comparando '{texto[i:i+m]}' con '{patron}'", end="")
        
        match = True
        for j in range(m):
            if texto[i + j] != patron[j]:
                match = False
                break
        
        if match:
            posiciones.append(i)
            if mostrar_pasos:
                print(" ✅ Coincide!")
        else:
            if mostrar_pasos:
                print(" ❌ No coincide")
    
    return posiciones


def anagrama(str1, str2):
    """
    Verifica si dos strings son anagramas (tienen las mismas letras).
    Ejemplo: "listen" y "silent" son anagramas
    """
    # Eliminar espacios y convertir a minúsculas
    s1 = str1.lower().replace(" ", "")
    s2 = str2.lower().replace(" ", "")
    
    # Si tienen diferente longitud, no pueden ser anagramas
    if len(s1) != len(s2):
        return False
    
    # Ordenar y comparar
    return sorted(s1) == sorted(s2)


def primera_letra_no_repetida(texto):
    """
    Encuentra la primera letra que no se repite en el string.
    """
    contador = {}
    
    # Contar ocurrencias de cada carácter
    for char in texto:
        contador[char] = contador.get(char, 0) + 1
    
    # Encontrar el primero que aparece solo una vez
    for char in texto:
        if contador[char] == 1:
            return char
    
    return None


def comprimir_string(texto):
    """
    Comprime un string reemplazando caracteres repetidos.
    Ejemplo: "aaabbbccc" → "a3b3c3"
    """
    if not texto:
        return ""
    
    resultado = ""
    contador = 1
    
    for i in range(1, len(texto)):
        if texto[i] == texto[i - 1]:
            contador += 1
        else:
            resultado += texto[i - 1] + str(contador)
            contador = 1
    
    # Agregar el último grupo
    resultado += texto[-1] + str(contador)
    
    return resultado


# 🎯 EJEMPLOS DE USO

if __name__ == "__main__":
    operaciones_strings_basicas()
    
    print("\n" + "=" * 60)
    print("EJEMPLO 1: Invertir String")
    print("=" * 60)
    texto1 = "Python"
    print(f"'{texto1}' invertido: '{invertir_string(texto1)}'")
    
    print("\n" + "=" * 60)
    print("EJEMPLO 2: Palíndromo")
    print("=" * 60)
    palabras = ["oso", "reconocer", "hola", "ana"]
    for palabra in palabras:
        resultado = es_palindromo(palabra)
        print(f"'{palabra}' es palíndromo: {resultado}")
    
    print("\n" + "=" * 60)
    print("EJEMPLO 3: Contar Vocales")
    print("=" * 60)
    texto2 = "Algoritmos y Estructuras de Datos"
    print(f"Texto: '{texto2}'")
    print(f"Vocales: {contar_vocales(texto2)}")
    
    print("\n" + "=" * 60)
    print("EJEMPLO 4: Buscar Substring (Naive)")
    print("=" * 60)
    texto3 = "ababcababcabc"
    patron = "abc"
    posiciones = buscar_substring_naive(texto3, patron, mostrar_pasos=True)
    print(f"\nPatrón '{patron}' encontrado en posiciones: {posiciones}")
    
    print("\n" + "=" * 60)
    print("EJEMPLO 5: Anagrama")
    print("=" * 60)
    pares = [("listen", "silent"), ("hello", "world"), ("evil", "vile")]
    for str1, str2 in pares:
        resultado = anagrama(str1, str2)
        print(f"'{str1}' y '{str2}' son anagramas: {resultado}")
    
    print("\n" + "=" * 60)
    print("EJEMPLO 6: Primera Letra No Repetida")
    print("=" * 60)
    textos = ["programming", "algorithm", "aabbcc"]
    for texto in textos:
        resultado = primera_letra_no_repetida(texto)
        print(f"En '{texto}': '{resultado}'")
    
    print("\n" + "=" * 60)
    print("EJEMPLO 7: Comprimir String")
    print("=" * 60)
    textos_comp = ["aaabbbccc", "aabbcc", "abcd"]
    for texto in textos_comp:
        comprimido = comprimir_string(texto)
        print(f"'{texto}' → '{comprimido}'")
    
    # 💡 CARACTERÍSTICAS
    print("\n" + "=" * 60)
    print("💡 ALGORITMOS CON STRINGS")
    print("=" * 60)
    print("""
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
    """)
    
    print("\n" + "=" * 60)
    print("🏋️  EJERCICIOS")
    print("=" * 60)
    print("""
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
    """)






