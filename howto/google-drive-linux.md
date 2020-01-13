# Использование Google Drive на Linux

Руководство использует команды для Ubuntu, но работать будет везде, где есть bash и Go версии выше 1.2

```
sudo apt-get install golang git mercurial
```

Перед установкой нужно вписать путь GOPATH в `~/.bashrc`. Затем получть программу командой `go get`.

```
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
go get -u github.com/odeke-em/drive/cmd/drive
```

Теперь необходимо инициализировать каталог для Диска (здесь это `~/gdrive`) и произвести авторизацию. Для авторизации надо перейти по ссылке, сгенерированной командой `init` и вставить в консоль полученный код.

```
drive init ~/gdrive
Visit this URL to get an authorization code
-https://accounts.google.com/o/oauth2/auth......
Paste the authorization code: <paste your code here>
```

