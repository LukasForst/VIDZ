/// Created from: http://52773-1-4bfc8c7c.labs.learning.intersystems.com/csp/user/App.SOAP.Service.cls?WSDL
Class Integration.Types.Patient Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter NAMESPACE = "http://www.fbmi.cvut.cz/fbmi-17120";

Parameter XMLNAME = "Patient";

Parameter XMLSEQUENCE = 1;

Property DateOfBirth As %String(MAXLEN = "", XMLNAME = "DateOfBirth");

Property Gender As %String(MAXLEN = "", VALUELIST = ",M,F,O,U", XMLNAME = "Gender");

Property Name As Integration.Types.Name(XMLNAME = "Name");

Property Address As Integration.Types.Address(XMLNAME = "Address");

Storage Default
{
<Data name="PatientState">
<Value name="1">
<Value>DateOfBirth</Value>
</Value>
<Value name="2">
<Value>Gender</Value>
</Value>
<Value name="3">
<Value>Name</Value>
</Value>
<Value name="4">
<Value>Address</Value>
</Value>
</Data>
<State>PatientState</State>
<StreamLocation>^Integration.Types.PatientS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
