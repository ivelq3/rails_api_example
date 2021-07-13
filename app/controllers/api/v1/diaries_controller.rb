module Api
  module V1
    class DiariesController < ApplicationController
      before_action :set_diary, only: %i[show update destroy]

      def index
        @diaries = Diary.all

        render json: @diaries
      end

      def show
        render json: @diary
      end

      def create
        @diary = Diary.new(diary_params)

        if @diary.save
          render json: @diary, status: :created, location: @diary
        else
          render json: @diary.errors, status: :unprocessable_entity
        end
      end

      def update
        if @diary.update(diary_params)
          render json: @diary
        else
          render json: @diary.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @diary.destroy
      end

      private

      def set_diary
        @diary = Diary.find(params[:id])
      end

      def diary_params
        params.require(:diary).permit(:title, :kind, :expiration)
      end
    end
  end
end
