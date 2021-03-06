module Api
  module V1
    class NotesController < ApplicationController
      before_action :set_note, only: %i[show update destroy]

      def index
        @notes = Note.all

        render json: @notes
      end

      def show
        render json: @note
      end

      def create
        @note = Note.new(note_params)

        if @note.save
          render json: @note, status: :created, location: @note
        else
          render json: @note.errors, status: :unprocessable_entity
        end
      end

      def update
        if @note.update(note_params)
          render json: @note
        else
          render json: @note.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @note.destroy
      end

      private

      def set_note
        @note = Note.find(params[:id])
      end

      def note_params
        params.require(:note).permit(:text, :diary_id)
      end
    end
  end
end
