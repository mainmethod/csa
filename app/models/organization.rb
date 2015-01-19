class Organization < ActiveRecord::Base
  has_many :farmers, :table_name => 'User'
end
