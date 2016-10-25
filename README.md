# Symfony 3 API Template
===

This is a Symfony 3 project template used as a Rest(full?) API

## Steps
* Clone the project
* cd into the project
* `php bin/console doctrine:database:create` will create your mysql database (check the symfony configuration)
* `php bin/console doctrine:schema:create` will create your mysql schema
* `php bin/console server:run` 
* Test with http://localhost:8000/datas. You should have an empty array

## Tips
* Set the [Symfony var env](https://symfony.com/doc/current/configuration/environments.html#selecting-the-environment-for-console-commands) (SYMFONY_ENV and SYMFONY_DEBUG)
* For apache servers, you can update the [.htaccess](https://github.com/Plimsky/symfony-3-api-template/blob/master/web/.htaccess) into the web folder. You will be able to load directly with the app_dev.php with your dev machine (for instance here the app_dev.php is used for docker.local url or 127.0.0.1)
