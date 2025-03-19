#!/bin/bash

# Nome del file contenente i dataset da scaricare
DATASETS_FILE="datasets.txt"

# Controlla se il file esiste
if [[ ! -f "$DATASETS_FILE" ]]; then
    echo "❌ Errore: Il file $DATASETS_FILE non esiste!"
    exit 1
fi

# Crea la cartella 'downloads' se non esiste
mkdir -p work

# Legge il file riga per riga
while IFS=, read -r file_name file_url; do
    echo "🔽 Scaricamento di $file_name da $file_url..."

    # Scarica il file con wget
    wget --no-check-certificate -O "work/$file_name" "$file_url"

    # Controlla se il download è riuscito
    if [[ $? -eq 0 ]]; then
        echo "✅ Download completato: downloads/$file_name"
    else
        echo "❌ Errore nel download di $file_name"
    fi

    echo "---------------------------------"

done < "$DATASETS_FILE"

echo "🎉 Tutti i download sono stati completati!"
