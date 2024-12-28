class CreateBlogPosts < ActiveRecord::Migration[8.0]
  def change
    create_table :blog_posts do |t| # rubocop:disable Rails/CreateTableWithTimestamps
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
