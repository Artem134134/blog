# frozen_string_literal: true

class User < ApplicationRecord
  enum :role, { basic: 0, moderator: 1, admin: 2, banned: 3 }, suffix: :role

  attr_accessor :old_password, :admin_edit

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :contacts, dependent: :destroy
  
  before_save :set_gravatar_hash, if: :email_changed?

  validates :role, presence: true
  validate :password_presence
  validate :correct_old_password, on: :update, if: -> { password.present? && !admin_edit }

  def guest?
    false
  end

  def author?(obj)
    obj.user == self
  end

  private

  def set_gravatar_hash
    return if email.blank?

    hash = Digest::MD5.hexdigest(email.strip.downcase)
    self.gravatar_hash = hash
  end

  def correct_old_password
    return if old_password.blank?

    if !valid_password?(old_password) 
      errors.add(:old_password, 'is incorrect')
    end
  end

  def password_presence
    errors.add(:password, :blank) if encrypted_password.blank?
  end
end
