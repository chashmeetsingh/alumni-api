QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'The root level query type'

  field :articles, types[ArticleType] do
    argument :tag, types.String
    resolve -> (obj, args, ctx) do
      articles = Article.all
      if args[:tag]
        tag = Tag.where(tag: args[:tag]).first
        tag.articles
      else
        articles
      end
    end
  end
  field :article, ArticleType do
    argument :id, types.ID
    resolve -> (obj, args, ctx) do
      article = Article.find_by(id: args[:id])
      article
    end
  end
  field :tags, types[TagType] do
    resolve -> (obj, args, ctx) do
      Tag.all
    end
  end
  field :tag, TagType do
    argument :id, types.ID
    resolve -> (obj, args, ctx) do
      tag = Tag.find_by(id: args[:id])
      tag
    end
  end
end
