json.array! @clients do |client|
  json.extract! client, :id, :fullname, :email, :phone
end
