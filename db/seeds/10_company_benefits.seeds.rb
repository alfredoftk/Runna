benefit = Benefit.create name: "Días de vacaciones", region: Region.first
  benefit.benefit_details.create name: "Vacaciones", value: "15"
  benefit.benefit_details.create name: "Días comodín", value: "2"
  benefit.benefit_details.create name: "Días económicos", value: "3"

benefit = Benefit.create name: "Días por buen trabajador", region: Region.first
  benefit.benefit_details.create name: "Vacaciones", value: "20"
  benefit.benefit_details.create name: "Días comodín", value: "5"
  benefit.benefit_details.create name: "Días económicos", value: "6"
  benefit.benefit_details.create name: "Días webin", value: "1"
