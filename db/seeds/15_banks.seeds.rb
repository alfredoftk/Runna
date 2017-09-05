region = Region.first
bank_1 = Bank.create name: "Bank 1", region: region
bank_2 = Bank.create name: "Bank 2", region: region
bank_3 = Bank.create name: "Bank 3", region: region
bank_4 = Bank.create name: "Bank 4", region: region
bank_5 = Bank.create name: "Bank 5", region: region
bank_6 = Bank.create name: "Bank 6", region: region

company = Company.first
CompanyBank.create company: company, bank: bank_1
CompanyBank.create company: company, bank: bank_2
CompanyBank.create company: company, bank: bank_3

company = Company.second
CompanyBank.create company: company, bank: bank_4
CompanyBank.create company: company, bank: bank_5
CompanyBank.create company: company, bank: bank_6