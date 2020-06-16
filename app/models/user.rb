class User < ApplicationRecord
  has_many :events

  validates :name, presence: true, length: {maximum: 40}
  validates :email, presence: true, uniqueness: true, format: {with: /.+@.+\..+/}
end
