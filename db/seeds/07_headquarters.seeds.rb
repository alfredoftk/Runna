headquarter_1 = Headquarter.create name: "Calle Tarata 160, Miraflores", phone: "987654321"
headquarter_2 = Headquarter.create name: "Calle Tarata 170, Miraflores", phone: "987654321"
headquarter_3 = Headquarter.create name: "Av Mariscal la Mar 1120, Miraflores", phone: "987654321"
headquarter_4 = Headquarter.create name: "Av Mariscal la Mar 1130, Miraflores", phone: "987654321"

company = Company.first
CompanyHeadquarter.create company: company, headquarter: headquarter_1
CompanyHeadquarter.create company: company, headquarter: headquarter_2

company = Company.second
CompanyHeadquarter.create company: company, headquarter: headquarter_3
CompanyHeadquarter.create company: company, headquarter: headquarter_4
