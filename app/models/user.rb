class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]


  # devise :omniauthable, :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable, authentication_keys: [:login], omniauth_providers: [:google_oauth2]
  # validates :username, presence: true, uniqueness: { case_sensitive: false }
  # # app/models/user.rb
  has_many :articles
  has_many :groups
  validate :validate_username
  has_many :user_groups,  dependent: :destroy
  has_many :groups, through: :user_groups,  dependent: :destroy
  has_many :comments , dependent: :destroy
  has_one_attached :image
  def validate_username
    if User.where(email: user_name).exists?
      errors.add(:user_name, :invalid)
    end
  end

  attr_writer :login

  def login
    @login || self.user_name || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(user_name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.user_name = auth.info.name # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
