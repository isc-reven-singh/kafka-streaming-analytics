Class KafkaBank.Stream.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="KafkaBank.Stream.Production" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="EnsLib.Kafka.Service" Category="" ClassName="EnsLib.Kafka.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="GroupID">mlgroup</Setting>
    <Setting Target="Adapter" Name="Topic">cctransactions</Setting>
    <Setting Target="Host" Name="TargetConfigNames">KafkaBank.Stream.Production.ProcessTransactions</Setting>
  </Item>
  <Item Name="EnsLib.Kafka.Operation" Category="" ClassName="EnsLib.Kafka.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="KafkaBank.Stream.Production.ProcessTransactions" Category="" ClassName="KafkaBank.Stream.Production.ProcessTransactions" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">EnsLib.Kafka.Operation</Setting>
    <Setting Target="Host" Name="Topic">agentworklist</Setting>
  </Item>
</Production>
}

}
