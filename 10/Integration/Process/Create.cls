/// 
Class Integration.Process.Create Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Integration.Message.CreatePatientRequest' response='Integration.Message.CreatePatientResponse' height='2000' width='2000' >
<context>
<property name='pixRequest' type='Integration.Message.CreatePatientRequest' instantiate='0' />
<property name='pixResponse' type='Integration.Message.CreatePatientResponse' instantiate='0' />
</context>
<sequence xend='200' yend='550' >
<transform name='Transform to PIX' class='Integration.Transformation.CreateToPIXRequest' source='request' target='context.pixRequest' xpos='200' ypos='250' />
<call name='Call PIXv3 Source Operations' target='HS.IHE.PIXv3.Source.Operations' async='1' xpos='200' ypos='350' >
<request type='HS.Message.AddUpdateHubRequest' >
<assign property="callrequest" value="context.pixRequest" action="set" />
</request>
<response type='HS.Message.AddUpdateHubResponse' >
<assign property="context.pixResponse" value="callresponse" action="set" />
</response>
</call>
<transform name='Transform to Create Respose' class='Integration.Transformation.PIXToCreateResponse' source='context.pixResponse' target='response' xpos='200' ypos='450' />
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
