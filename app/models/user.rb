class User < ApplicationRecord
<<<<<<< HEAD
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :event_attendees, foreign_key: 'event_attendee_id'
  has_many :attended_events, through: :event_attendees
  

  validates :email, length: { in: 4..30 }, presence: true, uniqueness: true
=======
>>>>>>> e9a8631ddc080552622acff5a869b6af5fbd5ef8
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :attended_events, through: :invitations
  has_many :invitations, foreign_key: 'attendee_id'

  validates :email, length: { in: 4..30 }, presence: true, uniqueness: true
  
end
