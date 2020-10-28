# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save :role=

  ROLES = { 0 => :guest, 1 => :user, 2 => :admin }.freeze

  def role?(role_name)
    ROLES[role] == role_name
  end

  private

  def role=(role = 1)
    self.role = role
  end
end
