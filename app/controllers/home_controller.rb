class HomeController < ApplicationController
  def index
    @diaries = Diary.all
    render json: @diaries, include: :notes
  end
end