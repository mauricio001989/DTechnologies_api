class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment, :url, :document
  has_one :task
end
