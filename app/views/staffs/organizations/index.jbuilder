json.array! @organizations do |organization|
  json.extract! organization, :id, :name, :legal_form, :inn, :ogrn
end
