Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :users, !types[Types::UserType] do
    resolve ->(_obj, _args, _ctx) { User.all }
  end

  field :user, type: Types::UserType do
    argument :id, !types.ID
    resolve ->(_obj, args, _ctx) { User.find_by(id: args[:id]) }
  end

  field :announcements, !types[Types::AnnouncementType] do
    resolve ->(_obj, _args, _ctx) { Announcement.all }
  end

  field :announcement, type: Types::AnnouncementType do
    argument :id, !types.ID
    resolve ->(_obj, args, _ctx) { Announcement.find_by(id: args[:id]) }
  end
end
