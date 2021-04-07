/// App.SOAP.Service
Class App.SOAP.Service Extends %SOAP.WebService [ Language = objectscript, ProcedureBlock ]
{

/// Name of the WebService.
Parameter SERVICENAME = "Exercise07";

/// SOAP Namespace for the WebService
Parameter NAMESPACE = "http://www.fbmi.cvut.cz/fbmi-17120";

/// Namespaces of referenced classes will be used in the WSDL.
Parameter USECLASSNAMESPACES = 1;

/// QueryPatients
Method QueryPatients(mrn As %String, br As %String, firstName As %String, lastName As %String) As %ListOfDataTypes [ WebMethod ]
{
	// Using a try/except clause to catch server errors and write custom error message
	try {
        #dim response as %ListOfDataTypes = ##class(%ListOfDataTypes).%New()

        set query = "SELECT ID FROM App_Data.Patient"
        set args = 0

        if ($get(mrn) '= "") {
            set query = query _ " WHERE MRN = ?"
            set args($increment(args)) = mrn
        }
        if ($get(br) '= "") {
            if (args = 0) {
                set query = query _ " WHERE BirthNumber = ?"
            } else {
                set query = query _ " AND BirthNumber = ?"
            }
            set args($increment(args)) = br
        }
        if ($get(firstName) '= "") {
            if (args = 0) {
                set query = query _ " WHERE Name_FirstName = ?"
            } else {
                set query = query _ " AND Name_FirstName = ?"
            }
            set args($increment(args)) = firstName
        }
        if ($get(lastName) '= "") {
            if (args = 0) {
                set query = query _ " WHERE Name_LastName = ?"
            } else {
                set query = query _ " AND Name_LastName = ?"
            }
            set args($increment(args)) = lastName
        }
		
		// Query patients
		set rs = ##class(%SQL.Statement).%ExecDirect(, query, args...)
		
		// Compose result from queried info
		while rs.%Next() {
            $$$ThrowOnError(response.Insert(rs.ID))
		}

		return response
	} catch (ex) {
		return ""
	}
}

/// CreatePatient
Method CreatePatient(patient As App.Data.Patient) As %Integer [ WebMethod ]
{
	try {
		$$$ThrowOnError(patient.%Save())

		return patient.%Id()
	} catch (ex) {
		return ""
    }
}

/// RetrievePatient
Method RetrievePatient(id As %Integer) As App.Data.Patient [ WebMethod ]
{
	try {
		if ('##class(App.Data.Patient).%ExistsId(id)) {
			return ""
		}
		
		// Return patient with given ID
		return ##class(App.Data.Patient).%OpenId(id)
	} catch(ex) {
		return ""
	}
}

/// UpdatePatient
Method UpdatePatient(id As %Integer, patient As App.Data.Patient) As %Boolean [ WebMethod ]
{
	try {
		if ('##class(App.Data.Patient).%ExistsId(id)) {
			return 0
		}
		
		// Open patient with given ID
		set updatedPatient = ##class(App.Data.Patient).%OpenId(id)

        set:(patient.MRN '= "") updatedPatient.MRN = patient.MRN
        set:(patient.BirthNumber '= "") updatedPatient.BirthNumber = patient.BirthNumber
        set:(patient.DateOfBirth '= "") updatedPatient.DateOfBirth = patient.DateOfBirth
        set:(patient.Gender '= "") updatedPatient.Gender = patient.Gender
        set:(patient.Name.Prefix '= "") updatedPatient.Name.Prefix  = patient.Name.Prefix 
        set:(patient.Name.FirstName '= "") updatedPatient.Name.FirstName = patient.Name.FirstName
        set:(patient.Name.LastName '= "") updatedPatient.Name.LastName = patient.Name.LastName
        set:(patient.Name.Suffix '= "") updatedPatient.Name.Suffix = patient.Name.Suffix
        set:(patient.Address.Street '= "") updatedPatient.Address.Street = patient.Address.Street
        set:(patient.Address.City '= "") updatedPatient.Address.City = patient.Address.City
        set:(patient.Address.PostalCode '= "") updatedPatient.Address.PostalCode = patient.Address.PostalCode
        set:(patient.Address.Country '= "") updatedPatient.Address.Country = patient.Address.Country
        set:(patient.Phone '= "") updatedPatient.Phone = patient.Phone
        set:(patient.EMail '= "") updatedPatient.EMail = patient.EMail

		$$$ThrowOnError(updatedPatient.%Save())

		return 1
	} catch (ex) {
		return ""
	}
}

/// DeletePatient
Method DeletePatient(id As %Integer) As %Boolean [ WebMethod ]
{
	try {
		&sql(DELETE FROM App_Data.Patient WHERE id = :id)

		if (%ROWCOUNT = 0)  {
            return 0
		}
        
        return 1
	} catch(ex) {
        return ""
	}
}

}
