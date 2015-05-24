module V1
  class NoteSerializer < ActiveModel::Serializer

    attributes :title, :body, :abstract, :updated_at, :created_at, :id
    has_one :user, serializer: V1::UserSerializer

    def abstract
      object.body[0..50]
    end
  end
end
