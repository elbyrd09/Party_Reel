class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  has_one :photographer
  has_one :attendee
  has_many :attendeeshotpreferences
  has_many :shotpreferences, through: :attendeeshotpreferences
  has_one_attached :avatar

  attribute :is_photographer, :boolean

  validates :first_name, length: { minimum: 2 }, format: { with:  /\A[a-zA-Z]+\z/ }, presence: true
  validates :last_name, length: { minimum: 2 }, format: { with:  /\A[a-zA-Z|\s]+\z/ }, presence:  true
  validates :location, presence: true

   def self.find_for_facebook_oauth(auth)
    #auth is a hash (which we need to convert) from facebook to
    #collect information from (and then save) to our user_params
    user_params = auth.slice("provider", "uid")
    user_params.merge! auth.info.slice("email", "first_name", "last_name", "location")
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.where(provider: auth.provider, uid: auth.uid).first #user can be found by their uid (unique to Fbook)
    user ||= User.where(email: auth.info.email).first # OR || User did an email sign up in the past
      #where ^ also returns an array which is why we need to call .first
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      #placed a binding.pry here to determine if the user was being saved correctly
      #user.valid? is the command I used to see if the email was being passed from
      #my facebook profile
      user.save
    end

    return user
  end
end
