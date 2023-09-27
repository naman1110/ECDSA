# Elliptic Curve Cryptography
# ![simple_elliptic_curve](https://github.com/naman1110/ECDSA/assets/86222625/f21426d3-7074-4a78-9aed-e3c0eee22032)

Elliptic curve cryptography (ECC) is based on the algebraic structure of elliptic curves over finite fields.

Elliptic curves have a specific mathematical shape and cryptographic properties that allow deriving a public/private key pair from a random number.

The private key is a randomly generated number. The public key is a point on the curve derived from the private key.

ECC can achieve the same level of security as RSA or Diffie-Hellman with much smaller key sizes. This results in faster computation, lower processing power needs, less storage, and bandwidth savings.
# <img width="1380" alt="Screenshot 2023-09-28 at 1 18 46 AM" src="https://github.com/naman1110/ECDSA/assets/86222625/d3e77107-5a1d-43e8-8628-08225090a62d">

# ECDSA Signatures
ECDSA (Elliptic Curve Digital Signature Algorithm) leverages ECC to generate digital signatures.
ECDSA is a cryptographic scheme used in Ethereum to generate signatures and verify signed messages.
To sign a message:

The message is hashed using a cryptographic hash algorithm like Keccak256.
The hash and private key are used to generate two values, r and s, based on elliptic curve math.
A recovery ID (v) is calculated from the signature and private key.
The (r, s, v) triplet comprises the ECDSA signature.
# Signature Parameters
# r

Part of the digital signature generated from a deterministic process using the private key and message hash.
It is a randomly generated 32-byte value for each signature.
Unpredictable and unique each time. Protects against forgery.
# s

The second 32-byte component of the signature, also derived from the private key and hash.
Like r, it is randomly generated per signature.
# v

1-byte recovery ID containing information about the specific elliptic curve equation used.
Allows reconstructing the public key from the signature.
Value is either 27 or 28 for current Ethereum signatures.
Together, (r, s, v) form a valid ECDSA signature over an elliptic curve cryptosystem.
