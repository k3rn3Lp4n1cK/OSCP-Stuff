#!/bin/bash


RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;35m'
NC='\033[0m'

if [ "$EUID" -ne 0 ]
    then echo -e "${RED}sudo make me a sandwich!${NC}"
    exit
fi

echo
echo -e "${BLUE}OSCP Kali - Setup Script${NC}"
apt update -y
apt upgrade -y
echo -e "${GREEN}[+] Update/Upgrade Complete${NC}"


######### PACKAGES ##########
echo
echo -e "${YELLOW}Packages${NC} Installing common packages"
apt install -y ltrace strace edb-debugger wireshark elfutils tldr steghide feroxbuster gobuster terminator gdb checksec default-jdk wireless-tools iw aircrack-ng responder openvpn gcc-multilib
echo -e "${GREEN}[+] Packages Complete${NC}"


######### TOOLS ##########
echo
echo -e "${YELLOW}Tools${NC} Setting up Tool Directories"
mkdir /tools
cp -r ./tools /
chown -R kali: /tools

echo
echo -e "${YELLOW}[+] Softlink Tools${NC} Creating Softlink to Tools bin directory"
ln -s /tools/bin /home/kali/bin
chown kali: /home/kali/bin
echo -e "${GREEN}[+] Tools Complete${NC}"

######### GDB PEDA ###########
echo
echo -e "${YELLOW}PEDA Setup${NC} Setting up PEDA"
cp -r ./peda /opt

echo
echo -e "${YELLOW}GDB Init${NC} Setting up gdbinit file"
cat <<EOF > /home/kali/.gdbinit
source /opt/peda/peda.py
EOF
echo -e "${GREEN}[+] GDB PEDA Complete${NC}"


######### GHIDRA 10.2.2 ##########
echo
echo -e "${YELLOW}GHIDRA Setup${NC} Setting up GHIDRA"
cp -r ./ghidra_10.2.2_PUBLIC /opt
echo -e "${GREEN}[+] Ghidra Complete${NC}"


######### Desktop Icons ##########
echo
echo -e "${YELLOW}Desktop Icons${NC} Creating Desktop Shortcut Icons"
cat <<EOF > /home/kali/Desktop/burpsuite.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=burpsuite
Comment=
Exec=burpsuite
Icon=kali-burpsuite
Path=
Terminal=false
StartupNotify=false
EOF
cat <<EOF > /home/kali/Desktop/edb-debugger.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=edb-debugger
Comment=
Exec=edb
Icon=kali-edb-debugger
Path=
Terminal=false
StartupNotify=false
EOF
cat <<EOF > ghidra.desktop > /home/kali/Desktop/Terminator.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=Terminator
Comment=Multiple terminals in one window
Exec=terminator
Icon=terminator
Path=
Terminal=false
StartupNotify=true
EOF
cat <<EOF > /home/kali/Desktop/wireshark.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=wireshark
Comment=Interactively dump and analyze network traffic
Exec=sh -c "$(id -Gn | grep -q wireshark || echo pkexec) wireshark %f"
Icon=kali-wireshark
Path=
Terminal=false
StartupNotify=false
EOF
cat <<EOF > /home/kali/Desktop/ghidra.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=ghidra
Comment=
Exec=/opt/ghidra_10.2.2_PUBLIC/ghidraRun
Icon=kali-ghidra
Terminal=false
StartupNotify=false
EOF

chown -R kali: /home/kali/Desktop

# Make executable bins
gio set -t string /home/kali/Desktop/burpsuite.desktop metadata::xfce-exe-checksum "$(sha256sum /home/kali/Desktop/burpsuite.desktop | awk '{print $1}')"
gio set -t string /home/kali/Desktop/edb-debugger.desktop metadata::xfce-exe-checksum "$(sha256sum /home/kali/Desktop/edb-debugger.desktop | awk '{print $1}')"
gio set -t string /home/kali/Desktop/ghidra.desktop metadata::xfce-exe-checksum "$(sha256sum /home/kali/Desktop/ghidra.desktop | awk '{print $1}')"
gio set -t string /home/kali/Desktop/Terminator.desktop metadata::xfce-exe-checksum "$(sha256sum /home/kali/Desktop/Terminator.desktop | awk '{print $1}')"
gio set -t string /home/kali/Desktop/wireshark.desktop metadata::xfce-exe-checksum "$(sha256sum /home/kali/Desktop/wireshark.desktop | awk '{print $1}')"

echo -e "${GREEN}[+] Desktop Icons Complete${NC}"

########### CLEANUP ###########
echo
echo -e "${YELLOW}[+] Cleanup${NC} Cleaning up apt"
apt -y autoremove && sudo apt -y clean all
echo -e "${GREEN}[+] Cleanup Complete${NC}"
