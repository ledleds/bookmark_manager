def create_bookmark
  visit '/links/new'
  fill_in :title, :with => "Getting started with DataMapper"
  fill_in :url, :with => "http://datamapper.org/getting-started.html"
  # click_button "Save Bookmark"
end

def create_bookmark_with_tag(title, url, tag)
  visit '/links/new'
  fill_in :title, with: title
  fill_in :url, with: url
  fill_in :tags, with: tag
  click_button "Save Bookmark"
end
