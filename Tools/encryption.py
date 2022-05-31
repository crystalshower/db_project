import hashlib


# Encrypt string password to md5
def hash_password(password):
    """
    Encrypt string password to md5
    :param password: string
    :return: string
    """
    return hashlib.md5(password.encode('utf-8')).hexdigest()
