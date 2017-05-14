class Wiki < ApplicationRecord
  belongs_to :user
  
  def self.downgrade(current_user)
    current_user.wikis.each do | wiki |
      wiki.private = false
      wiki.save
    end
  end
    
end
