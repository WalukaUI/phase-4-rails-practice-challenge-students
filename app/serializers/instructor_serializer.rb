class InstructorSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :students, include_nested_associations: true
end
