/// Dimension table for cube 'BankTrans'
/// THIS IS A GENERATED CLASS, DO NOT EDIT.<br/>
/// Generated by %DeepSee.Generator:%CreateStarTable.
Class KafkaBank.Cubes.BankTrans.Starcategory Extends %DeepSee.DimensionTable [ GeneratedBy = KafkaBank.Cubes.BankTrans.CLS, Owner = {}, ProcedureBlock ]
{

Index Primary On (Dxisfraud, Dxcategory) [ Unique ];

/// Dimension property: Dxcategory<br/>
/// Source: category
Property Dxcategory As %String(COLLATION = "SQLUPPER(113)", MAXLEN = 2000) [ Required ];

/// Dimension property: Dxisfraud<br/>
/// Source: isfraud
Property Dxisfraud As KafkaBank.Cubes.BankTrans.Starisfraud [ Required ];

/// Return the total number of members within this dimension.<br/>
/// Generated by %DeepSee.Generator:%CreateStarTable.
ClassMethod %Count() As %Integer
{
 Set tCount = 0
 &sql(SELECT COUNT(*) INTO :tCount FROM KafkaBank_Cubes_BankTrans.Starcategory)
 Quit tCount
}

/// Validate the KEY value for this dimension.<br/>
/// Generated by %DeepSee.Generator:%CreateStarTable.
ClassMethod DxcategoryIsValid(pArg As %String) As %Status
{
 Quit ##class(%DeepSee.DimensionTable).%ValidateKEY(pArg)
}

/// Return the specification string for the given member.<br/>
/// Generated by %DeepSee.Generator:%CreateStarTable.
ClassMethod %GetMemberSpec(pMemberId As %String, pCubeName As %String, pDimNo As %Integer, pHierNo As %Integer, pLevelNo As %Integer) As %String
{
 Set tSpec = ""
 Set:pMemberId'="" tSpec = "&["_$$$dsEscapeIdent(..DxcategoryGetStored(pMemberId))_"]"
 Quit tSpec
}

/// Fetch the value of a given dimension property.<br/>
/// Generated by %DeepSee.Generator:%CreateStarTable.
ClassMethod %GetDimensionProperty(pProp As %String, pID As %String, Output pFormat As %String, Output pType As %String) As %String
{
 Set pProp = $$$UPPER(pProp)
 Set tValue=""
 Set pFormat=""
 If (pProp="DXCATEGORY") {
  &sql(SELECT Dxcategory INTO :tValue FROM KafkaBank_Cubes_BankTrans.Starcategory WHERE %ID = :pID)
  Set pType="%String"
 }
 ElseIf (pProp="DXISFRAUD") {
  &sql(SELECT Dxisfraud INTO :tValue FROM KafkaBank_Cubes_BankTrans.Starcategory WHERE %ID = :pID)
  Set pType="KafkaBank.Cubes.BankTrans.Starisfraud"
 }
 Quit tValue
}

Parameter CUBENAME = "BankTrans";

Parameter DESCRIPTIONPROPERTY;

Parameter KEYPROPERTY = "Dxcategory";

ForeignKey Dxisfraud(Dxisfraud) References KafkaBank.Cubes.BankTrans.Starisfraud() [ NoCheck ];

Storage Default
{
<Data name="StarcategoryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Dxcategory</Value>
</Value>
<Value name="3">
<Value>Dxisfraud</Value>
</Value>
</Data>
<DataLocation>^DeepSee.Dimension("KAFKABANK.CUBES.BANKTRANS.STARCATEGORY")</DataLocation>
<DefaultData>StarcategoryDefaultData</DefaultData>
<ExtentSize>100</ExtentSize>
<IdLocation>^DeepSee.Dimension("KAFKABANK.CUBES.BANKTRANS.STARCATEGORY")</IdLocation>
<IndexLocation>^DeepSee.DimensionI("KAFKABANK.CUBES.BANKTRANS.STARCATEGORY")</IndexLocation>
<StreamLocation>^DeepSee.DimensionS("KAFKABANK.CUBES.BANKTRANS.STARCATEGORY")</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
