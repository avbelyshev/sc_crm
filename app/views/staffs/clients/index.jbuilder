json.array! @clients do |client|
  json.id client.id
  json.fullname client.fullname
  json.email client.email
  json.phone client.phone
end
