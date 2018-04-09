class Resolvers::CreateTask < GraphQL::Function
  argument :title, !types.String
  argument :description, types.String
  argument :dueDate, Types::DateTimeType
  argument :categories, types[types.String]
  argument :parentId, types.Int

  type Types::TaskType

  def call(obj, args, ctx)
    task = Task.create!(title: args[:title],
                  description: args[:description],
                     due_date: args[:dueDate],
                    parent_id: args[:parentId])

    if args[:categories]
      categories = args[:categories].map { |category| Category.find_or_create_by(name: category) }
      task.categories << categories
    end

    task
  end
end
