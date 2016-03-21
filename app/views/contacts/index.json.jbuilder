json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :phone, :address, :note, :avatar, :user_id
  json.url contact_url(contact, format: :json)
end
