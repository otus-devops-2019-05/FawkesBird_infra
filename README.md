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
