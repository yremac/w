#!/bin/bash

# Параметры файла подкачки
SWAP_FILENAME="/swapfile"
SWAP_SIZE="1G"  # Размер файла подкачки

# Функция для создания файла подкачки
create_swap_file() {
    if [ -f $SWAP_FILENAME ]; then
        echo "Swap file already exists."
        return 1
    fi

    fallocate -l $SWAP_SIZE $SWAP_FILENAME
    chmod 600 $SWAP_FILENAME
    mkswap $SWAP_FILENAME
    swapon $SWAP_FILENAME
    echo "Swap file created and enabled."
}

# Функция для удаления файла подкачки
remove_swap_file() {
    if [ -f $SWAP_FILENAME ]; then
        swapoff $SWAP_FILENAME
        rm $SWAP_FILENAME
        echo "Swap file removed."
    else
        echo "No swap file found."
    fi
}

# Основное меню
echo "Swap File Management Script"
echo "1. Create and enable swap file"
echo "2. Remove swap file"
read -p "Enter your choice: " choice

case $choice in
    1)
        create_swap_file
        ;;
    2)
        remove_swap_file
        ;;
    *)
        echo "Invalid choice"
        ;;
esac
