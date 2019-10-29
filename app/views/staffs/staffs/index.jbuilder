json.array! @staffs do |staff|
  json.extract! staff, :id, :fullname, :email, :phone
end
