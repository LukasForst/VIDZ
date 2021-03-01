1. 
```
USER > set company = ##class(Demo.Company).%New()

USER > set company.Name = "InterSystems"

USER > set company.YearsActive = 10           

USER > set company.Industry = "Technology"

USER > do company.PrintCompany()

The name of this company is InterSystems.
InterSystems has been active in the Technology industry for 10 years.
```
2.
```
USER > write company.QuarterlyProfits(10000, 50000)

-40000
```