class Contact < ActiveRecord::Base
	belongs_to :user

  	validates :name, presence: true
  	validates :phone, presence: true, length: { minimum: 10 }
end
