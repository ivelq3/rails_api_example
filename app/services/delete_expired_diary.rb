class DeleteExpiredDiary
  def call
    Diary.where('expiration <= ?', DateTime.now).destroy_all
  end
end
