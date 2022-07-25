require 'rails_helper'

RSpec.feature 'Users Page' do
  feature 'shows users' do
    background do
      @user1 = User.create(name: 'John', bio: 'This is my bio',
                           photo: 'https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png')
    end

    scenario 'Shows the username' do
      expect(@user1.name).to have_content('John')
    end

    scenario "Shows the user's photo" do
      all('img').each do |i|
        expect(i[:src]).to eq('https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png')
      end
    end

    scenario 'Shows the number of posts' do
      all(:css, '.num_post').each do |post|
        expect(post).to have_content('Number of posts: 0')
      end
    end
  end
end
