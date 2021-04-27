Class Integration.Transformation.PIXToCreateResponse Extends Ens.DataTransformDTL [ DependsOn = (HS.Message.AddUpdateHubResponse, Integration.Message.CreatePatientResponse) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='HS.Message.AddUpdateHubResponse' targetClass='Integration.Message.CreatePatientResponse' create='new' language='objectscript' >
<assign value='source.MPIID' property='target.MPIID' action='set' />
</transform>
}

}
