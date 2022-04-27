import hashlib


# Encrypt string password to md5
def hash_password(password):
    return hashlib.md5(password.encode('utf-8')).hexdigest()