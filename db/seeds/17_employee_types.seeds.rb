region = Region.first
tiempo_parcial = EmployeeType.create name: "Tiempo parcial", region: region
tiempo_completo = EmployeeType.create name: "Tiempo completo", region: region
becario = EmployeeType.create name: "Becario", region: region

company = Company.first
CompanyEmployeeType.create company: company, employee_type: tiempo_parcial
CompanyEmployeeType.create company: company, employee_type: tiempo_completo
CompanyEmployeeType.create company: company, employee_type: becario

company = Company.second
CompanyEmployeeType.create company: company, employee_type: tiempo_parcial
CompanyEmployeeType.create company: company, employee_type: tiempo_completo
CompanyEmployeeType.create company: company, employee_type: becario