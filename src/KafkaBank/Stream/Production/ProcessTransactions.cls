Class KafkaBank.Stream.Production.ProcessTransactions Extends Ens.BusinessProcess [ ClassType = persistent ]
{

Property TargetConfigName As Ens.DataType.ConfigName;

Property Topic As %String;

Parameter SETTINGS = "TargetConfigName:Basic:selector?multiSelect=1&context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId},Topic:Basic";

Method OnRequest(pRequest As EnsLib.Kafka.Message, Output pResponse As Ens.Response) As %Status
{
	// Change topic and send it to target
	
	set trans = ##class(KafkaBank.Trans).%New() 
	set sc = trans.%JSONImport(pRequest.value)


	Set tMsg = ##class(EnsLib.Kafka.Message).%New()
	Set tMsg.topic = ..Topic
	Set tMsg.key = pRequest.key
	Set tMsg.value = "Processed Transaction "_trans.transnum
	do ..SendRequestAsync(..TargetConfigName, tMsg, 0)
	set sc = trans.%Save()
		

	Quit $$$OK
}

Storage Default
{
<Data name="ProcessTransactionsDefaultData">
<Subscript>"ProcessTransactions"</Subscript>
<Value name="1">
<Value>TargetConfigName</Value>
</Value>
<Value name="2">
<Value>Topic</Value>
</Value>
</Data>
<DefaultData>ProcessTransactionsDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
