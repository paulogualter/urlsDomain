#!/bin/bash

# Instalar pacotes
echo -e"[+] Instalando Pacotes [+]\n"

echo -e"Instalando lolcat"
sudo apt install lolcat -y

echo -e"Instalando subfinder"
sudo apt install subfinder -y

echo -e"Instalando Sublist3r"
sudo apt install sublist3r -y

echo -e"Instalando Go\n"
sudo apt install golang-go -y

echo -e"[+] Pacotes Instalados com Sucesso [+]\n"


# Instalar pacotes Go

echo -e"[+] Instalando Pacotes Go [+]\n"
go install -v github.com/tomnomnom/assetfinder@latest
go install -v github.com/tomnomnom/anew@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest


# Mover conteúdo de /root/go/bin/ para /usr/bin/
sudo mv /root/go/bin/* /usr/bin/

