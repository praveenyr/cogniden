class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :wikis, dependent: :destroy

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:member)
  end

end
