#!/bin/bash

echo '


 ██╗   ██╗██████╗ ██╗     ███████╗██████╗  ██████╗ ███╗   ███╗ █████╗ ██╗███╗   ██╗
██║   ██║██╔══██╗██║     ██╔════╝██╔══██╗██╔═══██╗████╗ ████║██╔══██╗██║████╗  ██║
██║   ██║██████╔╝██║     ███████╗██║  ██║██║   ██║██╔████╔██║███████║██║██╔██╗ ██║
██║   ██║██╔══██╗██║     ╚════██║██║  ██║██║   ██║██║╚██╔╝██║██╔══██║██║██║╚██╗██║
╚██████╔╝██║  ██║███████╗███████║██████╔╝╚██████╔╝██║ ╚═╝ ██║██║  ██║██║██║ ╚████║
 ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝╚═════╝  ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝
                                                                                  

                            [AUTOR    : eb0x         ]
                            [YOU TUBE : opaulogualter]
                            [INSTAGRAM: opaulogualter]
                              [-------++++++-------]
____________________________________[++++++++]____________________________________
' | lolcat          

# Define some colors
GREEN='\033[0;32m'
NC='\033[0m' # No Color


# Defina o domínio alvo
dominio=$1

# Verifique se o domínio foi fornecido
if [ -z "$dominio" ]
then
    echo -e "Por favor, forneça um domínio como argumento. Sem http://www ou https://"
    echo "Modo de Usar: ./urlsDomain.sh exemplo.com.br"
    exit 1
fi

$dev = 2>/dev/null

echo "... [+] Verificando Dependencias ... [+]"

echo

# Verificar se subfinder está instalado
if ! command -v subfinder &> /dev/null
then
    sudo apt-get install subfinder
else
    echo " "
fi


# Verificar se subfinder está instalado
if ! command -v sublist3r &> /dev/null
then
    sudo apt-get install sublist3r
else
    echo " "
fi


# Verificar se httpx está instalado
if ! command -v httpx &> /dev/null
then
    sudo apt-get install httpx
else
sleep 3
echo "... [+] Dependencias Verificadas ... [+]"
    echo -e "....................................................................\n "
fi





# Use subfinder e assetfinder para encontrar subdomínios e salve os resultados em um arquivo
echo -e "Busca de subdominios sendo realizado e validado no dominio https://www."$dominio "\n"
sleep 2

subfinder -d $dominio -silent $dev | anew | tee subs.txt
assetfinder --subs-only $dominio $dev | anew >> subs.txt
sublist3r -d $dominio -e baidu,yahoo,google,bing,ask,netcraft,dnsdumpster,threatcrowd,ssl,passivedns | anew >> subs.txt



# Use httpx para verificar quais subdomínios têm um servidor HTTP ativo
cat subs.txt | httpx -silent -server -ip -sc > resultadosIPs.txt
echo -e "\n"
echo -e "${GREEN}Subdominios Unicos e Validados - ABAIXO ${NC}"
echo -e "---------------------------------------\n"
cat resultadosIPs.txt
echo -e "\n"
qtd=$(cat resultadosIPs.txt | wc -l)
echo -e "Total de Subdominios Validos= ${qtd}" 
echo -e "\n"
echo "Scan em https://www.${dominio} concluido com Exito"
echo -e "${GREEN}[+] Finalizado [+]${NC}"

