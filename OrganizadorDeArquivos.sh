#!/bin/bash

total_movidos=0

echo "Criando pasta de organização."
mkdir -p organizacao

cd organizacao

echo "Criando subpastas."
mkdir -p textos
mkdir -p imagens
mkdir -p codigos
mkdir -p outros

echo "Verificando arquivos das pastas"
echo
echo "Pasta de texto."
cd textos
ls -1
mv *.jpg organizacao/
mv *.png organizacao/
cd ..

echo "Pasta de imagem."
cd imagens
ls -1
cd ..

echo "Pasta de código."
cd codigos
ls -1
cd ..

echo "Pasta de outros."
cd outros 
ls -1
cd ..

for arquivo in *; do
	if [[ -f "$arquivo" ]]; then
		if [[ "$arquivo" == *.txt || "$arquivo" == *.pdf ]]; then
			mv "$arquivo" textos/
			((total_movidos++))
		elif [[ "$arquivo" == *.png || "$arquivo" == *.jpg ]]; then
			mv "$arquivo" imagens/
			((total_movidos++))
		elif [[ "$arquivo" == *.c || "$arquivo" == *.sh ]]; then
			mv "$arquivo" codigos/
			((total_movidos++))
		else 
			mv "$arquivo" outros/
			((total_movidos++))
		fi
	fi
done

echo "Organização concluida."
echo "Total de arquivos movidos: $total_movidos"
