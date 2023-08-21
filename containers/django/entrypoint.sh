#!/bin/sh
python manage.py makemigrations --noinput
python manage.py makemigrations djangoapp --noinput
python manage.py migrate --noinput
python manage.py collectstatic --noinput

# Executa runserver quando a variável de ambiente DEBUG for True e gunicorn quando for False
# Observe que o shell script não pode reconhecer a expressão em [] a menos que haja um espaço entre `[` e `$DEBUG`, `1` e `]`
if [ $DEBUG = 1 ]; then
    python manage.py runserver 0.0.0.0:8000
else
    # Nome do projeto ao iniciar o gunicorn
    # usando hemobotpj como nome do projeto
    gunicorn hemobotpj.wsgi:application --bind 0.0.0.0:8000
fi
