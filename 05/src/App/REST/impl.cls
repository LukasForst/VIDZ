/// An API for managing patients using InterSystems IRIS<br/>
/// Business logic class defined by OpenAPI in App.REST.spec<br/>
/// Updated Mar 22, 2021 19:47:12
Class App.REST.impl Extends %REST.Impl [ ProcedureBlock ]
{

/// If ExposeServerExceptions is true, then details of internal errors will be exposed.
Parameter ExposeServerExceptions = 0;

/// Returns all patients<br/>
/// The method arguments hold values for:<br/>
///     mrn, Medical Record Number<br/>
///     br, BirthNumber<br/>
///     firstName, Patient First Name<br/>
///     lastName, Patient Last Name<br/>
ClassMethod QueryPatients(mrn As %String, br As %String, firstName As %String, lastName As %String) As %DynamicObject
{
    // Using a try/except clause to catch server errors and write custom error message
    try {
        set patients = []

        set query = "SELECT * FROM App_Data.Patient"
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
        
        // Query patients.
        set rs = ##class(%SQL.Statement).%ExecDirect(, query, args...)
        
        // Compose JSON from queried info
        while rs.%Next() {
            do patients.%Push({
                "%ID":                  (rs.%Get("ID")),
                "MRN":                  (rs.%Get("MRN")),
                "BirthNumber":          (rs.%Get("BirthNumber")),
                "DateOfBirth":          (rs.%Get("DateOfBirth")),
                "Gender":               (rs.%Get("Gender")),
                "Customer": {
                    "Prefix":           (rs.%Get("Name_Prefix")),
                    "FirstName":        (rs.%Get("Name_FirstName")),
                    "LastName":         (rs.%Get("Name_LastName")),
                    "Suffix":           (rs.%Get("Name_Suffix"))
                },
                "Address": {
                    "Street":           (rs.%Get("Address_Street")),
                    "City":             (rs.%Get("Address_City")),
                    "PostalCode":       (rs.%Get("Address_PostalCode")),
                    "Country":          (rs.%Get("Address_Country"))
                },
                "Phone":                (rs.%Get("Phone")),
                "EMail":                (rs.%Get("EMail"))
            })
        }

        return patients.%ToJSON()
    } catch (ex) {
        do ..%SetStatusCode("500")
        return {"errormessage": "Server error"}
    }
}

/// Create a new patient. ID is autogenerated. Other info must be provided in the request body. Returns new patient and the URL it can be reached with<br/>
/// The method arguments hold values for:<br/>
///     body<br/>
ClassMethod CreatePatient(body As %Stream.Object) As %DynamicObject
{
    try {
		// Create new coffeemaker object
		set patient = ##class(App.Data.Patient).%New()

		// Fill new coffeemaker with data from message body
		$$$ThrowOnError(patient.%JSONImport(body))

		$$$ThrowOnError(patient.%Save())

		$$$ThrowOnError(patient.%JSONExportToString(.patientJSON))

		do ..%SetHeader("Location", %request.Application _ "patient/" _ patient.%Id())

		return patientJSON
	} catch (ex) {
		do ..%SetStatusCode("500")
		return {"errormessage": "Server error"}
    }
}

/// Retrieve existing Patient given ID. Returns Patient<br/>
/// The method arguments hold values for:<br/>
///     id, Patient ID<br/>
ClassMethod RetrievePatient(id As %Integer) As %DynamicObject
{
    try {
		if ('##class(App.Data.Patient).%ExistsId(id)) {
			do ..%SetStatusCode("404")
			return {"errormessage": "No patient with given ID"}
		}
		
		// Open patient with given ID
		set patient = ##class(App.Data.Patient).%OpenId(id)
		
		$$$ThrowOnError(patient.%JSONExportToString(.patientJSON))

		return patientJSON
		
	} catch(ex) {
		// Set error to 500 for categorical server errors
		do ..%SetStatusCode("500")
		return {"errormessage": "Server error"}
	}
}

/// Update existing patient given ID and data. Updates the overall patient info. Returns updated patient<br/>
/// The method arguments hold values for:<br/>
///     id, Patient ID<br/>
///     body, Patient Data<br/>
ClassMethod UpdatePatient(id As %Integer, body As %Stream.Object) As %DynamicObject
{
    try {
		if ('##class(App.Data.Patient).%ExistsId(id)) {
			do ..%SetStatusCode("404")
			return {"errormessage": "No patient with given ID"}
		}
		
		// Open patient with given ID
		set patient = ##class(App.Data.Patient).%OpenId(id)

 		// Refill opened patient with data from message body
		$$$ThrowOnError(patient.%JSONImport(body))
	
		$$$ThrowOnError(patient.%Save())
	
		$$$ThrowOnError(patient.%JSONExportToString(.patientJSON))

		return patientJSON
	
	} catch (ex) {
		do ..%SetStatusCode("500")
		return {"errormessage": "Server error"}
	}
}

/// Delete existing Patient with given ID. Returns deleted patient<br/>
/// The method arguments hold values for:<br/>
///     id, Patient ID<br/>
ClassMethod DeletePatient(id As %Integer) As %DynamicObject
{
    try {
		&sql(DELETE FROM App_Data.Patient WHERE id = :id)

		if (%ROWCOUNT = 0)  {
			do ..%SetStatusCode("404")
			return {"errormessage": "No patient with given ID"}
		}
        
        return {}
	} catch(ex) {
		do ..%SetStatusCode("500")
		return {"errormessage": "Server error"}
	}
}

}