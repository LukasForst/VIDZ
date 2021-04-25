Class Integration.Message.CreatePatientResponse Extends Ens.Response [ ProcedureBlock ]
{

Property MPIID As %String;

Storage Default
{
<Data name="CreatePatientResponseDefaultData">
<Subscript>"CreatePatientResponse"</Subscript>
<Value name="1">
<Value>MPIID</Value>
</Value>
</Data>
<DefaultData>CreatePatientResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
