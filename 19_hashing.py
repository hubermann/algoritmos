"""
Hashing y Hash Tables

Un hash table (tabla hash) es una estructura de datos que permite
acceso rápido a los datos usando una función hash.

Es como un diccionario: puedes buscar una "palabra" (clave) y obtener
su "definición" (valor) muy rápido.
"""


class HashTable:
    """Implementación simple de tabla hash."""
    
    def __init__(self, capacidad=10):
        self.capacidad = capacidad
        self.buckets = [[] for _ in range(capacidad)]  # Lista de listas
        self.tamano = 0
    
    def _hash(self, clave):
        """Función hash simple (usa el módulo)."""
        return hash(clave) % self.capacidad
    
    def insertar(self, clave, valor):
        """Inserta o actualiza un par clave-valor."""
        indice = self._hash(clave)
        bucket = self.buckets[indice]
        
        # Buscar si la clave ya existe
        for i, (k, v) in enumerate(bucket):
            if k == clave:
                bucket[i] = (clave, valor)  # Actualizar
                return
        
        # Si no existe, agregar nuevo
        bucket.append((clave, valor))
        self.tamano += 1
    
    def obtener(self, clave):
        """Obtiene el valor asociado a una clave."""
        indice = self._hash(clave)
        bucket = self.buckets[indice]
        
        for k, v in bucket:
            if k == clave:
                return v
        
        return None  # No encontrado
    
    def eliminar(self, clave):
        """Elimina un par clave-valor."""
        indice = self._hash(clave)
        bucket = self.buckets[indice]
        
        for i, (k, v) in enumerate(bucket):
            if k == clave:
                del bucket[i]
                self.tamano -= 1
                return True
        
        return False
    
    def mostrar(self):
        """Muestra todos los elementos."""
        for i, bucket in enumerate(self.buckets):
            if bucket:
                print(f"Bucket {i}: {bucket}")


# 🎯 EJEMPLOS

print("=" * 60)
print("EJEMPLO: Hash Table")
print("=" * 60)

ht = HashTable(5)

ht.insertar("nombre", "Juan")
ht.insertar("edad", 25)
ht.insertar("ciudad", "Madrid")
ht.insertar("profesion", "Ingeniero")

print("\nTabla hash:")
ht.mostrar()

print(f"\nObtener 'nombre': {ht.obtener('nombre')}")
print(f"Obtener 'edad': {ht.obtener('edad')}")

print("\nEliminando 'ciudad':")
ht.eliminar("ciudad")
ht.mostrar()


# 🎯 FUNCIONES HASH

def hash_string_simple(texto, capacidad):
    """Función hash simple para strings."""
    hash_valor = 0
    for char in texto:
        hash_valor += ord(char)
    return hash_valor % capacidad


def hash_string_mejorado(texto, capacidad):
    """Función hash mejorada (usando multiplicación)."""
    hash_valor = 0
    for char in texto:
        hash_valor = (hash_valor * 31 + ord(char)) % capacidad
    return hash_valor


print("\n" + "=" * 60)
print("EJEMPLO: Funciones Hash")
print("=" * 60)

palabras = ["hola", "mundo", "python", "algoritmo"]
print("\nValores hash (capacidad=10):")
for palabra in palabras:
    hash1 = hash_string_simple(palabra, 10)
    hash2 = hash_string_mejorado(palabra, 10)
    print(f"'{palabra}': simple={hash1}, mejorado={hash2}")


print("\n" + "=" * 60)
print("💡 HASHING")
print("=" * 60)
print("""
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
""")





