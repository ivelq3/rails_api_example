class DiarySerializer < ActiveModel::Serializer
  attributes :id, :title, :kind, :expiration
  has_many :notes
end
