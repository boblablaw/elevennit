class Post < ActiveRecord::Base
  validates :title, length: { maximum: 255 }, presence: true
  validates :body, presence: true, if: :text?
  validates :link, presence: true, if: :link?
  validates :category_id, presence: true
  enum post_type: [:link, :text]
  belongs_to :category
  default_scope { order('updated_at DESC').includes(:category) }

  self.per_page = 6
end
