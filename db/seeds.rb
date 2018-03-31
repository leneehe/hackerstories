require 'uri'
require 'action_view'
require 'action_view/helpers'
include ActionView::Helpers::DateHelper
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Get individual Stories
def save_story(id)
  # API call to get a individual story info
  response = HTTParty.get("https://hacker-news.firebaseio.com/v0/item/" + id.to_s + ".json")
  body = JSON.parse(response.body)

  # converts time from 'unix time' to 'in words'
  time = time_ago_in_words(Time.at(body["time"]))
  time.slice!("about ")
  time = time + " ago"

if body["url"]
  Story.create(
    id: id,
    title: body["title"],
    url: body["url"],
    site: body["url"].scan(URI.regexp)[0][3], # use uri library of regex
    points: body["score"],
    author: body["by"],
    time: time,
    comments: body["descendants"]
    # type: body["type"]
  )
else
  Story.create(
    id: id,
    title: body["title"],
    time: body["time"]
  )
end

end

# Get all Stories
response = HTTParty.get("https://hacker-news.firebaseio.com/v0/topstories.json")
ids = JSON.parse(response.body)

30.times do |i|
  save_story(ids[i])
end
