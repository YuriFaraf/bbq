class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :event, presence: true

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: /.+@.+\..+/, unless: -> { user.present? }

  validates :user, uniqueness: {scope: :event_id}, if: -> { user.present? }
  validates :user_email, uniqueness: {scope: :event_id}, unless: -> { user.present? }
  validates :user_email, exclusion: { in: User.pluck(:email), message: :no_sub_existeduser}, on: :create, unless: -> { user.present? }
  validate :not_eventmaker, on: :create

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  def not_eventmaker
    errors.add(:user, :no_sub_eventmaker) if user == event.user
  end
end
