class Member < User
  
  has_many :farmerships, :through => :reverse_relationships, :source => :farmer
    
  def following?(farmer)
    farmerships.exists?(farmer)
  end
  
  def follow!(farmer)
    farmerships << farmer if !following?(farmer)
  end
  
  def unfollow!(farmer)
    farmerships.delete(farmer)
  end
  
end