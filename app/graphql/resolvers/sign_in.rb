class Resolvers::SignIn < GraphQL::Function
  argument :account, !Types::AuthProviderInput

  type do
    name 'SignInPayload'

    field :token, types.String
    field :user, Types::UserType
  end

  def call(_obj, args, _ctx)
    account = args[:account]

    return unless account

    user = User.find_by email: account[:email]

    return unless user
    return unless user.authenticate(account[:password])

    crypt = ActiveSupport::MessageEncryptor.new(
      Rails.application.credentials.secret_key_base.byteslice(0..31)
    )
    token = crypt.encrypt_and_sign("user-id:#{ user.id }")

    OpenStruct.new({ user: user, token: token })
  end
end
