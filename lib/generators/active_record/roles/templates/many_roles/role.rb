class <%= role_class %> < ActiveRecord::Base
  scope :named, lambda{|role_names| where(:name.in => role_names.flatten)}
  has_many :<%= user_class.pluralize.underscore %>, :through => :<%= user_role_class.pluralize.underscore %>
  has_many :<%= user_role_class.pluralize.underscore %>

  validates :name, :uniqueness => true
end
