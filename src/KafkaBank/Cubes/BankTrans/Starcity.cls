/// Dimension table for cube 'BankTrans'
/// THIS IS A GENERATED CLASS, DO NOT EDIT.<br/>
/// Generated by %DeepSee.Generator:%CreateStarTable.
Class KafkaBank.Cubes.BankTrans.Starcity Extends %DeepSee.DimensionTable [ GeneratedBy = KafkaBank.Cubes.BankTrans.CLS, Owner = {}, ProcedureBlock ]
{

Index Primary On (Dxstate, Dxcity) [ Unique ];

/// Dimension property: Dxcity<br/>
/// Source: city
Property Dxcity As %String(COLLATION = "SQLUPPER(113)", MAXLEN = 2000) [ Required ];

/// Dimension property: Dxstate<br/>
/// Source: state
Property Dxstate As KafkaBank.Cubes.BankTrans.Starstate [ Required ];

/// Return the total number of members within this dimension.<br/>
/// Generated by %DeepSee.Generator:%CreateStarTable.
ClassMethod %Count() As %Integer
{
 Set tCount = 0
 &sql(SELECT COUNT(*) INTO :tCount FROM KafkaBank_Cubes_BankTrans.Starcity)
 Quit tCount
}

/// Validate the KEY value for this dimension.<br/>
/// Generated by %DeepSee.Generator:%CreateStarTable.
ClassMethod DxcityIsValid(pArg As %String) As %Status
{
 Quit ##class(%DeepSee.DimensionTable).%ValidateKEY(pArg)
}

/// Return the specification string for the given member.<br/>
/// Generated by %DeepSee.Generator:%CreateStarTable.
ClassMethod %GetMemberSpec(pMemberId As %String, pCubeName As %String, pDimNo As %Integer, pHierNo As %Integer, pLevelNo As %Integer) As %String
{
 Set tSpec = ""
 Set:pMemberId'="" tSpec = "&["_$$$dsEscapeIdent(..DxcityGetStored(pMemberId))_"]"
 Quit tSpec
}

/// Fetch the value of a given dimension property.<br/>
/// Generated by %DeepSee.Generator:%CreateStarTable.
ClassMethod %GetDimensionProperty(pProp As %String, pID As %String, Output pFormat As %String, Output pType As %String) As %String
{
 Set pProp = $$$UPPER(pProp)
 Set tValue=""
 Set pFormat=""
 If (pProp="DXCITY") {
  &sql(SELECT Dxcity INTO :tValue FROM KafkaBank_Cubes_BankTrans.Starcity WHERE %ID = :pID)
  Set pType="%String"
 }
 ElseIf (pProp="DXSTATE") {
  &sql(SELECT Dxstate INTO :tValue FROM KafkaBank_Cubes_BankTrans.Starcity WHERE %ID = :pID)
  Set pType="KafkaBank.Cubes.BankTrans.Starstate"
 }
 Quit tValue
}

Parameter CUBENAME = "BankTrans";

Parameter DESCRIPTIONPROPERTY;

Parameter KEYPROPERTY = "Dxcity";

ForeignKey Dxstate(Dxstate) References KafkaBank.Cubes.BankTrans.Starstate() [ NoCheck ];

Storage Default
{
<Data name="StarcityDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Dxcity</Value>
</Value>
<Value name="3">
<Value>Dxstate</Value>
</Value>
</Data>
<DataLocation>^DeepSee.Dimension("KAFKABANK.CUBES.BANKTRANS.STARCITY")</DataLocation>
<DefaultData>StarcityDefaultData</DefaultData>
<ExtentSize>100</ExtentSize>
<IdLocation>^DeepSee.Dimension("KAFKABANK.CUBES.BANKTRANS.STARCITY")</IdLocation>
<IndexLocation>^DeepSee.DimensionI("KAFKABANK.CUBES.BANKTRANS.STARCITY")</IndexLocation>
<StreamLocation>^DeepSee.DimensionS("KAFKABANK.CUBES.BANKTRANS.STARCITY")</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
