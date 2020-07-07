class User < ApplicationRecord
  has_many :created_events, foreign_key: :event_creator_id
  has_many :attended_events, through: :created_events
  
  attr_writer :login

  def login
    @login || username || email
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    conditions[:email].downcase! if conditions[:email]
    where(conditions.to_h).first

    if login == conditions.delete(:login)
      where(conditions.to_h).where(['lower(username) = :value OR lower(email) = :value', { value: login.downcase }])
    else 
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    
      # elsif conditions.key?(:username) || conditions.has_key(:email)
    #   where(conditions.to_h).first
    end
  end

  validates :username, presence: true, uniqueness: { case_sensitive: false }

  validate :validate_username

  def validate_username
    errors.add(:username, :invalid) if User.where(email: username).exists?
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
