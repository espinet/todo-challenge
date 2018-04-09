class Resolvers::UpdateTask < GraphQL::Function
  argument :id, !types.ID
  argument :title, types.String
  argument :description, types.String
  argument :status, types.String
  argument :dueDate, Types::DateTimeType
  argument :categories, types[types.String]
  argument :parentId, types.Int

  type Types::TaskType

  def call(obj, args, ctx)
    options = {}
    options[:title] = args[:title] if args[:title]
    options[:description] = args[:description] if args[:description]
    options[:status] = args[:status] if args[:status]
    options[:due_date] = args[:dueDate] if args[:dueDate]
    options[:parent_id] = args[:parentId] if args[:parentId]

    task = Task.find(args[:id])

    ActiveRecord::Base.transaction do
      task.update!(options)

      if args[:categories]
        task.task_categories.destroy_all

        categories = args[:categories].map { |category| Category.find_or_create_by(name: category) }
        task.categories << categories
      end
    end

    task
  end
end
