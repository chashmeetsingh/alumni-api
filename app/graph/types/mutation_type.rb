MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :CreateTag, field: TagMutations::Create.field
  field :SaveAll, field: TagMutations::SaveAll.field

  field :CreateArticle, field: ArticleMutations::Create.field
  field :UpdateArticle, field: ArticleMutations::Update.field
  field :DeleteArticle, field: ArticleMutations::Delete.field

  field :CreateSpotlightImage, field: SpotlightImageMutations::Create.field
  field :UpdateSpotlightImage, field: SpotlightImageMutations::Update.field
  field :DeleteSpotlightImage, field: SpotlightImageMutations::Delete.field

  field :UpdateProfile, field: AuthUserMutations::UpdateProfile.field

  field :RequestPasswordInstructions, field: UserMutations::RequestPasswordInstructions.field
  field :ResetPassword, field: UserMutations::ResetPassword.field
  
  field :CreateFeedback, field: FeedbackMutations::Create.field
end
