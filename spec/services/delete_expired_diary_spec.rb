RSpec.describe DeleteExpiredDiary do
  it 'Delete expired diaries' do
    diary = Diary.create(title: Faker::Name.name, kind: :private, expiration: DateTime.now + 10.minutes)

    2.times do
      Note.create(text: Faker::Name.name, diary_id: diary.id)
    end

    Timecop.freeze(DateTime.now + 10.minutes) do
      DeleteExpiredDiary.new.call
      expect(Diary.count).to eq 0
      expect(Note.count).to eq 0
    end
  end
end
