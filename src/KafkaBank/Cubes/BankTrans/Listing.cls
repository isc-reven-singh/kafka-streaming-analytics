Include %DeepSee

/// Listing table for cube 'BankTrans'.<br/>
/// THIS IS A GENERATED CLASS, DO NOT EDIT.<br/>
/// Generated by %DeepSee.Generator:%CreateFactTable.
Class KafkaBank.Cubes.BankTrans.Listing Extends %DeepSee.ListingTable [ GeneratedBy = KafkaBank.Cubes.BankTrans.CLS, ProcedureBlock ]
{

Parameter CUBENAME = "BankTrans";

Storage Default
{
<Data name="ListingDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^IRIS.Temp.DeepSee.Listing("BANKTRANS")</DataLocation>
<DefaultData>ListingDefaultData</DefaultData>
<ExtentSize>1000</ExtentSize>
<IdLocation>^IRIS.Temp.DeepSee.Listing("BANKTRANS")</IdLocation>
<IndexLocation>^KafkaBank.Cubes.Ba4EB9.ListingI</IndexLocation>
<StreamLocation>^KafkaBank.Cubes.Ba4EB9.ListingS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
