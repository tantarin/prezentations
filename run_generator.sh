#!/bin/bash

# Скрипт для запуска генератора презентаций
# Использование: ./run_generator.sh <входной_файл> [выходная_директория]

if [ $# -eq 0 ]; then
    echo "Использование: $0 <входной_файл> [выходная_директория]"
    echo "Пример: $0 test_content.txt presentations"
    exit 1
fi

INPUT_FILE="$1"
OUTPUT_DIR="${2:-presentations}"

# Проверяем, существует ли входной файл
if [ ! -f "$INPUT_FILE" ]; then
    echo "Ошибка: Файл $INPUT_FILE не найден"
    exit 1
fi

# Проверяем, существует ли виртуальное окружение
if [ ! -d "venv" ]; then
    echo "Создаю виртуальное окружение..."
    python3 -m venv venv
    echo "Устанавливаю зависимости..."
    source venv/bin/activate
    pip install -r requirements.txt
else
    echo "Активирую виртуальное окружение..."
    source venv/bin/activate
fi

echo "Генерирую презентации из файла: $INPUT_FILE"
echo "Выходная директория: $OUTPUT_DIR"

python presentation_generator.py "$INPUT_FILE" -o "$OUTPUT_DIR"

echo "Готово! Презентации сохранены в директории: $OUTPUT_DIR"