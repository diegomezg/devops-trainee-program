# Compress files in Linux
Present an example on how to extract/compress with the following formats:
* tar  
>Compress
```
tar -cvf compressedFile.tar /home/directory-or-file
```
c - Create file
v - Display compress process
f - Compressed file name
>Extract
```
tar -xvf sampleArchive.tar
```
* gz
>Compress
```
gzip file
```
>Extract
```
gzip -dk file.gz
```
* bz2
>Compress
```
bzip2 -z filename
```
>Extract
```
bzip2 -d filename.bz2
```
* tar.gz
>Compress
```
tar -czvf compressed.tar.gz /dir/file
```
>Extract
```
tar -xzvf filename.tar.gz
```
* tar.bz2
>Compress
```
tar -c file | bzip2 > file.tar.bz2e
```
>Extract
```
bzip2 -dc file.tar.bz2 | tar -xv
```