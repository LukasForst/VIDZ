Class Integration.Transformation.QueryToPDQRequest Extends Ens.DataTransformDTL [ DependsOn = (Integration.Message.QueryPatientsRequest, HS.Message.PatientSearchRequest) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='Integration.Message.QueryPatientsRequest' targetClass='HS.Message.PatientSearchRequest' create='new' language='objectscript' >
<assign value='source.MRN' property='target.MRN' action='set' />
<assign value='source.AssigningAuthority' property='target.AssigningAuthority' action='set' />
<assign value='..Piece(..ConvertDateTime(source.PatientDemographics.DateOfBirth,"%Y-%m-%d","%q(3)"))' property='target.DOB' action='set' />
<assign value='source.PatientDemographics.Gender' property='target.Sex' action='set' />
<assign value='source.PatientDemographics.Name.Prefix' property='target.Prefix' action='set' />
<assign value='source.PatientDemographics.Name.FirstName' property='target.FirstName' action='set' />
<assign value='source.PatientDemographics.Name.LastName' property='target.LastName' action='set' />
<assign value='source.PatientDemographics.Name.Suffix' property='target.Suffix' action='set' />
<assign value='source.PatientDemographics.Address.Street' property='target.Street' action='set' />
<assign value='source.PatientDemographics.Address.City' property='target.City' action='set' />
<assign value='source.PatientDemographics.Address.PostalCode' property='target.Zip' action='set' />
</transform>
}

}
