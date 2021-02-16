class UserSerializer
  include JSONAPI::Serializer
  attributes :email, :discarded_at
end
