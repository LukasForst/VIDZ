/// Created from: http://52773-1-4bfc8c7c.labs.learning.intersystems.com/csp/user/App.SOAP.Service.cls?WSDL
Class Integration.Types.Address Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter NAMESPACE = "http://www.fbmi.cvut.cz/fbmi-17120";

Parameter XMLNAME = "Address";

Parameter XMLSEQUENCE = 1;

Property Street As %String(MAXLEN = "", XMLNAME = "Street");

Property City As %String(MAXLEN = "", XMLNAME = "City");

Property PostalCode As %String(MAXLEN = "", XMLNAME = "PostalCode");

Property Country As %String(MAXLEN = "", XMLNAME = "Country");

Storage Default
{
<Data name="AddressState">
<Value name="1">
<Value>Street</Value>
</Value>
<Value name="2">
<Value>City</Value>
</Value>
<Value name="3">
<Value>PostalCode</Value>
</Value>
<Value name="4">
<Value>Country</Value>
</Value>
</Data>
<State>AddressState</State>
<StreamLocation>^Integration.Types.AddressS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
