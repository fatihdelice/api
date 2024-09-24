#!/bin/bash

# Orijinal JSON dosyasının yolu
json_file="wallsdrobe-api.json"

# JSON dosyasını oku ve bir değişkene ata
json_data=$(cat "$json_file")

# Yeni dizileri en üstten eklemek için geçici bir değişken oluştur
new_entries="[]"

# Yeni dizileri ekle
for ((id=3218; id>=3041; id--)); do
  url="https://fatihdelice.github.io/api/wallsdrobe/w_${id}.webp"
  new_entries=$(echo "$new_entries" | jq --arg id "$id" --arg url "$url" '. += [{"id": $id, "url": $url, "name": "wallpaper"}]')
done

# Orijinal JSON verisine yeni dizileri en üstte ekle
updated_json=$(echo "$json_data" | jq --argjson new_entries "$new_entries" '.images = ($new_entries + .images)')

# Güncellenmiş JSON verisini dosyaya yaz
echo "$updated_json" > "$json_file"

echo "JSON dosyası başarıyla güncellendi."
