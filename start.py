import os
import pty
import select
import subprocess


def start_tilt_session():
    master, slave = pty.openpty()

    process = subprocess.Popen(
        ["tilt", "up"], stdin=slave, stdout=slave, stderr=slave, close_fds=True
    )

    try:
        while True:
            r, w, e = select.select([master], [], [])
            if master in r:
                output = os.read(master, 1024).decode()
                if output:
                    print(output, end="")
                else:
                    break
    except KeyboardInterrupt:
        process.terminate()
    finally:
        os.close(master)
        os.close(slave)


if __name__ == "__main__":
    start_tilt_session()
