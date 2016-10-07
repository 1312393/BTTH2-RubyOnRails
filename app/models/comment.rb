class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user, class_name: :User, foreign_key: :user_id


end
