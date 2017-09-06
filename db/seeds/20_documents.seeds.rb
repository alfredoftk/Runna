region = Region.first
employee_document_1 = EmployeesDocument.create name: "Copia de RFC", region: region
employee_document_2 = EmployeesDocument.create name: "Copia de CURP", region: region
employee_document_3 = EmployeesDocument.create name: "Comprobante de Seguridad Social", region: region
employee_document_4 = EmployeesDocument.create name: "Acta de Nacimiento", region: region
employee_document_5 = EmployeesDocument.create name: "Comprobante de Estudios", region: region
company_document_1 = CompaniesDocument.create name: "Acuerdo de Confidencialidad", region: region
company_document_2 = CompaniesDocument.create name: "Acuerdo de Exclusividad", region: region

company = Company.first
CompanyDocument.create company: company, document: employee_document_1
CompanyDocument.create company: company, document: employee_document_2
CompanyDocument.create company: company, document: employee_document_3
CompanyDocument.create company: company, document: company_document_1
CompanyDocument.create company: company, document: company_document_2

company = Company.second
CompanyDocument.create company: company, document: employee_document_3
CompanyDocument.create company: company, document: employee_document_4
CompanyDocument.create company: company, document: employee_document_5
CompanyDocument.create company: company, document: company_document_1
CompanyDocument.create company: company, document: company_document_2
