import os

def ArduinoPortDiscovery():
    arduino_ports = []
    for port_symlink in os.listdir('/dev/serial/by-id/'):
        # Look for symlinks related to Arduino devices (e.g., containing "Arduino")
        if "Arduino" in port_symlink:
            # Resolve the symlink to get the actual device path (e.g., /dev/ttyACM0)
            actual_port_path = os.path.realpath(os.path.join('/dev/serial/by-id/', port_symlink))
            arduino_ports.append(actual_port_path)

    return arduino_ports;

if __name__ == "__main__":
    print(f"Adruno ports discoverted ",ArduinoPortDiscovery());
