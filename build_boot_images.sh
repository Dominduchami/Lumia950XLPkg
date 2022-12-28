#!/bin/bash

cat ./BootShim/BootShim.bin ./Build/Nexus5X-AARCH64/DEBUG_CLANG38/FV/MSM8992_EFI.fd > ./ImageResources/Bullhead/bootpayload.bin

gzip -c < ./ImageResources/Bullhead/bootpayload.bin >./ImageResources/Bullhead/bootpayload.bin.gz

cat ./ImageResources/Bullhead/bootpayload.bin.gz ./ImageResources/Bullhead/fdt.img >> ./ImageResources/Bullhead/Image.gz-dtb

mkbootimg --kernel ./ImageResources/Bullhead/Image.gz-dtb \
  --ramdisk ./ImageResources/ramdisk-null \
  --base 0x00000000 --pagesize 4096 \
  --ramdisk_offset 0x02000000 \
  --tags_offset 0x01e00000 \
  -o ./ImageResources/Bullhead/uefi.img


cat ./BootShim/BootShim.bin ./Build/Nexus6P-AARCH64/DEBUG_CLANG38/FV/MSM8994_EFI.fd > ./ImageResources/Angler/bootpayload.bin

gzip -c < ./ImageResources/Angler/bootpayload.bin >./ImageResources/Angler/bootpayload.bin.gz

cat ./ImageResources/Angler/bootpayload.bin.gz ./ImageResources/Angler/fdt.img >> ./ImageResources/Angler/Image.gz-dtb

mkbootimg --kernel ./ImageResources/Angler/Image.gz-dtb \
  --ramdisk ./ImageResources/ramdisk-null \
  --base 0x00000000 --pagesize 4096 \
  --ramdisk_offset 0x02000000 \
  --tags_offset 0x01e00000 \
  -o ./ImageResources/Angler/uefi.img