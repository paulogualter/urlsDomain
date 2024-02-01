#!/bin/bash

declare -A apps=(["assetfinder"]="go install -v github.com/tomnomnom/assetfinder@latest" ["anew"]="go install -v github.com/tomnomnom/anew@latest" ["httpx"]="go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest" )

for app in "${!apps[@]}"
do
    if ! command -v $app &> /dev/null
    then
        echo "$app não está instalado. Tentando instalar..."
        if ${apps[$app]}
        then
            echo "$app foi instalado com sucesso!"
        else
            echo "Falha ao instalar $app. Verifique se o pacote está disponível para instalação."
        fi
    else
        echo "$app já está instalado."
    fi
done


declare -A appsAPT=( ["subfinder"]="sudo apt install subfinder -y" ["sublist3r"]="sudo apt install sublist3r -y" ["lolcat"]="sudo apt install lolcat -y")

for app in "${!appsAPT[@]}"
do
    if ! command -v $app &> /dev/null
    then
        echo "$app não está instalado. Tentando instalar..."
        if ${appsAPT[$app]}
        then
            if command -v $app &> /dev/null
            then
                echo "Programa $app instalado com sucesso!"
            else
                echo "Programa $app não foi instalado, favor verificar."
            fi
        else
            echo "Falha ao instalar $app. Verifique se o pacote está disponível para instalação."
        fi
    else
        echo "$app já está instalado."
    fi
done
