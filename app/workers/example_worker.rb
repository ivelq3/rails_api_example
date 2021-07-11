class ExampleWorker
  include Sidekiq::Worker

  def perform
    DeleteExpiredDiary.new.call
  end
end

Sidekiq::Cron::Job.create(name: 'ExampleWorker - every 10min', cron: '*/10 * * * *', class: 'ExampleWorker')
