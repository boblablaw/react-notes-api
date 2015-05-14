module V1
  class NoteSerializer < ActiveModel::Serializer

    attributes :title, :body, :created_at, :id
    has_one :user, serializer: V1::UserSerializer

  end
end
