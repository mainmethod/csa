class Farmer < User
  
  def self.model_name
    User.model_name
  end
  
  belongs_to :organization
  has_many :memberships, :through => :relationships, :source => :member
  
end