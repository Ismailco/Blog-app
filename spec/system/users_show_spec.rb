require 'rails_helper'

RSpec.describe 'Users Page' do
  before do
    driven_by(:rack_test)
  end
  before(:each) do
    @user = User.create(id: 1, name: 'Ismail', bio: 'This is my bio',
                        photo: 'icon.png')
    3.times do
      Post.create(user_id: 1, text: 'This is my post')
    end
  end

  describe 'Test user show' do
    it 'Shows the username' do
      expect(@user.name).to have_content('Ismail')
    end

    it "Shows the user's photo" do
      all('img').each do |i|
        expect(i[:src]).to eq('icon.png')
      end
    end

    it 'Shows the number of posts' do
      all(:css, '.num_post').each do |post|
        expect(post).to have_content('Number of posts: 0')
      end
    end

    it 'Shows the bio' do
      expect(@user.bio).to have_content('This is my bio')
    end

    it 'shows the button to all posts' do
      @user.posts.each do |post|
        expect(post).to have_content('All posts')
      end
    end

    it 'shows the button to all comments' do
      @user.comments.each do |comment|
        expect(comment).to have_content('All comments')
      end
    end

    it 'shows the button to all likes' do
      @user.likes.each do |like|
        expect(like).to have_content('All likes')
      end
    end
  end
end
