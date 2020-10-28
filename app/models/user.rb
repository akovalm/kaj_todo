# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_initialize :default_role

  ROLES = { 0 => :guest, 1 => :user, 2 => :admin }.freeze

  def role?(role_name)
    ROLES[role] == role_name
  end

  private

  def default_role(role = 1)
    self.role = role
  end
end
