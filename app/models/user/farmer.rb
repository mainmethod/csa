class Farmer < User
  
  has_many :memberships, :through => :relationships, :source => :member
  
end