Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :allUsers, !types[Types::UserType] do
    resolve ->(obj, args, ctx) { User.all }
  end
end
