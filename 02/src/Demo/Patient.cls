/// 
Class Demo.Patient Extends Demo.Person
{

/// Description
Property MRN As %String;

Property AssigningAuthority As %String;

Index MRNAuthorityIndex On (MRN, AssigningAuthority);

Storage Default
{
<Data name="PatientDefaultData">
<Subscript>"Patient"</Subscript>
<Value name="1">
<Value>MRN</Value>
</Value>
<Value name="2">
<Value>AssigningAuthority</Value>
</Value>
</Data>
<DefaultData>PatientDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
