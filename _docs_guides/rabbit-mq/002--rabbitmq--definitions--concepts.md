

What RabbitMQ is
================
*   RabbitMQ is a message broker, meaning it accepts, stores, and forwards messages
    *   messages being binary blobs of data
*   Analogy: RabbitMQ is sort of like the postal service

*   Put simply, RabbitMQ is used to receive & queue up messages from apps & send them to other apps

Definitions
-----------
*   Producing:      sending
*   Producer:       program that sends messages
*   Consuming:      receiving
*   Consumer:       program that waits to receive messages. Receives data from queues (or a queue)
*   Queue:          RabbitMQ's "mailbox". The only places that can store messages. Acts as an
                    "infinite buffer" for messages. Each queue can have any number of producers
                    sending messages into it, and any number of consumers receiving data from it

Usage
-----
*   Do pub/sub between applications, even across different machines and over networks
*   Create a "round-robin" work queue where the least busy machine is assigned new tasks as they
    come into the queue
