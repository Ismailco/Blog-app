require 'rails_helper'

RSpec.feature 'Users Page' do
  feature 'shows users' do
    background do
      @user = User.create(id: 1, name: 'John', bio: 'This is my bio',
                          photo: 'icon.png')
      3.times do
        Post.create(user_id: 1, text: 'This is my post')
      end
    end

    scenario 'Shows the username' do
      expect(@user.name).to have_content('John')
    end

    scenario "Shows the user's photo" do
      all('img').each do |i|
        expect(i[:src]).to eq('icon.png')
      end
    end

    scenario 'Shows the number of posts' do
      all(:css, '.num_post').each do |post|
        expect(post).to have_content('Number of posts: 0')
      end
    end

    scenario 'Shows the bio' do
      expect(@user.bio).to have_content('This is my bio')
    end

    scenario 'shows the button to all posts' do
      @user.posts.each do |post|
        expect(post).to have_content('All posts')
      end
    end

    scenario 'shows the button to all comments' do
      @user.comments.each do |comment|
        expect(comment).to have_content('All comments')
      end
    end

    scenario 'shows the button to all likes' do
      @user.likes.each do |like|
        expect(like).to have_content('All likes')
      end
    end
  end
end
