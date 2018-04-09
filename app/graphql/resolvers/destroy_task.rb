class Resolvers::DestroyTask < GraphQL::Function
  argument :id, !types.ID

  type types.Boolean

  def call(obj, args, ctx)
    Task.find(args[:id]).destroy
  end
end
