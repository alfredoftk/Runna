  form = Form.find_by(key: 'documents_info')

Company.all.each do |company|
  company.form_fields += FormField.form_fields_by_form_id(form.id).form_fields_for_company(company)
end