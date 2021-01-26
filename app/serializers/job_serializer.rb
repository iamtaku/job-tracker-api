class JobSerializer
  include JSONAPI::Serializer
  attributes :company, :position, :application_link, :status, :created_at, :updated_at
  attribute :steps do |object|
    object.steps.each do |step|
    end
  end
end
