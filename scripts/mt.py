import array
import math as m
from functools import cmp_to_key

ratios = []
numerators = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
denominators = numerators
ratios = []

def has_common_prime(a, b):
    if a == b: return True
    for i in range(2, min(a, b)):
        print(a, b, i)
        #if i * i > max(a, b): return False
        #if i * i > b: return False
        if a % i == 0 and b % i == 0:
            print("yep") 
            return True
    return False

assert(has_common_prime(20, 15))


for i in range(1, 12):
    for j in range(1, 12):
        if i < j: continue
        if has_common_prime(i, j): continue
        if i / j <= 0.5: continue
        if i / j >= 2.0: continue
        ratios.append([i, j])


def ratio_cmp(a, b):
    return a[0] / a[1] - b[0] / b[1]

ratios = sorted(ratios, key=cmp_to_key(ratio_cmp))

for i in range(7, 32):
    for r in ratios:
        print(f"[{i}]: {m.log2(r[0]/r[1])*i:.2f} \t {r[0]}/{r[1]}")
        #print("{:.2f}".format(m.log2(r[0]/r[1])*i), " \t ", r[0], "/", r[1])
