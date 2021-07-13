class Diary < ApplicationRecord
  has_many :notes, dependent: :destroy
  enum kind: { public: 0, private: 1 }, _prefix: true

  validates :title, :kind, presence: true
  validates :expiration, presence: true, if: proc { |diary| diary.kind_private? }
  validate :cant_set_expiration_if_kind_public, :cant_set_expiration_less_then_time_now

  def cant_set_expiration_if_kind_public
    errors.add(:expiration, 'can`t set expiration if kind public') if !expiration.blank? && kind_public?
  end

  def cant_set_expiration_less_then_time_now
    errors.add(:expiration, 'can`t set expiration less then time now') if !expiration.blank? && (expiration <= DateTime.now)
  end
end
