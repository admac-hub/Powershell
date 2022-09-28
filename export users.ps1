$OUpath = 'ou=O365,dc=domain_name,dc=com'
$ExportPath = 'C:\Users\a.cuko\Desktop\DEV\WorkCode\AdBook\actCloud.csv'
Get-ADUser -Filter * -SearchBase $OUpath | Select-object Name, UserPrincipalName | Export-Csv -NoType $ExportPath