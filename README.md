# api

## Wallsdrobe API Reference

### Used Website
- https://bigconvert.11zon.com/tr/jpeg-to-webp (100 files)
- https://compress-online.com/tr (50 files)

### Change file name scripts 

```bash
#!/bin/bash

# Sayacı 0'dan başlat
counter=0

# Klasör içindeki tüm .webp dosyalarını bulun ve döngüye sokun
for file in *.webp; do
  # Yeni dosya adını oluştur
  new_name="w_${counter}.webp"
  
  # Dosyayı yeniden adlandır
  mv "$file" "$new_name"
  
  # Sayaç değerini 1 arttır
  counter=$((counter + 1))
done

echo "Dosyalar başarıyla yeniden adlandırıldı."
```

### Change json file script

```bash
#!/bin/bash

# Orijinal JSON dosyasının yolu
json_file="wallsdrobe-api.json"

# JSON dosyasını oku ve bir değişkene ata
json_data=$(cat "$json_file")

# Yeni dizileri en üstten eklemek için geçici bir değişken oluştur
new_entries="[]"

# Yeni dizileri ekle 0'dan başlayıp 100'e kadar
for ((id=100; id>=0; id--)); do
  url="https://fatihdelice.github.io/api/wallsdrobe/w_${id}.webp"
  new_entries=$(echo "$new_entries" | jq --arg id "$id" --arg url "$url" '. += [{"id": $id, "url": $url, "name": "wallpaper"}]')
done

# Orijinal JSON verisine yeni dizileri en üstte ekle
updated_json=$(echo "$json_data" | jq --argjson new_entries "$new_entries" '.images = ($new_entries + .images)')

# Güncellenmiş JSON verisini dosyaya yaz
echo "$updated_json" > "$json_file"

echo "JSON dosyası başarıyla güncellendi."
```