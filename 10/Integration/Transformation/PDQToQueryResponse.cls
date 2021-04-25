Class Integration.Transformation.PDQToQueryResponse Extends Ens.DataTransformDTL [ DependsOn = (HS.Message.PatientSearchResponse, Integration.Message.QueryPatientsResponse) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='HS.Message.PatientSearchResponse' targetClass='Integration.Message.QueryPatientsResponse' create='new' language='objectscript' >
<foreach property='source.MPIIDList()' key='IterationKey' >
<assign value='##class(Integration.Types.Patient).%New()' property='target.Patients' action='set' key='source.MPIIDList.GetAt(IterationKey).MPIID' />
<if condition='source.MPIIDList.(IterationKey).DOB &apos;= ""' >
<true>
<assign value='..ConvertDateTime(source.MPIIDList.(IterationKey).DOB_",","%q(3)","%Y-%m-%d")' property='target.Patients.(source.MPIIDList.GetAt(IterationKey).MPIID).DateOfBirth' action='set' />
</true>
</if>
<assign value='source.MPIIDList.GetAt(IterationKey).Sex' property='target.Patients.(source.MPIIDList.GetAt(IterationKey).MPIID).Gender' action='set' />
<assign value='source.MPIIDList.GetAt(IterationKey).Prefix' property='target.Patients.(source.MPIIDList.GetAt(IterationKey).MPIID).Name.Prefix' action='set' />
<assign value='source.MPIIDList.GetAt(IterationKey).FirstName' property='target.Patients.(source.MPIIDList.GetAt(IterationKey).MPIID).Name.FirstName' action='set' />
<assign value='source.MPIIDList.GetAt(IterationKey).LastName' property='target.Patients.(source.MPIIDList.GetAt(IterationKey).MPIID).Name.LastName' action='set' />
<assign value='source.MPIIDList.GetAt(IterationKey).Suffix' property='target.Patients.(source.MPIIDList.GetAt(IterationKey).MPIID).Name.Suffix' action='set' />
<assign value='source.MPIIDList.GetAt(IterationKey).Addresses.(1).StreetLine' property='target.Patients.(source.MPIIDList.GetAt(IterationKey).MPIID).Address.Street' action='set' />
<assign value='source.MPIIDList.GetAt(IterationKey).Addresses.(1).City' property='target.Patients.(source.MPIIDList.GetAt(IterationKey).MPIID).Address.City' action='set' />
<assign value='source.MPIIDList.GetAt(IterationKey).Addresses.(1).PostalCode' property='target.Patients.(source.MPIIDList.GetAt(IterationKey).MPIID).Address.PostalCode' action='set' />
<assign value='source.MPIIDList.GetAt(IterationKey).Addresses.(1).Country' property='target.Patients.(source.MPIIDList.GetAt(IterationKey).MPIID).Address.Country' action='set' />
</foreach>
</transform>
}

}
