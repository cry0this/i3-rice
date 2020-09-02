#!/bin/bash

# Завершить текущие экземпляры polybar
pkill -9 polybar

# Ожидание полного завершения работы процессов
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Запуск Polybar со стандартным расположением конфигурационного файла в ~/.config/polybar/config
polybar main &
#polybar monitoring &

echo "Polybar загрузился..."
