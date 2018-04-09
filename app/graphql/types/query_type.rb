Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :tasks, types[Types::TaskType] do
    resolve -> (obj, args, ctx) { Task.parent_tasks }
  end

  field :tasksByStatus, types[Types::TaskType] do
    argument :status, !types.String

    resolve -> (obj, args, ctx) do
      Task.parent_tasks.where(status: args[:status])
    end
  end

  field :searchTasks, types[Types::TaskType] do
    argument :text, !types.String

    resolve -> (obj, args, ctx) do
      Task.parent_tasks
          .text_contains(args[:text])
    end
  end
end
