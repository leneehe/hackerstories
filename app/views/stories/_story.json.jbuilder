json.extract! story, :id, :id, :title, :url, :site, :points, :author, :time, :comments, :created_at, :updated_at
json.url story_url(story, format: :json)
