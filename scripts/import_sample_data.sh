#!/bin/sh

set -e

cd /tmp

echo "\033[32m------------------ 1/ Retrieve products -----------------\033[0m";
wget https://static.openfoodfacts.org/exports/39-.tar.gz 2>&1
tar -xzvf 39-.tar.gz -C /mnt/podata/products
rm 39-.tar.gz

echo "\033[32m------------------ 2/ Retrieve product images -------------------\033[0m";
wget https://static.openfoodfacts.org/exports/39-.images.tar.gz 2>&1
tar -xzvf 39-.images.tar.gz -C /mnt/podata/product_images
rm 39-.images.tar.gz

echo "\033[32m------------------ 3/ Import products -------------------\033[0m";
perl -I/opt/product-opener/lib /opt/product-opener/scripts/update_all_products_from_dir_in_mongodb.pl
