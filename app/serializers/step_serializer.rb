class StepSerializer
  include JSONAPI::Serializer
  attributes :date, :status, :job_id, :created_at, :updated_at
  belongs_to :job
end
