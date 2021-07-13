require 'rails_helper'

describe Diary, type: :model do
  describe 'validations' do
    it 'set kind public by default' do
      diary = Diary.create(title: Faker::Name.name)
      expect(diary.kind_public?).to be true
    end

    it 'can`t set expiration if kind public' do
      diary = Diary.create(title: Faker::Name.name, kind: :public, expiration: DateTime.now)
      expect(diary).to be_invalid
    end

    it 'can`t set expiration date less then time now' do
      diary = Diary.create(title: Faker::Name.name, kind: :private, expiration: DateTime.now - 1.minutes)
      expect(diary).to be_invalid
    end

    it 'сan`t set expiration date of invalid format' do
      diary_valid = Diary.create(title: Faker::Name.name, kind: :private, expiration: DateTime.now + 1.minutes)
      diary_invalid = Diary.create(title: Faker::Name.name, kind: :private, expiration: '94899489-498498-9874848')
      expect(diary_valid).to be_valid
      expect(diary_invalid).to be_invalid
    end
  end
end
