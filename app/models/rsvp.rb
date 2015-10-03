class Rsvp < ActiveRecord::Base
  validates :name, :email, :status, :guest, presence: true
  validates_uniqueness_of :email
  serialize :guest_name, Array

  STATUSES = [[YES = 0, "Claro que vou!"], [NO = 1, "Infelizmente não poderei :("]]
end
