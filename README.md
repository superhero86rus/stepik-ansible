#### Ansible для начинающих + практический опыт
### https://stepik.org/course/123806/syllabus

### На управляемых машинах меняем hostname
```bash
# Задаем hostname ansibletarget1
sudo nano /etc/hostname

# После localshost задаем имя хоста для 2-х строчек
#127.0.0.1   localhost ansibletarget1
#::1         localhost ansibletarget1
sudo nano /etc/hosts
```

### Установка Ansible на RHEL
```bash
sudo dnf install ansible
```

### Запуск модуля ping
```bash
ansible target1 -m ping -i inventory
ansible all -m ping -i inventory
```

### Как в инвентарном файле использовать группу из групп
```ini
[web servers]
web1
web2
web3

[db_servers]
db1

[all_Servers:children]
web_servers
db_servers
```

### Управление Windows
# Под админом, включить на хостах PS: Enable-PSRemoting -Force
# Set-NetFirewallRule -DisplayName "Общий доступ к файлам и принтерам (эхо-запрос - входящий трафик ICMPv4)" -Enabled True
# После этого windows машина начнет пинговаться
```bash
sudo dnf install python3-pip
pip3 install pywinrm
```