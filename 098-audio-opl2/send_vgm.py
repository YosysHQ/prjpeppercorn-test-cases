import serial
import time
import sys

def send_vgm_to_fpga(vgm_file_path, serial_port, baud_rate=115200):
    with serial.Serial(serial_port, baud_rate, timeout=1) as ser:
        with open(vgm_file_path, 'rb') as vgm_file:
            data = vgm_file.read()
            offset = int.from_bytes(data[0x34:0x38], 'little') + 0x34
            pointer = offset

            while pointer < len(data):
                cmd = data[pointer]
                pointer += 1

                if cmd == 0x5A:  # YM3812 write
                    reg = data[pointer]
                    val = data[pointer + 1]
                    pointer += 2
                    ser.write(bytes([reg, val]))
                elif cmd == 0x61:  # Wait n samples
                    wait = int.from_bytes(data[pointer:pointer+2], 'little')
                    pointer += 2
                    time.sleep(wait / 44100.0)
                elif cmd == 0x62:  # Wait 735 samples
                    time.sleep(735 / 44100.0)
                elif cmd == 0x63:  # Wait 882 samples
                    time.sleep(882 / 44100.0)
                elif cmd == 0x66:  # End of sound data
                    break
                else:
                    # Handle other commands or skip
                    pass


# Example usage
if len(sys.argv) != 3:
    print("send_vgm - To send VGM files to a player")
    print("use: python3 send_vgm.py <filename> <serial_device>")
    sys.exit(-1)

send_vgm_to_fpga(sys.argv[1], sys.argv[2])
