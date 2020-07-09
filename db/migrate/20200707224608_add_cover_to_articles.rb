class AddCoverToArticles < ActiveRecord::Migration[6.0]
  def change
    add_attachment :articles, :cover
    # rails g migration add_cover_to_articles
  end
end
