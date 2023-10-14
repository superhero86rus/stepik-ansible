#### Ansible для начинающих + практический опыт
### https://stepik.org/course/123806/syllabus

# Введение в Ansible

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

### Управление Windows через WinRM
- Под админом, включить на хостах PS: Enable-PSRemoting -Force
- Set-NetFirewallRule -DisplayName "Общий доступ к файлам и принтерам (эхо-запрос - входящий трафик ICMPv4)" -Enabled True
- После этого windows машина начнет пинговаться, но доступа через ansible не будет
- Нужно создать пользователя ansible и добавить его в группу Администраторы
- Для настройки WinRM и доступности через Ansible выполняем последовательно:
config/WinRM/WinRMSetup.ps1, config/WinRM/ConfigureRemotingForAnsible.ps1
- Также, можно создать пользователя выполнив https://github.com/superhero86rus/ansible-windows/blob/master/files/ConfigureRemotingUserForAnsible.ps1

### Установка модуля WinRM для Ansible на управляющую машину
```bash
sudo dnf install python3-pip
pip3 install pywinrm
```

### Пример YAML
```yaml
employee:
    name: john
    gender: male
    age: 24
    address:
        city: edison
        state: 'new jersey'
        country: 'united states'
    payslips:
        -
            month: june
            amount: 1400
        -
            month: july
            amount: 2400
        -
            month: august
            amount: 3400
```

# Основные понятия Ansible

##### Основной inventory файл лежит в /etc/ansible/hosts в формате ini

### Настройка Windows-машин (подробнее...)
```powershell
# Какой PS установлен
$PSVersionTable

# Какой .net установлен
dir /windows/microsoft.net/framework/v*

# Выполнить скрипты из каталога /config (WinRMSetup.ps1, ConfigureRemotingForAnsible.ps1, ConfigureRemotingUserForAnsible.ps1)

# Посмотреть настройки winrm
winrm get winrm/config

set-item WSMan:\localhost\Service\AllowUnencrypted $True

# Изменить свойства сетевого подключения и выбрать тип сети - Частная (вместо общедоступной)
```