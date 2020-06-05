# Настройка iSCSI на Linux

Все команды тут выполняются от root либо с sudo.

```
~$ apt -y install open-iscsi
~$ vim /etc/iscsi/iscsid.conf
# line 56: uncomment
node.session.auth.authmethod = CHAP
# line 60,61: uncomment and specify the username and password you set on the iSCSI target
node.session.auth.username = username
node.session.auth.password = password

~$ systemctl restart iscsid open-iscsi

# discover targets
~$ iscsiadm -m discovery -t sendtargets -p <ip сервера iscsi>
# в выводе команды получим список доступных для логина нод
# из этого списка нужно выбрать те, что нас интересуют и вписать в /etc/iscsi/initiatorname.iscsi

~$ vim /etc/iscsi/initiatorname.iscsi
InitiatorName=<имя ноды>

# confirm status after discovery
~$ iscsiadm -m node -o show
# BEGIN RECORD 2.0-874
node.name = iqn.2018-05.world.srv:dlp.target01
node.tpgt = 1
node.startup = manual
node.leading_login = No
.....
.....
node.conn[0].iscsi.IFMarker = No
node.conn[0].iscsi.OFMarker = No
# END RECORD

# login to the target
~$ iscsiadm -m node --login
Logging in to [iface: default, target: iqn.2018-05.world.srv:dlp.target01, portal: 10.0.0.30,3260] (multiple)
Login to [iface: default, target: iqn.2018-05.world.srv:dlp.target01, portal: 10.0.0.30,3260] successful.

# confirm the established session
~$ iscsiadm -m session -o show
tcp: [1] 10.0.0.30:3260,1 iqn.2018-05.world.srv:dlp.target01 (non-flash)

# проверяем, что у нас доступны тома, подключенные через iscsi
~$ lslbk
# из этого списка нужно найти интересующий нас раздел
# для автомонтирования нужно узнать его UUID
~$ blkid /dev/<том>
# далее нужно добавить этот том в /etc/fstab
~$ vim /etc/fstab
UUID=<нужный UUID>   <точка монитрования>      ntfs    _netdev,uid=1000,gid=1000       0       0
```
