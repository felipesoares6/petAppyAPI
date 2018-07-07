class Resolvers::CreateUser < GraphQL::Function
  AuthProviderInput = GraphQL::InputObjectType.define do
    name 'AuthProviderSignUpData'

    argument :account, Types::AuthProviderInput
  end

  argument :name, !types.String
  argument :phone, types.Int
  argument :authProvider, !AuthProviderInput

  type Types::UserType

  def call(_obj, args, _ctx)
    User.create!(
      user_args(args)
    )
  end

  def user_args(args)
    {
      name: args.name,
      phone: args.phone,
      email: args[:authProvider][:account][:email],
      password: args[:authProvider][:account][:password]
    }
  end
end
