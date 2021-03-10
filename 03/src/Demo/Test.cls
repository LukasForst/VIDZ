Class Demo.Test Extends %Persistent
{

Property FirstName As %String;

Storage Default
{
<Data name="TestDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FirstName</Value>
</Value>
</Data>
<DataLocation>^Demo.TestD</DataLocation>
<DefaultData>TestDefaultData</DefaultData>
<IdLocation>^Demo.TestD</IdLocation>
<IndexLocation>^Demo.TestI</IndexLocation>
<StreamLocation>^Demo.TestS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
