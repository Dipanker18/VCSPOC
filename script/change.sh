#!/bin/bash

changed_file=$(git diff --name-only HEAD^1 HEAD)
for file in $changed_file; do
    mkdir -p "changed_files/$(dirname "$file")"
    cp "$file" "changed_files/$file"
done

zip -r changed_files.zip changed_files
rm -r changed_files

#curl -X POST \
#    -H "Content-Type: application/octet-stream" \
#    -u mcC2382:password \
#    --data-binary @changed_files.zip \
#    "https://scsimdev.mcd.com/restapiv2/inbound-integration-endpoints/POC_IIEPGITHUB/upload-and-invoke?fileName=changed_files.zip&context=Context1&workspace=Main"

#echo "Changes Uploaded"