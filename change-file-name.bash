#!/bin/bash

# Sayacı 2796'dan başlat
counter=2796

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
