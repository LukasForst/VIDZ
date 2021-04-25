/// Created from: http://52773-1-4bfc8c7c.labs.learning.intersystems.com/csp/user/App.SOAP.Service.cls?WSDL
Class Integration.Types.Name Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter NAMESPACE = "http://www.fbmi.cvut.cz/fbmi-17120";

Parameter XMLNAME = "Name";

Parameter XMLSEQUENCE = 1;

Property Prefix As %String(MAXLEN = "", XMLNAME = "Prefix");

Property FirstName As %String(MAXLEN = "", XMLNAME = "FirstName");

Property LastName As %String(MAXLEN = "", XMLNAME = "LastName");

Property Suffix As %String(MAXLEN = "", XMLNAME = "Suffix");

Storage Default
{
<Data name="NameState">
<Value name="1">
<Value>Prefix</Value>
</Value>
<Value name="2">
<Value>FirstName</Value>
</Value>
<Value name="3">
<Value>LastName</Value>
</Value>
<Value name="4">
<Value>Suffix</Value>
</Value>
</Data>
<State>NameState</State>
<StreamLocation>^Integration.Types.NameS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
