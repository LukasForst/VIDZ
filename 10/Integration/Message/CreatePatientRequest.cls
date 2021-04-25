Class Integration.Message.CreatePatientRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "Integration.Message.CreatePatientResponse";

Property MRN As %String(MAXLEN = "", XMLNAME = "MRN");

Property AssigningAuthority As %String(MAXLEN = "", XMLNAME = "AssigningAuthority");

Property Patient As Integration.Types.Patient;

Storage Default
{
<Data name="CreatePatientRequestDefaultData">
<Subscript>"CreatePatientRequest"</Subscript>
<Value name="1">
<Value>Patient</Value>
</Value>
<Value name="2">
<Value>MRN</Value>
</Value>
<Value name="3">
<Value>AssigningAuthority</Value>
</Value>
</Data>
<DefaultData>CreatePatientRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
