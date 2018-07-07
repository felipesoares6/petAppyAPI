class Types::MutationType < Types::BaseObject
  graphql_name 'Mutation'

  field :createUser, function: Resolvers::CreateUser.new
  field :signIn, function: Resolvers::SignIn.new
end
