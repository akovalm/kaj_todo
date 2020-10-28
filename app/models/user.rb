# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLES = { 0 => :guest, 1 => :user, 2 => :admin }.freeze

  def role?(role_name)
    ROLES[role] == role_name
  end
end
