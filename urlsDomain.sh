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

# Define cores
GREEN='\033[0;32m'
NC='\033[0m' # No Color


# Defina o domínio alvo
dominio=$1

# Verifica se o domínio foi fornecido
if [ -z "$dominio" ]
then
    echo -e "Por favor, forneça um domínio como argumento. Sem http://www ou https://"
    echo "Modo de Usar: ./urlsDomain.sh exemplo.com.br"
    exit 1
fi

$dev = 2>/dev/null


# Busca por Subdominios
echo -e "Busca de subdominios sendo realizado e validado no dominio https://www."$dominio "\n"
sleep 2
echo - "[+] Processo em adanmento [+]"

subfinder -d $dominio -silent $dev | anew | tee subs.txt
assetfinder --subs-only $dominio $dev | anew >> subs.txt
sublist3r -d $dominio -e baidu,yahoo,google,bing,ask,netcraft,dnsdumpster,threatcrowd,ssl,passivedns | anew >> subs.txt



# Verifica se os subdominios sao validos
cat subs.txt | httpx -silent -server -ip -sc > resultadosIPs.txt
echo -e "\n"
echo -e "${GREEN}Subdominios Unicos e Validados - ABAIXO ${NC}"
echo -e "---------------------------------------\n"

#Grava em arquivo os subdominios
cat resultadosIPs.txt
echo -e "\n"

#Verifica a quantidade de subdominios validos
qtd=$(cat resultadosIPs.txt | wc -l)
echo -e "Total de Subdominios Validos = ${qtd}" 
echo -e "\n"
echo "Scan em https://www.${dominio} concluido com Exito"
echo -e "${GREEN}[+] Finalizado [+]${NC}"
