# As a user
# So that I can choose a saved link
# I want to see a list of bookmarked links

feature 'see lists of bookmarks' do
  scenario 'on the page of links' do

    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy' )
    visit '/links'

    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content 'Makers Academy'
    end
  end
end

# As a user
# So that I can save a link for later
# I want to be able to add new links

feature 'Create a new bookmark' do
  scenario 'create a new bookmark with url and title' do
    create_bookmark
    click_button "Save Bookmark"
    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content 'Getting started with DataMapper'
    end
  end
end

# As a user
# So that I can group my links
# I want to be able to tag my links

feature 'User can add tags' do
  scenario 'when adding a new bookmark' do
    create_bookmark_with_tag('Datamapper', 'datamapper.org', 'SQL')
    link = Link.first
    expect(link.tags.map(&:name)).to include("SQL")
  end
end

# As a user
# So that I can quickly search for links by topic
# I want to be able to filter by the tag

feature 'To find links' do
  scenario 'when searching by tag' do
    create_bookmark_with_tag('bubbles website', 'bubbles.com', 'bubbles')
    create_bookmark_with_tag('Facebook', 'facebook.com', 'social media')
    visit '/tags/bubbles'
    expect(page).to have_content 'bubbles.com'
    expect(page).not_to have_content 'facebook.com'
  end
end
