require 'rails_helper'

RSpec.describe 'Users Page' do
  before do
    driven_by(:rack_test)
  end
  before(:each) do
    @user1 = User.create(name: 'John', bio: 'This is my bio',
                         photo: 'https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png')
  end

  describe 'Test user index' do
    it 'Shows the username' do
      expect(@user1.name).to have_content('John')
    end

    it "Shows the user's photo" do
      all('img').each do |i|
        expect(i[:src]).to eq('https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png')
      end
    end

    it 'Shows the number of posts' do
      all(:css, '.num_post').each do |post|
        expect(post).to have_content('Number of posts: 0')
      end
    end
  end
end
