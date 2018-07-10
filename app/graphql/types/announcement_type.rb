Types::AnnouncementType = GraphQL::ObjectType.define do
  name 'Announcement'

  field :id, !types.ID
  field :pet, !types.String
  field :name, types.String
  field :description, !types.String
  field :prevalent_color, !types.String
  field :size, !types.String
  field :race, types.String
  field :user, -> { Types::UserType }, property: :user
end
