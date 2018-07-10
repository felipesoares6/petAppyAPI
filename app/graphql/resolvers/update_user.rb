class Resolvers::UpdateUser < GraphQL::Function
  argument :id, !types.ID
  argument :name, types.String
  argument :phone, types.Int
  argument :email, types.String

  type Types::UserType

  def call(_obj, args, ctx)
    user = find_user(args[:id])

    if user?(user, ctx[:current_user])
      User.update(user.id, args.to_h)
    else
      GraphQL::ExecutionError.new('Not Authorized: You can\'t edit this user')
    end
  end

  private

  def user?(user, current_user)
    user.id == current_user.id
  end

  def find_user(id)
    User.find_by(id: id)
  end
end
