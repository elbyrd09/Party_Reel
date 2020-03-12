class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :photographer
  has_one :attendee
  has_many :attendeeshotpreferences
  has_many :shotpreferences, through: :attendeeshotpreferences

  attribute :is_photographer, :boolean

  validates :first_name, length: { minimum: 2 }, format: { with:  /\A[a-zA-Z]+\z/ }, presence: true
  validates :last_name, length: { minimum: 2 }, format: { with:  /\A[a-zA-Z|\s]+\z/ }, presence:  true
  validates :location, presence: true

end
