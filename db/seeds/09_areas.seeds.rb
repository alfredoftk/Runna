area_1 = Area.create name: "Área 1"
area_2 = Area.create name: "Área 2"
area_3 = Area.create name: "Área 3"
area_4 = Area.create name: "Área 4"

company = Company.first
CompanyArea.create company: company, area: area_1
CompanyArea.create company: company, area: area_2

company = Company.second
CompanyArea.create company: company, area: area_3
CompanyArea.create company: company, area: area_4