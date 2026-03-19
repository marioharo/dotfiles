#!/bin/bash

# Verifica si se ingresó un valor
if [ -z "$1" ]; then
  echo "Uso: $0 <tamaño en bytes>"
  exit 1
fi

bytes=$1

# Validación: solo números positivos
if ! [[ "$bytes" =~ ^[0-9]+$ ]]; then
  echo "Error: Ingresa un número entero positivo (bytes)"
  exit 1
fi

# Unidades desde bytes hasta Zettabytes
units=("bytes" "KB" "MB" "GB" "TB" "PB" "EB" "ZB")
scale=1024
index=0

# Determina la unidad más apropiada
while (( bytes >= scale )) && (( index < ${#units[@]} - 1 )); do
  bytes=$(echo "$bytes / $scale" | bc)
  ((index++))
done

# Valor final con decimales
human=$(echo "scale=2; $1 / (1024^$index)" | bc)
printf "%s %s\n" "$human" "${units[index]}"

