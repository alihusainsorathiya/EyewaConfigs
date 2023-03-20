 #! /bin/sh
# STORES
declare -a stores=(ae sa bh om kw qa us)

# Languages
declare -a lang=(en ar)

# Type of Export
declare -a type=(all ccl pcl)

# BASE URL
googleFeedsUrl="https://adm.eyewa.com/google_feed"

if [[ ! -d GoogleFeedsXMLFiles ]]
  then
# Create Directory
  mkdir GoogleFeedsXMLFiles

# Change Directory
  cd GoogleFeedsXMLFiles
  fi
if [[ ! -f "googleFeedsUrl.txt" ]]
  then

    echo "Exporting URLs in googleFeedsUrl.txt"

  else rm googleFeedsUrl.txt
    # Append URLs to File
fi

for i in "${stores[@]}"

do 
   
   for j in "${lang[@]}"

   do 
      
       for k in "${type[@]}"

        do 
              
filename="google_export_${i}_${j}_${k}.xml"

  # IF Store = US-AR -> SKIP
   if [[ $i == 'us' && $j = 'ar' ]]
	then
	echo "Skipping US AR"
    continue
	fi

# Check if URL File Exists || This file will have URLs to download all feeds
  echo "${i^^}_${j^^}_${k^^} Products : ${googleFeedsUrl}/${filename}" >> googleFeedsUrl.txt

# Create Dynamic URL 
echo "Exporting files for ${i^^}_${j^^}_${k^^} "

# Download Files
curl -o ${filename} ${googleFeedsUrl}/${filename}
echo "================== ${i^^}_${j^^}_${k^^}  DONE ===================="
 

done 
done
done 
