module V1
  class NoteSerializer < ActiveModel::Serializer

    attributes :title, :body_html, :body_text, :created_at, :id
    has_one :user, serializer: V1::UserSerializer

  end
end