/// Description
Class Demo.Company Extends (%Persistent, %Library.Populate)
{

Property Name As %String [ Required ];

Property YearsActive As %Integer;

Property Industry As %String;

Parameter COUNTRY = "USA";

ClassMethod QuarterlyProfits(Earnings As %Integer, Expenses As %Integer) As %Integer
{
    Set profit = Earnings - Expenses
    Return profit
}

Method PrintCompany() As %Status
{
    Write !, "The name of this company is ", ..Name, "."
    Write !, ..Name, " has been active in the ", ..Industry, " industry for ", ..YearsActive, " years."
    Return $$$OK
}

Storage Default
{
<Data name="CompanyDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>YearsActive</Value>
</Value>
<Value name="4">
<Value>Industry</Value>
</Value>
</Data>
<DataLocation>^Demo.CompanyD</DataLocation>
<DefaultData>CompanyDefaultData</DefaultData>
<IdLocation>^Demo.CompanyD</IdLocation>
<IndexLocation>^Demo.CompanyI</IndexLocation>
<StreamLocation>^Demo.CompanyS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
