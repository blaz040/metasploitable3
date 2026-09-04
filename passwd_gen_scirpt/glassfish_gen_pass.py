import hashlib, base64, os
 
def generate_ssha256(password: str) -> str:
    salt = b"12345678"
    digest = hashlib.sha256(salt + password.encode()).digest()
    encoded = base64.b64encode(salt + digest).decode()
    return f"{{SSHA256}}{encoded}"
 
def verify_ssha256(password: str, stored: str) -> bool:
    # strip the {SSHA256} prefix
    b64_part = stored.replace("{SSHA256}", "")
    raw = base64.b64decode(b64_part)
    salt, digest = raw[:8], raw[8:]
    candidate = hashlib.sha256(salt + password.encode()).digest()
    return candidate == digest
 
# --- test ---
test_password = "ch0col4t3_fl@vor_with_van!lla"
user = "cupcake"
hashed = generate_ssha256(test_password)
print(f"Generated: cupcake;{hashed};asadmin")
 
# correct password should verify
print("Correct password verifies:", verify_ssha256(test_password, hashed))
 
# wrong password should fail
print("Wrong password verifies:  ", verify_ssha256("WrongPass", hashed))
 
