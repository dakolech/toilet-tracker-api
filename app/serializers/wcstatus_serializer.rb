class WcstatusSerializer < ActiveModel::Serializer
  attributes :id, :is_busy, :created_at
end
