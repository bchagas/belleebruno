class Rsvp < ActiveRecord::Base
  validates_presence_of :name, message: "Seu nome não pode ficar em branco"
  validates_presence_of :email, message: "Seu email não pode ficar em branco"
  validates_presence_of :status, message: "Confirmação de presença não pode ficar em branco"
end
