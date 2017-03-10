def create_bookmark
  visit '/links/new'
  fill_in :title, :with => "Getting started with DataMapper"
  fill_in :url, :with => "http://datamapper.org/getting-started.html"
  # click_button "Save Bookmark"
end
