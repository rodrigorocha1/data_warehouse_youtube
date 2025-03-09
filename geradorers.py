import sys

lista = [n for n in range(100000)]
generator = (n for n in range(100000))
print(sys.getsizeof(generator))
print(sys.getsizeof(lista))
