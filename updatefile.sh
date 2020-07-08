echo copying...
cd vendor
cat  ../proprietary-files.txt | xargs -I %  cp % /mnt/amber_vendor/%
echo done!
