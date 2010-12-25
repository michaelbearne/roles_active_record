class Role < ActiveRecord::Base
  scope :named, lambda{|role_names| where(:name.in => role_names.flatten)}
  has_many :users, :through => :user_roles
  has_many :user_roles
  validates :name, :uniqueness => true
end

class UserRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
end
