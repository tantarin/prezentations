#!/bin/bash
# Пример использования генератора презентаций

echo "=== Генератор презентаций ==="
echo "Создание презентации из тестового файла..."

# Переход в директорию скрипта
cd "$(dirname "$0")"

# Создание презентации
./run_generator.sh test_content.txt -o example_presentation.pptx

echo "Презентация создана: example_presentation.pptx"
echo "Откройте файл в PowerPoint для просмотра результата"