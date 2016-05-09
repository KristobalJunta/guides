# Как добавить swapfile в Linux

## 1. Проверить наличие свапа

```
sudo swapon -s
```

## 2. Создать файл нужного размера
Здесь пример для файла /swapfile размером 4Gb

Медленный способ:

```
sudo dd if=/dev/zero of=/swapfile bs=1G count=4
```

Быстрый способ:

```
sudo fallocate -l 4G /swapfile
```

## 3. Защитить и подключить свопфайл

```
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```

## 4. Монтировать свапфайл при загрузке

В файл `/etc/fstab` вписать следующее:

```
/swapfile none swap sw 0 0
```

## 5. Изменение настроек использования свапа

В файл `/etc/sysctl.conf` добавить (или заменить):

```
vm.swappiness=10 # аггрессивность использования swapfile (умолчание - 60)
vm.vfs_cache_pressure = 50 # аггрессивность очистки кеша данных о ФС (умолчание - 100)
```

