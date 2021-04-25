Class Integration.Message.QueryPatientsRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "App.SOAP.Message.QueryPatientsResponse";

Property MRN As %String(MAXLEN = "", XMLNAME = "MRN");

Property AssigningAuthority As %String(MAXLEN = "", XMLNAME = "AssigningAuthority");

Property PatientDemographics As Integration.Types.Patient;

Storage Default
{
<Data name="QueryPatientsRequestDefaultData">
<Subscript>"QueryPatientsRequest"</Subscript>
<Value name="1">
<Value>MRN</Value>
</Value>
<Value name="2">
<Value>AssigningAuthority</Value>
</Value>
<Value name="3">
<Value>PatientDemographics</Value>
</Value>
</Data>
<DefaultData>QueryPatientsRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
