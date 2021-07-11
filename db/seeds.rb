require 'faker'

Diary.create!(title: Faker::Name.name, kind: :private, expiration: DateTime.now + 1.minutes)
Diary.create!(title: Faker::Name.name, kind: :private, expiration: DateTime.now + 2.minutes)
Diary.create!(title: Faker::Name.name)
Diary.create!(title: Faker::Name.name)

Diary.all.each do |diary|
  3.times do
    Note.create!(text: Faker::Name.name, diary_id: diary.id)
  end
end
