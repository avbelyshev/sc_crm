json.array! @equipments do |equipment|
  json.extract! equipment, :id, :name, :kind, :serial_number
end
