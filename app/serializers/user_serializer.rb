class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :document, :email
end
