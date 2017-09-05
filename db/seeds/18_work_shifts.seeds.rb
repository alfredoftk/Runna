region = Region.first
work_shift_1 = WorkShift.create name: "Diurna", region: region
work_shift_2 = WorkShift.create name: "Nocturna", region: region
work_shift_3 = WorkShift.create name: "Mixta", region: region
work_shift_4 = WorkShift.create name: "Por hora", region: region
work_shift_5 = WorkShift.create name: "Reducida", region: region
work_shift_6 = WorkShift.create name: "Continuada", region: region
work_shift_7 = WorkShift.create name: "Partida", region: region
work_shift_8 = WorkShift.create name: "Por turnos", region: region
work_shift_9 = WorkShift.create name: "Otra Jornada", region: region

company = Company.first
CompanyWorkShift.create company: company, work_shift: work_shift_1
CompanyWorkShift.create company: company, work_shift: work_shift_2
CompanyWorkShift.create company: company, work_shift: work_shift_3
CompanyWorkShift.create company: company, work_shift: work_shift_4

company = Company.second
CompanyWorkShift.create company: company, work_shift: work_shift_5
CompanyWorkShift.create company: company, work_shift: work_shift_6
CompanyWorkShift.create company: company, work_shift: work_shift_7
CompanyWorkShift.create company: company, work_shift: work_shift_8
CompanyWorkShift.create company: company, work_shift: work_shift_9
