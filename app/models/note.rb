class Note < ApplicationRecord
  belongs_to :diary

  validates :text, presence: true
end