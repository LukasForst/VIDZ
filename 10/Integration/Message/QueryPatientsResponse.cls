Class Integration.Message.QueryPatientsResponse Extends Ens.Response [ ProcedureBlock ]
{

Property Patients As array Of Integration.Types.Patient(XMLKEYNAME = "MPIID");

Storage Default
{
<Data name="Patients">
<Attribute>Patients</Attribute>
<Structure>subnode</Structure>
<Subscript>"Integration.Message.QueryPatientsResponse.Patients"</Subscript>
</Data>
<Type>%Storage.Persistent</Type>
}

}
