from pypsexec.client import Client
import time

c = Client("192.168.121.217", username="vagrant", password="vagrant", encrypt=False)

c.connect()
c.create_service()
try:
    # Write to the file
    stdout, stderr, rc = c.run_executable("cmd.exe", arguments="/c echo Kurwa > C:\\kingofthehill.txt")
    print("Write STDOUT:", stdout.decode())
    print("Write STDERR:", stderr.decode())
    print("Return code:", rc)

    # Read it back immediately to verify
    stdout_read, stderr_read, rc_read = c.run_executable("cmd.exe", arguments="/c type C:\\kingofthehill.txt")
    print("Read STDOUT:", stdout_read.decode())
finally:
    time.sleep(2)  # give the remote SCM time to release the file handle
    c.remove_service()
    c.disconnect()