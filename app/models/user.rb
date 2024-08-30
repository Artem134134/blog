# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy 
  has_many :comments, dependent: :destroy 

  before_save :set_gravatar_hash, if: :email_changed?

  private 

  def set_gravatar_hash
    return if email.blank?

    hash = Digest::MD5.hexdigest(email.strip.downcase)
    self.gravatar_hash = hash
  end
end
