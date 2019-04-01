---
# AWS - Batch
---

-   Run a large number of tasks on a job queue

---

---

---

## Jobs

-   A unit of work that you submit to AWS Batch. e.g.:
    -   Shell script
    -   Linux executable
    -   Docker container image

### Job Definitions

-   Specifies how jobs are to be run
    -   Like a blueprint for the resources in your job
-   Specifically lets you:
    -   Supply your job with an IAM role for programmatic access to other AWS resources
    -   Specify both memory and CPU requirements
    -   Control container properties, env variables, mount points for persistent storage

### Job Queues

-   When you submit an AWS Batch job, you submit it to a particular job queue
    -   It resides there until it is scheduled onto a compute environment
-   You associate 1 or more compute environments with a job queue
    -   you can assign priority values for these compute environments, and even
        across job queues themselves
        -   e.g. you could have:
            -   A high priority queue for time-sensitive jobs
            -   A low priority queue for jobs that can run anytime, when compute resources are cheaper

---

---

---

## Compute environment

-   Set of compute resources (managed or unmanaged) used to run jobs
-   Managed compute environments let you specify desired instance types in detail e.g.:
    -   use a particular type of instance and model
    -   min, desired, max number of vCPUs for the environment
    -   percentage value for bids on the Spot Market
    -   target set of VPC subnets
-   Batch will launch, manage, and terminate EC2 instances as needed
-   Unmanaged compute environments: compute environments you manage yourself
    -   In this case you're responsible for setting up and scaling the instances
        in an Amazon ECS cluster that AWS Batch creates for you.

---

---

---

## JS API

### Set up and instantiate

-   Example:

```js
import AWS from 'aws-sdk';
const batch = new AWS.Batch({region: `us-west-2`});
batch.config.region = 'us-west-2';
```

---

---

### Get all info about a job queue (all jobs on it)

-   Grab with batch.listJobs(options, callback);

    -   Options:
        -   jobQueue - queue to get list of jobs from.
        -   jobStatus - get jobs of this status. Valid vals:
            `'SUBMITTED' | 'PENDING' | 'RUNNABLE' | 'STARTING' | 'RUNNING' | 'SUCCEEDED' | 'FAILED'`

-   Example:

```js
batch.listJobs({jobQueue: `nf`, jobStatus: `FAILED`}, (err, res) => {
    console.log(res);
});
```

-   Output example:

```js
// prettier-ignore
{jobSummaryList: [{
    jobId:        'd197aea1-06de-4970-89db-5384c5355987',
    jobName:      'temp_OTCUROOR36YMY3A5',
    createdAt:    1553687530337,
    status:       'FAILED',
    statusReason: 'Task failed to start',
    stoppedAt:    1553687625355,
    container: {
        reason: 'CannotStartContainerError: Error response from daemon: OCI runtime create failed: container_linux.go:348: starting container process caused "exec: \\"--batch-threads\\": executable file not found in $PATH": unknown',
    },
}]}
```

---

---

### Get all info about a job

-   Example:

```js
batch.listJobs({jobQueue: `nf`, jobStatus: `FAILED`}, (err, res) => {
    batch.describeJobs({jobs: [res.jobSummaryList[0].jobId]}, (err, output) => {
        console.log(output.jobs);
    });
});
```

-   Output example:

```js
// prettier-ignore
{
    jobs: [
        {
            jobName:  'temp_OTCUROOR36YMY3A5',
            jobId:    'd197aea1-06de-4970-89db-5384c5355987',
            jobQueue: 'arn:aws:batch:us-west-2:992616655840:job-queue/nf',
            status:   'FAILED',
            attempts: [
                {
                    container: {
                        containerInstanceArn: 'arn:aws:ecs:us-west-2:992616655840:container-instance/5a0e6129-120e-4a7c-a6ac-db55ab38f20f',
                        taskArn:              'arn:aws:ecs:us-west-2:992616655840:task/b200948e-c2a3-470c-8e4a-b596507f2f60',
                        reason:               'CannotStartContainerError: Error response from daemon: OCI runtime create failed: container_linux.go:348: starting container process caused "exec: \\"--batch-threads\\": executable file not found in $PATH": unknown',
                        logStreamName:        'generic/default/b200948e-c2a3-470c-8e4a-b596507f2f60',
                        networkInterfaces:    [],
                    },
                    stoppedAt:    1553687625355,
                    statusReason: 'Task failed to start',
                },
            ],
            statusReason:  'Task failed to start',
            createdAt:     1553687530337,
            retryStrategy: {attempts: 1},
            stoppedAt:     1553687625355,
            dependsOn:     [],
            jobDefinition: 'arn:aws:batch:us-west-2:992616655840:job-definition/generic:7',
            parameters: {},
            container: {
                image:  '992616655840.dkr.ecr.us-west-2.amazonaws.com/generic:latest',
                vcpus:  1,
                memory: 1024,
                command: [
                    '--batch-threads',
                    '16',
                    'nf',
                    'md',
                    '-d',
                    '/efs/tait/traj/batchtest/qchem16',
                ],
                jobRoleArn: 'arn:aws:iam::992616655840:role/ecsTaskExecutionRole',
                volumes: [
                    {host: {sourcePath: '/efs'               }, name: 'efs'    },
                    {host: {sourcePath: '/scratch'           }, name: 'scratch'},
                    {host: {sourcePath: '/opt'               }, name: 'opt'    },
                    {host: {sourcePath: '/home/ec2-user/.ssh'}, name: 'ssh'    },
                    {host: {sourcePath: '/home/ec2-user/.aws'}, name: 'aws'    },
                ],
                environment: [{name: 'PYTHONPATH', value: '/efs/release/max:${PYTHONPATH}'}],
                mountPoints: [
                    {containerPath: '/efs',                sourceVolume: 'efs'    },
                    {containerPath: '/scratch',            sourceVolume: 'scratch'},
                    {containerPath: '/opt',                sourceVolume: 'opt'    },
                    {containerPath: '/home/ec2-user/.ssh', sourceVolume: 'ssh'    },
                    {containerPath: '/home/ec2-user/.aws', sourceVolume: 'aws'    },
                ],
                ulimits:              [],
                privileged:           true,
                user:                 'ec2-user',
                reason:               'CannotStartContainerError: Error response from daemon: OCI runtime create failed: container_linux.go:348: starting container process caused "exec: \\"--batch-threads\\": executable file not found in $PATH": unknown',
                containerInstanceArn: 'arn:aws:ecs:us-west-2:992616655840:container-instance/5a0e6129-120e-4a7c-a6ac-db55ab38f20f',
                taskArn:              'arn:aws:ecs:us-west-2:992616655840:task/b200948e-c2a3-470c-8e4a-b596507f2f60',
                logStreamName:        'generic/default/b200948e-c2a3-470c-8e4a-b596507f2f60',
                networkInterfaces:    [],
            },
        },
    ];
}
```
