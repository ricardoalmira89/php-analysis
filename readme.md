1) Instalar php-ast
sudo apt install php7.2-ast
sudo service apache2 restart

2) Instalar phan para analisis de codigo estatico:
composer global require phan/phan

3) Setearlo global:
PATH=$PATH:/home/user/.config/composer/vendor/bin

4) phan --version

5) chmod +x phpan

6) ./check.sh --help
