---
# AWS - Lambda
---

-   Compute service where you can upload your code and create a Lambda function
-   It looks after the server etc. for you - "serverless" computing.

---

## Uses

-   Event-driven compute service where it runs your code in response to events e.g.:
    -   Changes to data in an Amazon S3 bucket or DynamoDB table
-   Compute service to run your code in response to HTTP requests using API Gateway
    or API calls made using AWS SDKs

---

## Examples

-   User uploads image to S3 bucket:
    -   Lambda triggered that reads the image metadata, generates text from it,
        and puts the text over the image, creating a meme
-   Lambdas can trigger other lambdas e.g.:
    -   In the previous example another lambda could be triggered by the first lambda
        that triggers cross-region replication and stores the meme in another region.

### As a compute function

-   User sends request to API gateway
    -   API gateway proxies that to a Lambda, which runs code on the request and
        returns the result to the user

---

## Traditional vs service architecture

### Traditional architecture

-   User sends request, request hits load balancer, request send to backend server,
    which talks to the database, etc., and eventually returns a response to the user.
-   You rely on the "physical" world

### Service architecture
-   Send a response to API gateway, API gateway bounces request around AWS
    services, directed by AWS Lambda.
-   WIP - see https://www.udemy.com/aws-certified-solutions-architect-associate/learn/v4/t/lecture/13888030?start=400

How-to:
Create a Lambda Function with the Console:
    https://docs.aws.amazon.com/lambda/latest/dg/getting-started-create-function.html
Building Lambda functions:
https://docs.aws.amazon.com/lambda/latest/dg/lambda-app.html
