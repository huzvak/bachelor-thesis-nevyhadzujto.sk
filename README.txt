Samotná aplikácia sa nachádza v adresári Nevyhadzujto.sk.

PRED SAMOTNOU INŠTALÁCIOU:

Bežiacu aplikáciu s totožným kódom s tým, ktorý je na tomto CD/DVD a taktiež totožným s tým, ktorý bol odovzdaný do IS-u, môžete nájsť na tejto URL adrese: https:bc.nevyhadzujto.sk

Nie je teda nutné aplikáciu inštalovať, môžete ju rovno testovať na vyššie uvedenej URL adrese. Aplikácia na tejto URL adrese je nainštalovaná práve pre potreby tejto Bakalárskej práce, je teda dovolené komukoľvek (po zaregistrovaní sa a prihláseni) pridávať nové inzeráty a vykonávať všetky úkony, ktoré aplikácia dovoľuje.

Autor taktiež prikladá prihlasovacie údaje ako do administratorského tak aj bežného, užívateľského účtu. Nie je teda potrebné sa registrovať nanovo.

Prihlasovacie údaje:

Administrátorský učet:
	- prihlasovacie meno: devel_root
	- heslo: mercedes15

Bežný učet:
	- prihlasovacie meno: sopruso
	- heslo: mercedes15

Prístup do administračnej časti:

https://bc.nevyhadzujto.sk/admin


POŽIADAVKY PRE INŠTALÁCIU/SPUSTENIE APLIKÁCIE NA LOCALHOSTE:

Ak Vám nestačí aplikácia bežiaca na vyššie uvedenej URL adrese a chcete si ju spustiť na svojom počítači, tak je potrebné si nainštalovať Python vo verzii 2.6.1 a framework Django vo verzii 1.3, sorl-thumbnail (https://github.com/sorl/sorl-thumbnail) a PostgreSQL databázu (autor použil konkrétne verziu 8.4).

V databáze je potrebné vytvoriť nového užívateľa s menom a heslom uvedeným v súbore settings.py (súbor sa nachádza v koreni aplikácie).

Spustenie na UNIX/LINUX:
Prejdite v konzole do adresára s aplikáciou a zadajte následujúce príkaz: 

python manage.py syncdb

Ak chcete mať databázu naplnenú testovacími dátami, tak taktiež v koreni aplikácie môžete nájsť súbor db_dump.sql, ktorý je potrebné spustiť v príkazovom riadku databázy PostgreSQL a ktorý Vám naplní databázu testovacími dátami.

Následne je potrebné opäť v konzole zadať príkaz:

python manage.py runserver

Po týchto príkazoch by Vám mala aplikácia bežať v prehliadači na tejto adrese: http://localhost:8000