class User < ApplicationRecord

  has_many :project_users
  has_many :projects, :through => :project_users
  enum user_type: {  developer: 0, manager: 1, qa: 2 }

  has_many :bugs

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
