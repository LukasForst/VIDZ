/// 
Class Integration.Process.Query Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Integration.Message.QueryPatientsRequest' response='Integration.Message.QueryPatientsResponse' height='2000' width='2000' >
<context>
<property name='pdqRequest' type='HS.Message.PatientSearchRequest' instantiate='0' />
<property name='pdqResponse' type='HS.Message.PatientSearchResponse' instantiate='0' />
</context>
<sequence xend='200' yend='550' >
<transform name='Transform to PDQ Input' class='Integration.Transformation.QueryToPDQRequest' source='request' target='context.pdqRequest' xpos='200' ypos='250' >
<annotation><![CDATA[Transform Query Request to PDQ Request]]></annotation>
</transform>
<call name='PDQ Consumer Call' target='HS.IHE.PDQv3.Consumer.Operations' async='0' xpos='200' ypos='350' >
<annotation><![CDATA[Execute the Patient Demographics Query]]></annotation>
<request type='HS.Message.PatientSearchRequest' >
<assign property="callrequest" value="context.pdqRequest" action="set" />
</request>
<response type='HS.Message.PatientSearchResponse' >
<assign property="context.pdqResponse" value="callresponse" action="set" />
</response>
</call>
<transform name='Transform from PDQ Output' class='Integration.Transformation.PDQToQueryResponse' source='context.pdqResponse' target='response' xpos='200' ypos='450' >
<annotation><![CDATA[Transform PDQ Response to Query Response]]></annotation>
</transform>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
