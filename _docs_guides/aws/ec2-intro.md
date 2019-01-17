EC2
===
----------------------------------------------------------------------------------------------------
What is it?
-----------
Web service providing resizable compute capacity on the cloud
-   Reduces time required to obtain and boot new server instances to minutes
    -   Lets you quickly scale capacity up and down as computing requirements change

### Economics
Has changed economics of computing by letting you pay only for the capacity you
actually use. You can do it by the hour or even the second.

Provides devs w tools 2 build failure resilient applications and isolate themselves from
common failure scenarios.

----------------------------------------------------------------------------------------------------
Pricing options
---------------
### 1. On demand
- Lets you pay a fixed rate by the hour or second w no commitment
- Best for:
    - Users that want low cost & flexibility of AWS w no upfront payment or
      long-term commitment.
    - Apps w short-term, spiky, or unpredictable workloads.
    - Apps being developed or tested on Amazon EC2 for the 1st time.

### 2. Reserved
- Provides you w a capacity reservation and offer a significant discount
  on the hourly charge for an instance. 1 year or 3 year terms.
- Best for:
    - Apps w steady state or predictable usage (like web servers).
    - Apps requiring reserved capacity.
- Users can make upfront payments to reduce total computing costs even further.

Types of reserved instances
- Standard reserved instances can be up to 75% off on-demand costs
- Convertible reserved instances: up to 54% off on-demand costs
    - Feature capability to change the attributes of the RI as long as the
      exchange results in the creation of RIs of equal or greater value
- Scheudled RIs: available to launch within the time window you reserve.
    - Lets you match your capacity reservation to a predictable recurring schedule
      that only requires a fraction of a day, week, or month.

### 3. Spot [LOOK INTO THIS]
- Lets you big whatever price you want for instance capacity, providing for
  even greater savings if your apps have flexible start & end times.
- Apps w flexible start & end times
- Apps only feasible at very low compute prices

### 4. Dedicated hosts
- Physical EC2 server dedicated for your use. Helps you reduce costs by letting you use
your existing server-bound software licenses (like Oracle).
- Useful for regulatory requirements that may not support multitenant virtualization
    -   e.g. in the health field.
- Great for licensing with doesn't support multitenancy or cloud deployments.
- Can be purchased on-demand (hourly).
- Can be purchased as a reservation for up to 70% of the on-demand price.

EC2 instance types
==================
List of types
-------------
- F1: Field programmable gate array - genomics research, big data, etc.
- I3: high speed storage - NoSQL DBs, data warehousing.
- G3: graphics intensive - video encoding.
- H1: high disk thoroughput - MapReduce-based workloads, distributed file systems
      like HDFS & MapR-FS.
- T2: lowest cost, general purpose - e.g. Web servers & small DBs.
- D2: dense storage - fileservers, data warehousing, and hadoop.
- R4: memory optimized - memory intensive apps, DBs.
- M5: General purpose - application servers.
- C5: Compute optimized - CPU intensive apps/DBs.
- P3: Graphics/General-purpose GPU - Machine learning, Bitcoin mining, etc.
- X1: Memory optimized: SAP HANA/Apache Spark, etc. These have HUGE amounts of RAM.

When the number iterates, it means the generation has gone up. The number
doesn't really matter.

Summary of instance types w/ Mneumonic
--------------------------------------
F - FPGA
I - IOPS (high-speed storage)
G - Graphics (intensive)
H - High disk throughput (e.g. for MapReduce)
T - Cheap general purpose (think T2 micro)

D - Density
R - RAM

M - Main choice for general-purpose apps
C - Compute (CPU-intensive)
P - Graphics (think Pics) / GPU
X - Extreme memory

----------------------------------------------------------------------------------------------------
EBS
===
- Elastic block storage
- Lets you create storage volumes and attach them to EC2 instances
- Once attached, you can create a file system on top of these volumes, run a DB, or use
  them in any other way you'd use a block (storage) device.
- EBS volumes are placed in a specific availability zone, where they're automatically
  replicated to protect you from the failure of a single component
- Think of it as just a disk in the cloud that you attach to your EC2 instances

Different types of EBS volumes
------------------------------
1. General purpose SSD (GP2)
    - Balances both price and performance.
    - Ratio of 3 IOPS per GB with up to 10,000 IOPS & the ability to burst up to
      3000 IOPS for extended periods of time for volumes at 3334 GiB and above.
    - Most common

2. Provisioned IOPPS SSD (IO1)
    - Designed for I/O intensive applications such as large relational or NoSQL DBs.
    - Use if you need more than 10,000 IOPS.
    - Can provision up to 20,000 IOPS per volume.

