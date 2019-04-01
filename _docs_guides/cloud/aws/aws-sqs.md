---
# AWS - SQS
---

-   Distributed message queue system

-   Basically:

    -   Component 1 (e.g. a server) puts a message in
    -   Component 2 goes and retrieves it later

-   Web service that gives you access to a message queue that can be used to
    store messages while waiting for a computer to process them

-   Queue = temporary repository for messages awaiting processing

-   Pull-based, not push-based
    -   SNS does push-based, not SQS

---

## SQS Examples

### SQS Example 1

-   User visits a meme website
    -   uploads an image and separate text to an S3 bucket
    -   Uploading the image & text triggers a lambda function
    -   Lambda function stores the image location & text in SQS
    -   Fleet of EC2 instances polls the SQS queue looking for messages (e.g. behind an autoscaling group whatever)
        -   When they get a message, they take the message from the SQS queue and
            create a single "meme" image from the image and text

### SQS Example 2

-   User wants to book a trip, puts a query into the service with date & location
    -   EC2 instance receives it, and stores it in an SQS queue
    -   Fleet of EC2 instances poll the SQS queue and retrieve the message from it
        when they observe it.
    -   Each EC2 instance asks a specific airline about trip availability on
        receiving the message
    -   They then send the information back to the web server
        -   Web server then sends it back to the user

---

## What is SQS?

-   Lets you decouple the components of an application so they run independently
    -   This eases messages management between components
    -   Any component of a distributed application can store messages in a
        fail-safe queue

---

## Messages

-   Any component can retrieve a message programmatically with the Amazon SQS API
-   Can contain up to 256 kb of text in any format
    -   If you need to go over that, you can go up to 2GB in size
        -   These then get stored on S3
    -   If its 256kb or under, it gets stored on the SQS queue itself

### Message retention

-   Messages can be kept in the queue any length of time from 1min to 14 days
-   Default retention period: 4 days

---

## Queue

-   Acts as a buffer between the component producing data (producer) & the
    component saving data (consumer)
-   Resolves issues that arise if:
    -   The producer is producing work faster than the consumer can process it
    -   The producer or consumer are only intermittently connected to the network.

## Visibility Time Out

-   Amount of time the message is invisible in the SQS queue after a reader picks up
    that message

---

## Queue types

### Standard

-   Nearly-unlimited transactions / second
-   Guarantee a message will be delivered at least once
-   However, sometimes more than one copy might be delivered out of order
    -   And might be delivered more than once

### FIFO

-   Exactly-once processing - no duplicates
-   Strict order
-   Limited to 300 transactions / second
-   Allow multiple ordered message groups with a single queue
