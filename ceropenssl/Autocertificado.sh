#!/bin/sh
clear
contador=0
terminar=1

until [[ $terminar -lt $contador ]]; 
do
	CADIR=$(pwd)
	OPENSSL_CONF=$CADIR/openssl.cnf
	echo -e "\e[1;33mLa longitud de la llave debe ser de [2048 o 4096]\e[0m\n"
	read -p "Longitud de la llave: " longitud
	read -p "Nombre del certificadio y el requerimiento: " cn
	echo -e "Contraseña:"
	read -s pass
	echo -e "\n"
	export OPENSSL_CONF
	cd $CADIR

		if [[ "$longitud" == "2048" ]] || [[ "$longitud" == "4096" ]]; then

			if [[ -z ${cn} ]] || [[ -z ${pass} ]] ;	then

				echo -e "\e[1;31mLo sentimos, uno o mas datos estan vacios, por favor vuelva a intentar\e[0m \n"
				contador=1
				echo -e "\n"

			else

				until [[ $terminar -lt $contador ]]; 
				do
					openssl req -new -newkey rsa:"$longitud" -out "$cn".csr -keyout "$cn".pem  -days 365 -passin pass:"$pass" -passout pass:"$pass"
					openssl x509 -req -days 3650 -in "$cn".csr -signkey "$cn".pem -out "$cn".crt
					echo -e "\n"
					read -p "¿Sus datos son correctos? 1[no], 2[si] " contador
	
						case $contador in
					
							1)
								echo -e "\e[1;31mSe volveran a capturar los datos\e[0m\n"
								rm -r "$cn".csr "$cn".crt "$cn".pem
								contador=1
								echo -e "\n"									
							;;
							2)
								echo -ne "\e[1;34mPor favor espere se esta generando el requerimiento y la llave privada\e[0m\r"
								sleep 1
								echo -ne "\e[0;36mPor favor espere se esta generando el requerimiento y la llave privada\e[0m\r"
								sleep 1
								echo -ne "\e[1;34mPor favor espere se esta generando el requerimiento y la llave privada\e[0m\r"
								sleep 1
								echo -ne "\e[0;36mPor favor espere se esta generando el requerimiento y la llave privada\e[0m\r"
								sleep 1
								echo -ne "\e[1;34mPor favor espere se esta generando el requerimiento y la llave privada\e[0m\r"
								sleep 1
								echo -ne "\e[0;36mPor favor espere se esta generando el requerimiento y la llave privada\e[0m\n\n"
								sleep 1
								echo -ne '\e[1;32m......                    (1%)\e[0m\r'
								sleep 2
								echo -ne '\e[1;32m.........                 (2%)\e[0m\r'
								sleep 2
								echo -ne '\e[1;32m......                    (1%)\e[0m\r'
								sleep 3
								echo -ne '\e[1;32m............              (6%)\e[0m\r'
								sleep 1
								echo -ne '\e[1;32m####......                (12%)\e[0m\r'
								sleep 1
								echo -ne '\e[1;32m########........          (33%)\e[0m\r'
								sleep 1
								echo -ne '\e[1;32m############.......       (66%)\e[0m\r'
								sleep 1
								echo -ne '\e[1;32m####################      (100%)\e[0m\r'
								echo -ne '\n\n'
		
		  						#openssl req -x509 -days 365 -newkey rsa:"$longitud" -keyout "$cn".pem -out "$cn".crt  -passin pass:"$pass" -passout pass:"$pass"
								mkdir "$cn"
								mv "$cn".csr "$cn".crt "$cn".pem "$cn"/
								cd "$cn"

								echo -ne "\e[1;34mPor favor espere se esta generando el pfx\e[0m\r"
								sleep 1
								echo -ne "\e[0;36mPor favor espere se esta generando el pfx\e[0m\r"
								sleep 1
								echo -ne "\e[1;34mPor favor espere se esta generando el pfx\e[0m\r"
								sleep 1
								echo -ne "\e[0;36mPor favor espere se esta generando el pfx\e[0m\r"
								sleep 1
								echo -ne "\e[1;34mPor favor espere se esta generando el pfx\e[0m\r"
								sleep 1
								echo -ne "\e[0;36mPor favor espere se esta generando el pfx\e[0m\r\n\n"
								sleep 1
								echo -ne '\e[1;32m......                    (1%)\e[0m\r'
								sleep 2
								echo -ne '\e[1;32m.........                 (2%)\e[0m\r'
								sleep 2
								echo -ne '\e[1;32m......                    (1%)\e[0m\r'
								sleep 3
								echo -ne '\e[1;32m..........                (6%)\e[0m\r'
								sleep 1
								echo -ne '\e[1;32m####........              (12%)\e[0m\r'
								sleep 1
								echo -ne '\e[1;32m########........          (33%)\e[0m\r'
								sleep 1
								echo -ne '\e[1;32m############.......       (66%)\e[0m\r'
								sleep 1
								echo -ne '\e[1;32m####################      (100%)\e[0m\r'
								echo -ne '\n\n'
								openssl pkcs12 -export -out "$cn".pfx -inkey "$cn".pem -in "$cn".crt
								contador=2
								ls -l 
								echo -e "\n"
							;;
						esac

				done

			fi

		else

			echo -e "\e[1;31mLa longitud que ingreso no se encuentra en los rangos permitidos intente nuevamente\e[0m\n"
			contador=1			

		fi

done