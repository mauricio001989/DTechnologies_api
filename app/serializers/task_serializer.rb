class TaskSerializer < ActiveModel::Serializer
  attributes :id, :deadline, :state, :priority, :description
end
