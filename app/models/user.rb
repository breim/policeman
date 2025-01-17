# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :access_grants,
           class_name: 'Doorkeeper::AccessGrant',
           foreign_key: :resource_owner_id,
           dependent: :delete_all # or :destroy if you need callbacks

  has_many :access_tokens,
           class_name: 'Doorkeeper::AccessToken',
           foreign_key: :resource_owner_id,
           dependent: :delete_all # or :destroy if you need callbacks

  has_many :oauth_applications,
           class_name: 'Doorkeeper::Application',
           as: :owner

  has_many :projects, dependent: :delete_all

  validates :first_name, :last_name, presence: true

  def remember_me
    true
  end

  self.per_page = 10

  include PgSearch
  pg_search_scope :search, against: %i[first_name last_name email],
                           using: {
                             tsearch: { prefix: true }
                           }
end
