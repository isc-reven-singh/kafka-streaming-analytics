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
```

## How to Use it

### Start Kafka
----------------------
#### EXECUTE 4x CONTAINER SHELLS:

- Shell 1 : Start Zookeeper
- Shell 2 : Start Kafka Broker
- Shell 3 : Create Topics and produce events
- Shell 4 : Consume events


```
docker-compose exec iris bash
```

#### START THE KAFKA ENVIRONMENT
##### Shell 1 
Start Zookeeper
```
zookeeper-server-start.sh /kafka/kafka_2.13-3.0.1/config/zookeeper.properties
```
##### Shell 2 
Start Kafka Broker
```
kafka-server-start.sh /kafka/kafka_2.13-3.0.1/config/server.properties
```
##### Shell 3 
Create a topic for incoming credit card transactions
```
kafka-topics.sh --create --topic cctransactions --bootstrap-server localhost:9092
```
Create a topic for notifications of transaction that have been processed
```
kafka-topics.sh --create --topic agentworklist --bootstrap-server localhost:9092
```
Describe a topic
```
kafka-topics.sh --describe --topic cctransactions --bootstrap-server localhost:9092
```
Produce events to the topic
```
kafka-console-producer.sh --topic cctransactions --bootstrap-server localhost:9092
```
##### Shell 4 
Consume events from a topic
```
bin/kafka-console-consumer.sh --topic agentworklist --bootstrap-server localhost:9092
```

### Start the InterSystems IRIS Production
------------------------------------------
Open [InterSystems IRIS Management Portal](http://localhost:52773/csp/sys/UtilHome.csp) on your browser.

The default account _SYSTEM / SYS will need to be changed at first login.

Start the Production [KafkaBank.Stream.Production](http://localhost:52773/csp/kafkabank/EnsPortal.ProductionConfig.zen?PRODUCTION=KafkaBank.Stream.Production) by clicking the "Start" button.

This Production consumes messages from the _"cctransactions"_ topic, processes the message and produces an output to the _"agentworklist"_ topic.
