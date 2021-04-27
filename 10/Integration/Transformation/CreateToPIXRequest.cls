Class Integration.Transformation.CreateToPIXRequest Extends Ens.DataTransformDTL [ DependsOn = (Integration.Message.CreatePatientRequest, HS.Message.AddUpdateHubRequest) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='Integration.Message.CreatePatientRequest' targetClass='HS.Message.AddUpdateHubRequest' create='new' language='objectscript' >
<assign value='source.AssigningAuthority' property='target.Facility' action='set' />
<assign value='source.AssigningAuthority' property='target.AssigningAuthority' action='set' />
<assign value='source.MRN' property='target.MRN' action='set' />
<assign value='..Piece(..ConvertDateTime(source.Patient.DateOfBirth,"%Y-%m-%d","%q(3)"))' property='target.DOB' action='set' />
<assign value='source.Patient.Gender' property='target.Sex' action='set' />
<assign value='source.Patient.Name.Prefix' property='target.Prefix' action='set' />
<assign value='source.Patient.Name.FirstName' property='target.FirstName' action='set' />
<assign value='source.Patient.Name.LastName' property='target.LastName' action='set' />
<assign value='source.Patient.Name.Suffix' property='target.Suffix' action='set' />
<assign value='source.Patient.Address.Country' property='target.Addresses.(1).State' action='set' />
<assign value='source.Patient.Address.PostalCode' property='target.Addresses.(1).PostalCode' action='set' />
<assign value='source.Patient.Address.City' property='target.Addresses.(1).City' action='set' />
<assign value='source.Patient.Address.Street' property='target.Addresses.(1).StreetLine' action='set' />
</transform>
}

}
