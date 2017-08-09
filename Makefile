BUILD_TIME := $(shell date +%FT%T%z)
PROJECT    := $(shell basename $(PWD))

.PHONY: docs test

help:
#	@echo "  env         create a development environment using virtualenv"
	@echo "  changelog   Crear un registro de cambios"
	@echo "  deps        install dependencies"
	@echo "  clean       remove unwanted files like .pyc's"
	@echo "  doc         Genera documentación sobre el proyecto"
	@echo "  graph       Genera varios gráficos del proyecto"
	@echo "  lint        check style with flake8"
	@echo "  pylint      check style with pylint"
	@echo "  test        run all your tests using py.test"

#env:
#	sudo easy_install pip && \
#	pip install virtualenv && \
#	virtualenv env && \
#	. env/bin/activate && \
#	make deps

changelog:
	git log --pretty --numstat --summary | git2cl > ChangeLog

deps:
	sudo apt install stow

doc:
	pip install epydoc -U
	epydoc -v --pdf --graph all backuppic.py && evince pdf/api.pdf

clean:
	python manage.py clean


# flake8 --doctests  --exclude=env .
# pydocstyle --explain  webpic/*py
# isort -rc

graph:
	pip install pycallgraph -U
	pycallgraph --no-groups  --max-depth 5 graphviz --tool dot -- ./autoapp.py
	pyreverse -ASmy -k  -o png webpic/ -p WebPic

lint:
	isort -rc
	flake8 --doctest .

pylint:
	find . -name "*.py" -type f -exec pylint '{}' \;

test:
	py.test -s tests

#check:
#	ejecutar serie de pruebas
#clean:
#	eliminar ficheros intermedios de la compilación
#install:
#	instalar la aplicación ya compilada en directorios estándar
#dist:
#	generar archivos de distribución de la aplicación
#distclean:
#	eliminar los archivos de distribución

