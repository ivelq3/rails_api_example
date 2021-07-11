class Diary < ApplicationRecord
  has_many :notes, dependent: :destroy

  enum kind: {
    public: 0,
    private: 1
  }, _prefix: true

  validates :title, :kind, presence: true
  validates :expiration, presence: true, if: proc { |diary| diary.kind_private? }
  validate :can_set_expiration_if_public, :positive_expiration

  def positive_expiration
    if !expiration.nil? && (expiration <= DateTime.now)
      errors.add(:expiration,
                 'Can`t set expiration time less then time now')
    end
  end

  def can_set_expiration_if_public
    errors.add(:expiration, 'Can`t set expiration if kind public') if !expiration.nil? && kind_public?
  end
end