3. Throughput optimized HDD - Magnetic (ST1)
    - Big data
    - Data warehouses
    - Log processing
    - Cannot be a boot volume

4. Cold HDD - Magnetic (SC1)
    - Lowest cost storage for infrequently accessed workloads.
    - File server.
    - Cannot be a boot volume.

5. Magnetic (Standard)
    - Lowest cost per GB of all EBS volume types that is bootable.
    - Ideal for workloads where:
        - data is accessed infrequently; and
        - the lowest storage cost is important.


----------------------------------------------------------------------------------------------------
Questions
=========
What EBS type do we use?


----------------------------------------------------------------------------------------------------
Creating an EC2
===============
1. Services dropdown (topbar) -> EC2 button

2. Create Instance header -> Launch instance button

3. Select which OS to create
    - Default = Amazon Linux 2 AMI (HVM), SSD Volume Type (top one)

4. Select instance type based on your requirements (See FIGHT DR MCPX above - it
   also explains it in the leftmost column)
   - Click "Next: Configure Instance Details"

5. Configure instance details.
    - Here you can:
        - Set up spot instances, under Purchasing Option -> Request spot instances
        - To make instance reachable from the web:
          Network (row) -> Enable - or Use subnet setting (Enable)
            - Requests a public IP address from Amazon's public IP address pool (to make
              your instance reachable from the internet)
        - Shutdown behaviour:
            - Options:
                - Stop = basically pause (This is usually what we want)
                - Terminate = stop and destroy instance
            - Protect against accidental termination
                - Stops us from accidentally deleting the instance (do this in "production")
        - Monitoring: Detailed monitoring gets it to monitor every 1min instead of every 5min
        - Tenancy: Gives option to run your instances on physical servers dedicated
                   solely to your use: either creating a new one or launching it on
                   one you created before (by default it just uses shared hardware).
        - Elastic Inference: Attach low-cost GPU-powered acceleration to instance.
                             Good for machine learning.
    - When done, click "Next"

6. Add Storage
    - Click Add New Volume if you need to add more storage.
    - When done, click "Next: Add Tags"

7. Add Tags as identifiers to find your new instance
    - Can be anything you want
    - Common keys:
        - name
        - department
        - staff ID
    - When Done, click "Next: Configure Security Group"

8. Configure security group
    - Use SSH for configuring from outside (connecting via SSH).
    - Source dropdown:
        - To make it accessible to everyone: Source -> Anywhere
            - You never want this for SSH
        - To make it accessible to a specific IP: Source -> Custom
        - To make it accessible to your own machine: Source -> My IP
    - To make it accessible to web traffic, add a new row with:
        - Type: HTTP
        - Port Range: 80
        - Source: Anywhere
    - Click Launch when done

9. Create a key pair or use an existing one
    - To create a new one:
        - Select "Create a new key pair" from the dropdown
        - Give the key pair a name
        - Click Download Key Pair
        - Open the terminal, and move the downloaded file into `~/.ssh` e.g.:
          `mv ~/Downloads/my_ssh_key.pem ~/.ssh/`
        - Ensure the key is not publicly viewable e.g.:
          `chmod 400 ~/.ssh/my_ssh_key.pem`

10. View launched instance: Click View Instances button (bottom-right).

11. To connect to your instance:
    - Select your new instance from the table, and click "Connect" button.
    - Select "A standalone SSH client" from the modal.
    - Follow the instructions (especially the SSH command under "Example") in
      the modal, in your open terminal instance.
      - General form: `ssh -i "~/.ssh/my_ssh_key.pem" [username]@[Public DNS (IPv4)]`
      - Example:
        `ssh -i "~/.ssh/my_ssh_key.pem" ec2-user@ec2-54-149-235-81.us-west-2.compute.amazonaws.com`

12. Run `sudo yum update` to update the system

----------------------------------------------------------------------------------------------------
Definitions
===========
IAM role: Identity access management role.

IOPS: Input/Output Operations Per Second.

VPC: Virtual Private Cloud. Lets you use your own isolated resources within the AWS
     cloud, and then connect those resources directly to your own datacenter using
     industry-standard encrypted IPsec VPN connections. (don't worry about this)
     Virtual datacentre in the cloud that's unique to you.

Network gateways:

Route tables:

Subnets:

Tenancy:

Launch your instance into an Amazon Virtual Private Cloud (VPC).
You can create a VPC and select your own IP address range, create subnets,
configure route tables, and configure network gateways.
Learn more about Amazon VPC.


