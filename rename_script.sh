for file in *-min.webp; do
    new_name=$(echo "$file" | sed 's/-min//')
    mv "$file" "$new_name"
done