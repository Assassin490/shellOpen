#!/bin/sh

CADIR=$(pwd)

mkdir -p $CADIR

cat <<FIN > $CADIR/openssl.cnf
[ req ]
distinguished_name      = req_dn

[ req_dn ]

commonName                     = Nombre del certificado (ejem: mi certificado)
commonName_max                 = 64

organizationalUnitName         = Nombre de tu area (ejem: Fielnet)
organizationalUnitName_default = Business Default

organizationName               = Nombre de tu empresa (ejem: Soporte Ventas)
organizationName_default       = Department Default

localityName                   = Nombre de tu localidad (Mexico)
localityName_default           = Mexico

stateOrProvinceName            = Estado o provincia (ejem: La condeza, Cuauhtémoc, Estado de Mexico)
stateOrProvinceName_default    = Mexico

countryName                    = Pais (codigo de 2 letras)
countryName_default            = ES
countryName_min                = 2
countryName_max                = 2

emailAddress                   = Correo electronico de la institución (ejem: soporte@fielnet.com.mx)
emailAddress_default           = soporte@fielnet.com.mx



[ ca_ext ]
basicConstraints = CA:true
keyUsage = cRLSign, keyCertSign
nsCertType = sslCA, emailCA
FIN