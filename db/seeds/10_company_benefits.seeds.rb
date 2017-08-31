first_benefit = Benefit.create name: "Beneficio estándar 1", region: Region.first
  first_benefit.benefit_details.create name: "Vacaciones", value: "15"
  first_benefit.benefit_details.create name: "Días comodín", value: "2"
  first_benefit.benefit_details.create name: "Días económicos", value: "3"

second_benefit = Benefit.create name: "Beneficio estándar 2", region: Region.first
  second_benefit.benefit_details.create name: "Vacaciones", value: "20"
  second_benefit.benefit_details.create name: "Días comodín", value: "5"
  second_benefit.benefit_details.create name: "Días económicos", value: "6"
  second_benefit.benefit_details.create name: "Días free", value: "1"

third_benefit = Benefit.create name: "Beneficio estándar 3", region: Region.first
  third_benefit.benefit_details.create name: "Vacaciones", value: "8"
  third_benefit.benefit_details.create name: "Días comodín", value: "5"
  third_benefit.benefit_details.create name: "Días económicos", value: "5"

fourth_benefit = Benefit.create name: "Beneficio estándar 4", region: Region.first
  fourth_benefit.benefit_details.create name: "Vacaciones", value: "10"
  fourth_benefit.benefit_details.create name: "Días comodín", value: "1"
  fourth_benefit.benefit_details.create name: "Días económicos", value: "1"

tk = Company.find_by(subdomain: "tk")
  tk.company_benefits.create benefit: first_benefit
  tk.company_benefits.create benefit: second_benefit

lab = Company.find_by(subdomain: "01labs")
  lab.company_benefits.create benefit: third_benefit
  lab.company_benefits.create benefit: fourth_benefit
