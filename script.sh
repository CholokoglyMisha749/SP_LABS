#!/bin/bash


echo "Чолокоглы Михаил, Удаление файла по размеру"
echo "Программа удаляет все файлы большие определенного размера."

dd if=/dev/zero of=large_file bs=1024 count=1
dd if=/dev/zero of=large_file2 bs=1024 count=2
dd if=/dev/zero of=large_file3 bs=1024 count=3
mv "./large_file" "./tmp"
mv "./large_file2" "./tmp"
mv "./large_file3" "./tmp"
ls

while true
do
	echo "Введите путь к каталогу: "
	read directory
	echo "Введите размер, больше которого файлы будут удаляться в байтах: "
	read size

	find "$directory" -type f -size +$size -print
	echo "Вы уверены, что хотите удалить эти файлы? (y/n)"
	read answer
	if [[ "$answer" == "y" || "$answer" == "Y" ]];
	then
		find "$directory" -type f -size +$size -delete
		echo "Файлы удалены!"
		echo "Оставшиеся файлы: "
		ls "$directory"
	else
		echo "Файлы не были удалены!"
		echo "Оставшиеся файлы: "
		ls "$directory"
	fi
	while true
	do
		echo "Выйти? (y/n): "
		read input
		if [[ $input == "y" || $input == "n" ]]
	then
		break
	fi
	done
	if [[ $input == "y" ]]
	then
		break
	fi
done
