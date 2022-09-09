# kafka-streaming-analytics
A demonstration of how to use InterSystems IRIS Data Platform, to consume messages from Kafka and analyze this data in near real-time using the Business Intelligence capability of InterSystems IRIS.
 
 ## Prerequisites
 This demo requires that you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.
 
 ## Installation 

Clone/git pull the repo into any local directory

```
git clone https://github.com/isc-reven-singh/kafka-streaming-analytics.git
```

Open the terminal in this directory and run:

```
docker-compose build
```
Among other things, iris.script which is called by the installer, compiles the required classes for this demo and sets up the analytics components.

Run the IRIS container with your project:

```
docker-compose up -d
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
kafka-console-consumer.sh --topic agentworklist --bootstrap-server localhost:9092
```

### Start the InterSystems IRIS Production
------------------------------------------
Open [InterSystems IRIS Management Portal](http://localhost:52773/csp/sys/UtilHome.csp) on your browser.

The default account _SYSTEM / SYS will need to be changed at first login.

Start the Production [KafkaBank.Stream.Production](http://localhost:52773/csp/kafkabank/EnsPortal.ProductionConfig.zen?PRODUCTION=KafkaBank.Stream.Production) by clicking the "Start" button.

This Production consumes messages from the _"cctransactions"_ topic, processes the message and produces an output to the _"agentworklist"_ topic.


Go back to the **Shell 3**
and generate credit card transaction events, one line at a time. After each event is produced, the [KafkaBank.Stream.Production](http://localhost:52773/csp/kafkabank/EnsPortal.ProductionConfig.zen?PRODUCTION=KafkaBank.Stream.Production) consumes the message and the outut will be visible on **Shell 4** as well as in the Management Portal (Select any of the components of the production by clicking once -> On the right hand pane, select the "Messages" tab, then any of the messages in the list to explore them in depth)

```
{ "transdatetime": "2020-06-21 12:14:25", "cc_num": "2291163933867244", "merchant": "fraud_Kirlin and Sons", "category": "personal_care", "amt": 2.86, "first": "Jeff", "last": "Elliott", "gender": "M", "street": "351 Darlene Green", "city": "Columbia", "state": "SC", "zip": "29209", "lat": 33.9659, "long": -80.9355, "city_pop": 333497, "job": "Mechanical engineer", "dob": "1968-03-19", "trans_num": "2da90c7d74bd46a0caf3777415b3ebd3", "unix_time": "1371816865", "merch_lat": 33.986391, "merch_long": -81.200714, "is_fraud": true }
```
```  
{ "transdatetime": "2019-01-01 00:00:18", "cc_num": "2703186189652095", "merchant": "fraud_Rippin, Kub and Mann", "category": "misc_net", "amt": 4.97, "first": "Jennifer", "last": "Banks", "gender": "F", "street": "561 Perry Cove", "city": "Moravian Falls", "state": "NC", "zip": "28654", "lat": 36.0788, "long": -81.1781, "city_pop": 3495, "job": "Psychologist, counselling", "dob": "1988-03-09", "trans_num": "0b242abb623afc578575680df30655b9", "unix_time": "1325376018", "merch_lat": 36.011293, "merch_long": -82.048315, "is_fraud": true }
```
```
{ "transdatetime": "2019-01-01 00:00:44", "cc_num": "630423337322", "merchant": "fraud_Heller, Gutmann and Zieme", "category": "grocery_pos", "amt": 107.23, "first": "Stephanie", "last": "Gill", "gender": "F", "street": "43039 Riley Greens Suite 393", "city": "Orient", "state": "WA", "zip": "99160", "lat": 48.8878, "long": -118.2105, "city_pop": 149, "job": "Special educational needs teacher", "dob": "1978-06-21", "trans_num": "1f76529f8574734946361c461b024d99", "unix_time": "1325376044", "merch_lat": 49.159046999999994, "merch_long": -118.186462, "is_fraud": true }
```
```
{ "transdatetime": "2019-01-01 00:00:51", "cc_num": "38859492057661", "merchant": "fraud_Lind-Buckridge", "category": "entertainment", "amt": 220.11, "first": "Edward", "last": "Sanchez", "gender": "M", "street": "594 White Dale Suite 530", "city": "Malad City", "state": "ID", "zip": "83252", "lat": 42.1808, "long": -112.262, "city_pop": 4154, "job": "Nature conservation officer", "dob": "1962-01-19", "trans_num": "a1a22d70485983eac12b5b88dad1cf95", "unix_time": "1325376051", "merch_lat": 43.150704, "merch_long": -112.154481, "is_fraud": true }
```
```
{ "transdatetime": "2019-01-01 00:01:16", "cc_num": "3534093764340240", "merchant": "fraud_Kutch, Hermiston and Farrell", "category": "gas_transport", "amt": 45, "first": "Jeremy", "last": "White", "gender": "M", "street": "9443 Cynthia Court Apt. 038", "city": "Boulder", "state": "MT", "zip": "59632", "lat": 46.2306, "long": -112.1138, "city_pop": 1939, "job": "Patent attorney", "dob": "1967-01-12", "trans_num": "6b849c168bdad6f867558c3793159a81", "unix_time": "1325376076", "merch_lat": 47.034331, "merch_long": -112.561071, "is_fraud": true }
```
### View the Fraudulent Transaction Dashboard
----------------------------------------------
Open the [Fraudulent Transaction Dashboard](http://localhost:52773/csp/kafkabank/_DeepSee.UserPortal.DashboardViewer.zen?DASHBOARD=KafkaBank/TransactionsDashboard.dashboard) to view, in near real-time, a count of all transactions suspected to be fraudulent, seperated by State.

Explore the [Transaction cube](http://localhost:52773/csp/kafkabank/_DeepSee.UI.Analyzer.zen?$NAMESPACE=KAFKABANK&PIVOT=KafkaBank%2FFraudFilter.pivot) further, and build your own pivots and dashboards.

