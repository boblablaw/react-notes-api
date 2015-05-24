module V1
  class NotesController < ApplicationController
    require 'pry'
    before_action :find_note, only: [:show, :update, :destroy]

    # GET /v1/notes
    # Get all the notes
    def index
      @notes = @current_api_user.notes.includes(:user).order(updated_at: :desc).all
      render json: @notes, each_serializer: NotesSerializer
    end

    def show
      render json: @note, serializer: NoteSerializer
    end

    def update
      if @note.update(note_params)
        render json: @note, serializer: NoteSerializer
      else
        render json: { error: t('note_destroy_error') }, status: :unprocessable_entity
      end
    end

    def destroy
      if @note.destroy
        render json: { message: 'Deleted Successfully' }
      else
        render json: { error: t('note_destroy_error') }, status: :unprocessable_entity
      end
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

    def find_note
      @note = @current_api_user.notes.find(params[:id])
    end
  end
end
