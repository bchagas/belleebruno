class Rsvp < ActiveRecord::Base
  STATUSES = [[YES = 0, "Claro que vou!"], [NO = 1, "Infelizmente não poderei :("]]
  GUESTS = [[YES = true, "Sim"], [NO = false, "Não"]]
end
