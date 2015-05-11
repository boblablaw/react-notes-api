module V1
  class NotesSerializer < ActiveModel::Serializer
    
    attributes :title, :created_at, :abstract, :id
    has_one :user, serializer: V1::UserSerializer

    def abstract
      object.body_text[0..50]
    end
  end
end