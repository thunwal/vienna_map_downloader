# vienna_map_downloader

## What does this script do?

The city of Vienna publishes a multipurpose map 
(["Mehrzweckkarte"](https://www.wien.gv.at/stadtentwicklung/stadtvermessung/geodaten/mzk/)") in various versions as 
Open Government Data. However, downloading the entire map is tedious as the data is tiled and each tile has to be 
downloaded manually via the ["Geodatenviewer"](https://www.wien.gv.at/geodatenviewer/portal/wien/). This bash script 
downloads all 98 tiles of the polygonal vector data version "Flächen-Mehrzweckkarte Vektordaten" and unpacks the GPKG 
files into a subfolder `gpkg_files` (relative to the script location). Before using the data, make sure to read Vienna's 
[terms of use](https://digitales.wien.gv.at/ogd-nutzungsbedingungen/).

## How can I run the script?

UNIX/Linux/Mac users simply open the terminal at the script location and type `bash download_files.sh`.

Windows 10/11 users with installed Windows Subsystem for Linux (WSL) can do the same. 

Windows 10/11 users without WSL should consider installing it. The official instructions can be found 
[here](https://learn.microsoft.com/en-us/windows/wsl/install) 
(don't worry - to get started, you only need this command: `wsl --install`).
