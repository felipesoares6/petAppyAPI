class Types::MutationType < Types::BaseObject
  graphql_name 'Mutation'

  field :createUser, function: Resolvers::CreateUser.new
  field :updateUser, function: Resolvers::UpdateUser.new
  field :signIn, function: Resolvers::SignIn.new
  field :createAnnouncement, function: Resolvers::CreateAnnouncement.new
end
