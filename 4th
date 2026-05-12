import math
# Step 1: Choose primes
p = 3
q = 7
# Step 2: Compute n
n = p * q
print("n =", n)
# Step 3: Compute phi
phi = (p - 1) * (q - 1)
# Step 4: Choose e
e = 2
while e < phi:
if math.gcd(e, phi) == 1:
break
e += 1
print("e =", e)
# Step 5: Compute d using modular inverse
# (d*e) % phi = 1 => d = modinv(e, phi)
def modinv(a, m):
# Extended Euclidean Algorithm
m0, x0, x1 = m, 0, 1
if m == 1:
return 0
while a > 1:
q = a // m
a, m = m, a % m
x0, x1 = x1 - q * x0, x0
if x1 < 0:
x1 += m0
return x1
d = modinv(e, phi)
print("d =", d)
print(f'Public key: ({e}, {n})')
print(f'Private key: ({d}, {n})')
# Step 6: Encryption
msg = 11
print(f'Original message: {msg}')
C = pow(msg, e, n) # Encryption with modulo
print(f'Encrypted message: {C}')
# Step 7: Decryption
M = pow(C, d, n) # Decryption with modulo
print(f'Decrypted message: {M}')
