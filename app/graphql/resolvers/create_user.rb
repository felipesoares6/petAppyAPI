class Resolvers::CreateUser < GraphQL::Function
  AuthProviderInput = GraphQL::InputObjectType.define do
    name 'AuthProviderSignupData'

    argument :email, Types::AuthProviderEmailInput
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
      email: args[:authProvider][:email][:email],
      password: args[:authProvider][:email][:password]
    }
  end
end
