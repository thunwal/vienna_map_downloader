#!/bin/bash
# This script downloads and extracts all 98 tiles of Vienna's "Flächen-Mehrzweckkarte Vektordaten".

# Output directory where the extracted GPKG files will be saved
output_dir="./gpkg_files"

# Create the directory if it doesn't already exist
mkdir -p "$output_dir"

# Variable to count extracted files
extracted_files=0

# The naming scheme of the tiled data contains the two numbers {a} [15,58] and {b} [1,4].
# Loop over the range of both numbers to download all tiles.
echo "INFO: Starting the download..."
for a in {15..58}; do
    for b in {1..4}; do
        # Construct the URL
        url="https://www.wien.gv.at/ma41datenviewer/downloads/geodaten/fmzk_gp/${a}_${b}_fmzk_gp.zip"
        
        # Construct the name of the downloaded ZIP file
        tmp_zip_name="${a}_${b}_fmzk_gp.zip"
        tmp_zip="./$tmp_zip_name"

        # Download the ZIP file, extract it and delete it.
        # If the download fails, skip to the next iteration
        response_code=$(curl -fs -w "%{response_code}" -o "$tmp_zip" "$url")
        if [ "$response_code" -eq 200 ]; then
            unzip -ojq "$tmp_zip" '*.gpkg' -d "$output_dir"
            rm "$tmp_zip"
            echo "INFO: $tmp_zip_name was downloaded and extracted."
            ((extracted_files++))
        else
            if [ "$response_code" -eq 404 ]; then
                continue  # 404 (not found) is expected for many iterations, show no error message
            else
                echo "ERROR: Skipping $tmp_zip_name due to error (HTTP Status: $response_code)."
            fi
        fi
    done
done

echo "DONE! $extracted_files files were extracted to $output_dir (expected: 98 files)."
