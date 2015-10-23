class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, request_keys: [:subdomain]
  
  belongs_to :country
  belongs_to :state
  belongs_to :city

  INTERESTED_IN = ["Acting", "Cinematography", "Direction", "Editing", "Script Writing", "Singing", "Stunts"]
  PREFERED_LANGUAGE = ["Hindi", "Kannada", "Malayalam", "Tamil", "Telugu"]
  GENDER = ["Male", "Female"]

  validates :name,  presence: true, length: { in: 1..250 }
  validates :phone, presence: true, length: { minimum: 10, maximum: 15 }       
  validates :gender, presence: true, inclusion: { in: GENDER }   
  validates :city, :state, :country, presence: true  
  validates :interested_in, presence: true, inclusion: { in: INTERESTED_IN }   
  validates :prefered_language, presence: true, inclusion: { in: PREFERED_LANGUAGE }      

  def self.find_for_authentication(warden_conditions)
    where(:email => warden_conditions[:email], :subdomain => warden_conditions[:subdomain]).first
  end

  def location
    "#{city.name}, #{state.name}"
  end  
end
