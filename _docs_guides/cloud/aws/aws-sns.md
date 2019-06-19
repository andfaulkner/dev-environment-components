---
# AWS - SNS
---

-   Simple notification service
    -   Pushes messages (as opposed to SQS, which is pull-based).
-   Send messages (SMS, email, push notifications, messages to HTTP endpoints, etc)
    out to various endpoints & "topics" grouping endpoints

## What is it?

-   Set up, operate, and send notifications from the cloud.
-   Publish messages from an application and immediately deliver them to
    subscribers or other applications.

## Messages

-   Message types it can send:
    -   Push notifications
    -   SMS text messages
    -   Emails
    -   Messages to AWS SQS queues
    -   Messages to HTTP endpoints

## Topics

-   Topics let you group multiple recipients together
    -   Topic = access point for letting recipients dynamically subscribe for
        identical copies of the same notification.
-   One topic can support deliveries to multiple endpoint types e.g. you could
    group iOS (push notifications), Android (push notifications), and SMS recipients
-   One publish to a topic delivers appropriately formatted copies of your
    message to each subscriber.

## More info

Getting started with AWS SNS
    https://docs.aws.amazon.com/sns/latest/dg/sns-getting-started.html

Tutorial: Publishing Amazon SNS Messages Privately from Amazon VPC
    https://docs.aws.amazon.com/sns/latest/dg/sns-vpc-tutorial.html
