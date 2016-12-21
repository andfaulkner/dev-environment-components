RabbitMQ - Rabbit Message Queue
===============================

Installation
------------
        brew install rabbitmq

...then add this to ~/.bash_profile (or a script it sources), with the installed version number
used instead of 3.6.4:

        RABBITMQ_HOME="/usr/local/Cellar/rabbitmq/3.6.4"
        export PATH="$PATH:$RABBITMQ_HOME/sbin"

Restart the CLI and run the following to create an empty RabbitMQ server config file:

        mkdir $RABBITMQ_HOME/etc/rabbitmq
        touch $RABBITMQ_HOME/etc/rabbitmq/rabbitmq.config

Running RabbitMQ
----------------
*   To launch the server in the foreground:

        rabbitmq-server

*   To launch the server in the background:

        rabbitmq-server -detached

*   To stop the rabbitmq server if it's running in the background:

        rabbitmqctl stop

*   To see whether rabbitmq is running:

        rabbitmqctl status

