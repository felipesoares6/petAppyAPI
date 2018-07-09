class Resolvers::CreateAnnouncement < GraphQL::Function
  Pet = GraphQL::EnumType.define do
    name 'Pet'

    value 'dog', value: :dog
    value 'cat', value: :cat
  end

  Size = GraphQL::EnumType.define do
    name 'Size'

    value 'puppy', value: :puppy
    value 'medium', value: :medium
    value 'adult', value: :adult
  end

  argument :pet, !Pet
  argument :name, types.String
  argument :description, !types.String
  argument :prevalent_color, !types.String
  argument :size, !Size
  argument :race, types.String

  type Types::AnnouncementType

  def call(_obj, args, ctx)
    Announcement.create!(announcement_args(args, ctx))
  end

  def announcement_args(args, ctx)
    {
      pet: args.pet,
      name: args.name,
      description: args.description,
      prevalent_color: args.prevalent_color,
      size: args.size,
      race: args.race,
      user: ctx[:current_user]
    }
  end
end
