Class KafkaBank.Utils.Task Extends %SYS.Task.Definition
{

Method OnTask() As %Status
{
    return ##class(%DeepSee.Utils).%SynchronizeCube("BankTrans")
}

}