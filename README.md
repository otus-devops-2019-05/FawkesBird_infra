# FawkesBird_infra
FawkesBird Infra repository
Author: Evgenii Krasniakov

==================================================================================
- Homework #3 ("cloud-bastion")
bastion_IP = 34.76.194.7
someinternalhost_IP = 10.132.0.3

Ответ на вопрос "Как подключиться к 'someinternalhost' одной командой (без VPN)?":
это можно сделать с помощью команды "ssh -A 34.76.194.7 -t ssh 10.132.0.3". А если
прописать для этой команды алиас "ssh someinternalhost", то можно производить это
подключение только с помощью этого алиаса (без явного указания ip-шников).
==================================================================================

- Homework #4 ("cloud-testapp")
testapp_IP = 34.76.199.35
testapp_port = 9292
==================================================================================

- Homework #5 ("packer-base")
В рамках текущего ДЗ сделано:
    * Реализован Packer-образ для VM-инстансов.
    * В GCP создан инстанс на основе реализованного Packer-образа.
    * На данный инстанс склонировано и запущено "reddit-app" приложение.
    * Произведена проверка работы этого приложения (IP = 35.195.131.204, port = 9292).
    * Произведена параметризация конфигурации Packer-образа (теперь команда для сборки образа выглядит "packer build -var-file=variables.json ubuntu16.json"). В рамках этого ДЗ реальный "variables.json" не закоммичен (как и просится в ДЗ), вместо этого закоммичен фейковый "variables.json.example".

==================================================================================

- Homework #6 ("terraform-1")
В рамках текущего ДЗ сделано:
    * Установка Terraform на локальную машину.
    * Создание Terraform-конфигурации для реализации инстансов на GCP.
    * Параметризация необходимых атрибутов.
    * Запуск VM-инстанса на основе созданной конфигурации и проверка его работоспособности.

==================================================================================

- Homework #7 ("terraform-2")
В рамках текущего ДЗ сделано:
    * Определен ресурс файервола для terraform-конфигурации;
    * Описан внешний ресурс (IP-адрес для инстанса) в terraform-конфигурации;
    * Реализовано два отдельных Packer-образа для приложения и MongoDB, на их основе были
сконфигурированы инстансы в GCP и проверены их работоспособность;
    * terraform-конфигурация была разбита по файлам-модулям, после чего была протестирована
эта конфигурация;
    * Реализована модульность для terraform-конфигурации (модули: "app", "db" и "vpc");
    * Протестирована новая модульная конфигурация (проверена успешность её реализации);
    * На основе созданных модулей были реализованы и протестированы два окружения ("stage" и "prod");
    * Были созданы бакеты в сервисе Storage, а также была проверена их доступность.

==================================================================================

- Homework #8 ("ansible-1")
В рамках текущего ДЗ сделано:
    * Установлен Ansible в рамках заданных требований из файла 'requirements.txt'.
    * На основе terraform-конфигурации из прошлого ДЗ созданы два инстанса: 'app' и 'db';
проверена успешность их создания и доступность по ssh.
    * Настроены конфигурационные файлы для Ansible: 'ansible.cfg', 'inventory' и 'inventory.yml',
протестиована их работоспособность.
    * Протестированы разные типы команд, описанные в ДЗ, для созданных 'app' и 'db' инстансов.
    * Написана плейбука, в рамках которого клонируется необходимый репозиторий;


Ответ на вопрос "Как изменится результат работы плейбуки после удаления папки, в которую
был склонирован репозиторий?". Результат изменился и стал:

'''
    PLAY RECAP ************
    appserver: ok=2  changed=1  unreachable=0  failed=0  skipped=0  rescued=0  ignored=0 
'''

Поскольку теперь репозиторий, в который клонировалось приложение из Git, удален, новая команда
клонирования при работе плейбуки будет отрабатывать с флагом "changed=true" (это видно в
общем результате), что означает, что изменения есть, репозиторий был склонирован и помещён
в искомую папку. А если запустить плейбуку ещё раз, эта команда будет отрабатывать с флагом
"changed=false" (репозиторий уже есть, клонировать его ещё раз не надо).

==================================================================================

- Homework #9 ("ansible-2")
В рамках текущего ДЗ сделано:
    * Написана плейбука для "app" и "db" инстансов для одного сценария (с тегами и
группами хостов, проверена работоспособность склонированного приложения.
    * Написана аналогичная плейбука c множественными сценариями, проверена
работоспособность склонированного приложения для этой плейбуки.
    * Написаны 3 отдельные плейбуки (для конфигурирования БД, конфигурирования приложения и деплоя приложения), а также одна головная, которая их импортирует), проверена
работоспособность приложения для новой плейбуки.
    * Написаны 2 плейбуки для "reddit-app-base" и "reddit-db-base" образов, были удалены
старые образы и реализованы новые с помощью инструмента "packer" на основе этих плейбук.
    * На базе новых образов были сконфигурированы два новых ("app" и "db") инстанса, на
них была запущена последняя версия плейбуки и проверена работоспособность склонированного
приложения.

==================================================================================

- Homework #10 ("ansible-3")
В рамках текущего ДЗ сделано:
    * Созданные ранее плейбуки разбиты по ролям (для приложения и БД);
    * Написаны "stage" и "prod" окружения, в плейбуки добавлен вывод соответствующей
debug-информации;
    * Реализована community-роль Nginx;
    * Реализован Ansible Vault для созданных окружений;
    * В соответствии с проделанными выше изменениями модифицирован конфиг Ансибла "ansible.cfg".

==================================================================================

- Homework #11 ("ansible-4")
В рамках текущего ДЗ сделано:
    * Реализация локальной разработки с помощью Vagrant - написание конфигураций VM и их тестирование;
    * Доработка ролей "app" и "db" - добавление Ansible-провижинеров, их запуск и тестирование, реализация тасок для ролей, параметризация ролей;
    * Создание тестов для роли "db" c помощью инструментов Molecule и Testinfra; написание самих тестов, конфигураций, а также проверка успешности самого тестирования;
    * Измение плейбук "packer_db.yml" и "packer_app.yml" - теперь там используются соответствующие роли;
    * Изменение packer-образов "db" и "app" инстансов в соответствии с произведенными изменениями в плейбуках.
