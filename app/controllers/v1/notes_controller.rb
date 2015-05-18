module V1
  class NotesController < ApplicationController
    require 'pry'
    # skip_before_action :authenticate_user_from_token!, only: [:index, :show]
    # before_action :authenticate_user_from_token!
    # GET /v1/notes
    # Get all the notes
    def index
      # binding.pry
      @notes = @current_api_user.notes.includes(:user).order(updated_at: :desc).all
      render json: @notes, each_serializer: NotesSerializer
    end

    def show
      # binding.pry
      @note = @current_api_user.notes.find(params[:id])
      render json: @note, serializer: NoteSerializer
    end

    # POST /v1/notes
    # Add a new note
    def create
      @note = Note.new(note_params)

      if @note.save
        render json: @note, serializer: NoteSerializer
      else
        render json: { error: t('note_create_error') }, status: :unprocessable_entity
      end
    end
    
    private

    def note_params
      params.require(:note).permit(:title, :body).merge(user: current_user)
    end

  end
end
