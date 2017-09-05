region = Region.first
contract_type_1 = ContractType.create name: "Personal de base", region: region
contract_type_2 = ContractType.create name: "Personal eventual", region: region
contract_type_3 = ContractType.create name: "Personal de confianza", region: region
contract_type_4 = ContractType.create name: "Nómina de socios", region: region
contract_type_5 = ContractType.create name: "Contrato de trabajo por tiempo indeterminado", region: region
contract_type_6 = ContractType.create name: "Contrato de trabajo para obra determinada", region: region
contract_type_7 = ContractType.create name: "Contrato de trabajo por tiempo determinado", region: region
contract_type_8 = ContractType.create name: "Contrato de trabajo por temporada", region: region
contract_type_9 = ContractType.create name: "Contrato de trabajo sujeto a prueba", region: region
contract_type_10 = ContractType.create name: "Contrato de trabajo con capacitación inicial", region: region
contract_type_11 = ContractType.create name: "Modalidad de contratación por pago de hora laborada", region: region
contract_type_12 = ContractType.create name: "Modalidad de trabajo por comisión laboral", region: region
contract_type_13 = ContractType.create name: "Modalidades de contratación donde no existe relación de trabajo", region: region
contract_type_14 = ContractType.create name: "Jubilación, pensión, retiro", region: region
contract_type_15 = ContractType.create name: "Otro contrato", region: region

company = Company.first
CompanyContractType.create company: company, contract_type: contract_type_1
CompanyContractType.create company: company, contract_type: contract_type_2
CompanyContractType.create company: company, contract_type: contract_type_3
CompanyContractType.create company: company, contract_type: contract_type_4
CompanyContractType.create company: company, contract_type: contract_type_5
CompanyContractType.create company: company, contract_type: contract_type_6
CompanyContractType.create company: company, contract_type: contract_type_7

company = Company.second
CompanyContractType.create company: company, contract_type: contract_type_8
CompanyContractType.create company: company, contract_type: contract_type_9
CompanyContractType.create company: company, contract_type: contract_type_10
CompanyContractType.create company: company, contract_type: contract_type_11
CompanyContractType.create company: company, contract_type: contract_type_12
CompanyContractType.create company: company, contract_type: contract_type_13
CompanyContractType.create company: company, contract_type: contract_type_14
CompanyContractType.create company: company, contract_type: contract_type_15
