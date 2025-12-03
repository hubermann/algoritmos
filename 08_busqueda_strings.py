"""
Búsqueda en Strings

Algoritmos para buscar patrones dentro de textos.
Fundamentales para procesamiento de texto.
"""


def busqueda_naive(texto, patron):
    """
    Búsqueda simple: compara el patrón en cada posición.
    Complejidad: O(n * m) donde n=texto, m=patrón
    """
    n = len(texto)
    m = len(patron)
    posiciones = []
    
    for i in range(n - m + 1):
        if texto[i:i + m] == patron:
            posiciones.append(i)
    
    return posiciones


# Más detalle en 10_strings_algoritmos.py
# Este archivo es complementario

print("Para más algoritmos de strings, ver: 10_strings_algoritmos.py")

