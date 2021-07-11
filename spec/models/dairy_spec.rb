require 'rails_helper'

RSpec.describe Diary, type: :model do
  it 'Set kind public by default' do
    diary = Diary.create(title: Faker::Name.name)
    expect(diary.kind_public?).to be true
  end

  it 'Can`t set expiration if kind public' do
    diary = Diary.create(title: Faker::Name.name, kind: :public, expiration: DateTime.now)
    expect(diary).to be_invalid
  end

  it 'Can`t set expiration time less then time now' do
    diary = Diary.create(title: Faker::Name.name, kind: :private, expiration: DateTime.now - 1.minutes)
    expect(diary).to be_invalid
  end

  it 'Can`t set invalid format expiration' do
    diary1 = Diary.create(title: Faker::Name.name, kind: :private, expiration: '124124412415151523')
    diary2 = Diary.create(title: Faker::Name.name, kind: :private, expiration: '12-07-2021')
    expect(diary1).to be_invalid
    expect(diary2).to be_valid
  end
end
