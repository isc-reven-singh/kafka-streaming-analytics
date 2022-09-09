# kafka-streaming-analytics
A demonstration of how to use InterSystems IRIS Data Platform, to consume messages from Kafka and analyze this data in near real-time using the Business Intelligence capability of InterSystems IRIS.
 
 ## Prerequisites
 This demo requires that you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.
 
 ## Installation 

Clone/git pull the repo into any local directory

```
$ git clone https://github.com/isc-reven-singh/kafka-streaming-analytics.git
```

Open the terminal in this directory and run:

```
$ docker-compose build
```
Among other things, iris.script which is called by the installer, compiles the required classes for this demo and sets up the analytics components.

Run the IRIS container with your project:

```
$ docker-compose up -d

## How to Use it
### Start the InterSystems IRIS Production
Open [InterSystems IRIS Management Portal](http://localhost:52773/csp/sys/UtilHome.csp) on your browser.

The default account _SYSTEM / SYS will need to be changed at first login.
