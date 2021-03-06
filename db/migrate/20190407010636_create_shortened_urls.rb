class CreateShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      t.string :original_url, null: false
      t.string :unique_key, null: false, index: { unique: true }
      t.string :access_token, null: false, index: { unique: true }
      t.integer :views_count, null: false, default: 0
      t.datetime :expires_at

      t.timestamps
    end
  end
end
