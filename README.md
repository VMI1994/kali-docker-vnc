# Kali Linux Docker VNC

A simple Kali Linux instance running in a Docker container, accessible via VNC desktop sharing.

![1](https://github.com/VMI1994/kali-docker-vnc/blob/main/kali.gif)

## 🚀 Overview

This project provides a pre-configured Kali Linux desktop environment packaged in a Docker container. The container includes:
- Kali Linux Desktop (XFCE) with full desktop environment
- Custom tools for cyber security and offensive security research
- VNC server for remote desktop access
- Pre-configured user access with password setup wizard

## 📦 Components

### Dockerfile
Creates a Kali Linux rolling image with:
- Base OS: kalilinux/kali-rolling:latest
- Kali Desktop XFCE installed
- Cyber security tools: Armitage, Btcpoof, Ethereal
- Network reconnaissance: Armitage, Inetutils-ping, htop, btop
- Utilities: nano, kali-tweaks, sudo, armitage, figlet
- Auto-cleanup of package cache to reduce image size

### Scripts

#### setup.sh
Initial setup script that:
1. Builds the Docker image (2-14 minutes on first run)
2. Launches the container with VNC port mapping
3. Mounts save directory for persistence

#### start.sh
Starts the container with:
- `-v ./save:/save` - Persistent storage volume
- `-p 5901:5901` - VNC port mapping to localhost
- `--cap-add=NET_ADMIN` - Network administration capability for Armitage

#### entrypoint.sh
Runs on container startup:
1. Creates 'kali' user with sudo privileges
2. Prompts user to set VNC password
3. Starts vncserver for the kali user
4. Drops to bash shell for kali user

## 🏁 Quick Start

### Build and Run

```bash
# Ensure Docker is installed
curl -fsSL https://get.docker.com -o get-docker.sh
bash get-docker.sh
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER

# Clone the repo and run setup
git clone https://github.com/VMI1994/kali-docker-vnc && cd kali-docker-vnc && bash setup.sh
```

### Access the VNC Desktop

1. Open your VNC client
2. Connect to: `127.0.0.1:5901`
3. Use the password you set during container startup

## 🔑 Password Setup

The first time you start the container, you'll be prompted:

1. **SUDO PASSWORD**: Set the sudo password for user `kali`
2. **VNC PASSWORD**: Set the VNC display password

Enter these values at the prompts, then connect your VNC client to `127.0.0.1:5901`.

## 🛠️ Features

### Included Tools

- **Armitage**: Network reconnaissance and exploitation framework
- **Ethereal**: Packet capture and analysis (now known as Wireshark)
- **btcpoof**: Personal data wipe tool
- **htop/btop**: System monitoring with GUI
- **kali-tweaks**: System customization tool
- **nano**: Text editor

### Security & Privacy

- Minimal image footprint with package cleanup
- User isolation via Docker container
- Full desktop environment for security research
- Network administration capabilities enabled

## 📂 Directory Structure

```
kali-docker-vnc/
├── Dockerfile          # Container image definition
├── entrypoint.sh       # Container startup script
├── setup.sh            # Build and launch script
├── start.sh            # Run container script
└── save/               # Persistent storage (created on first run)
```

## 🔧 Configuration

### Persistent Storage

The `./save` directory is automatically created when running the container. This is where:
- VNC desktop files are stored
- User-created configurations live
- Any saved work persists

### VNC Settings

- Default display: `:1` (port 5901)
- X11 forwarding is enabled by default

## ⚠️ Important Notes

1. **Security**: This container uses `--rm` by default, but we override with `-v ./save:/save` for persistence
2. **Network**: The `NET_ADMIN` capability is required for Armitage to function properly
3. **Cleanup**: Package cache is cleaned after installation to minimize image size
4. **First Run**: The initial build takes 9-10 minutes due to Kali Linux image downloads
5. **LAN**: Docker will not let you contact other devies on your LAN but can connect to the router and outside your LAN
   
## 🤝 Contributing

This project is hosted at: https://github.com/VMI1994/kali-docker-vnc.git

Feel free to fork, modify, and share improvements!

## 📄 License

MIT License - feel free to use for educational and security research purposes.

## 📝 Author

Created by VMI1994

---

**Last Updated**: May 2026
**Version**: 1.0
