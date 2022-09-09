/// 
Class KafkaBank.Cubes.BankTrans Extends %DeepSee.CubeDefinition [ DependsOn = KafkaBank.Trans, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="BankTrans" displayName="BankTransActions" disabled="false" abstract="false" sourceClass="KafkaBank.Trans" namedFactNums="true" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="Trans" disabled="false" hasAll="true" allCaption="All Credit Card Numbers" allDisplayName="All Credit Card Numbers" type="data" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="isfraud" disabled="false" sourceProperty="isfraud" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="15">
      </level>
      <level name="category" disabled="false" sourceProperty="category" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="3">
      </level>
      <level name="merchant" disabled="false" sourceProperty="merchant" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="4">
      </level>
      <level name="ccnum" disabled="false" sourceProperty="ccnum" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="2">
      </level>
      <level name="transdatetime" disabled="false" sourceProperty="transdatetime" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="5">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="Customer" disabled="false" hasAll="false" allCaption="All Customer" allDisplayName="Customer" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="gender" disabled="false" sourceProperty="gender" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="8">
      </level>
      <level name="state" disabled="false" sourceProperty="state" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="12">
      </level>
      <level name="city" disabled="false" sourceProperty="city" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="13">
      </level>
      <level name="street" disabled="false" sourceProperty="street" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="11">
      </level>
      <level name="zip" disabled="false" sourceProperty="zip" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="14">
      </level>
      <level name="job" disabled="false" sourceProperty="job" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="10">
      </level>
      <level name="dob" disabled="false" sourceProperty="dob" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="9">
      </level>
      <level name="last" disabled="false" sourceProperty="last" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="7">
      </level>
      <level name="first" disabled="false" sourceProperty="first" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="6">
      </level>
    </hierarchy>
  </dimension>
  <listing name="transdetails" disabled="false" listingType="table" fieldList="transnum,transdatetime,amt,category,ccnum,&quot;first&quot;,&quot;last&quot;,gender,street,city,state">
  </listing>
  <listing name="fraudmap" disabled="false" listingType="map" fieldList="merchlat,merchlong">
  </listing>
</cube>
}

Parameter DSTIME = "AUTO";

Parameter DOMAIN;

}
