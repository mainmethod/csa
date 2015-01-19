class Farmer < User
  
  belongs_to :organization
  has_many :memberships, :through => :relationships, :source => :member
  
end