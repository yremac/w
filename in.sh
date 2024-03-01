#!/bin/bash

# Функция для обновления системы
update_system() {
    echo "Выполняется обновление системы..."
    sudo apt-get update && sudo apt-get upgrade -y
    echo "Обновление завершено."
}

# Функция для установки софта
install_software() {
    echo "Выполняется установка необходимого софта..."
    sudo apt-get install -y fail2ban curl net-tools
    echo "Установка софта завершена."
}

# Функция для запуска bench.sh
run_bench_script() {
    echo "Выполняется скрипт bench.sh..."
    wget -qO- bench.sh | bash
    echo "Выполнение скрипта bench.sh завершено."
}

# Функция для установки Tailscale
install_tailscale() {
    echo "Выполняется установка Tailscale..."
    curl -fsSL https://tailscale.com/install.sh | sh
    echo "Установка Tailscale завершена."
}

# Функция для установки Docker
install_docker() {
    echo "Выполняется установка Docker..."
    curl -sSL https://get.docker.com | sh
    sudo usermod -aG docker $(whoami)
    echo "Установка Docker завершена. Пожалуйста, перезапустите систему или выйдите из текущей сессии и войдите заново, чтобы изменения вступили в силу."
}

# Главное меню
while true; do
    echo "Меню:"
    echo "1. Обновить систему"
    echo "2. Установить софт"
    echo "3. Запустить скрипт bench.sh"
    echo "4. Установить Tailscale"
    echo "5. Установить Docker"
    echo "6. Выход"

    read -p "Выберите действие (1/2/3/4/5/6): " choice

    case $choice in
        1)
            update_system
            ;;
        2)
            install_software
            ;;
        3)
            run_bench_script
            ;;
        4)
            install_tailscale
            ;;
        5)
            install_docker
            ;;
        6)
            echo "Выход из скрипта."
            exit 0
            ;;
        *)
            echo "Некорректный ввод. Пожалуйста, выберите 1, 2, 3, 4, 5 или 6."
            ;;
    esac
done
