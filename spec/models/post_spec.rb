require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  subject { Post.new(author: user, title: 'Title', text: 'This is a text') }
  # it { should belong_to(:author).class_name('User') }
  # it { should have_many(:comments).foreign_key(:post_id) }
  # it { should have_many(:likes).foreign_key(:post_id) }
  # it { should validate_presence_of(:title) }
  # it { should validate_length_of(:title).is_at_most(250) }
  # it { should validate_numericality_of(:comments_counter).only_integer.is_greater_than_or_equal_to(0) }
  # it { should validate_numericality_of(:likes_counter).only_integer.is_greater_than_or_equal_to(0) }

  describe '#last_five_comments' do
    it 'returns last five comments' do
      expect(subject.last_five_comments).to eq(subject.comments.order(created_at: :ASC).limit(5))
    end
  end

  describe 'Test validations' do
    it 'returns false if the post title is not present or "nil"' do
      subject.title = nil
      subject.likes_counter = 1
      expect(subject.valid?).to be false
    end

    it 'returns true if the post title is present' do
      subject.title = 'Ismail'
      subject.likes_counter = 1
      subject.comments_counter = 1
      expect(subject.valid?).to be true
    end

    it 'returns false if the post title is more then 250 character' do
      subject.title = 'lorem ipsum dolor sit amet consectetur
      adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna
        aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris
        nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit
         in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint
         occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum'
      subject.likes_counter = 1
      subject.comments_counter = 1
      expect(subject.valid?).to be false
    end

    it 'returns true if the comment conter greater than or equel 0' do
      subject.title = 'Ismail'
      subject.likes_counter = 1
      subject.comments_counter = 0
      expect(subject.valid?).to be true
      subject.comments_counter = 4
      expect(subject.valid?).to be true
    end

    it 'returns false if the comment conter less than 0' do
      subject.title = 'Ismail'
      subject.likes_counter = 1
      subject.comments_counter = -1
      expect(subject.valid?).to be false
    end

    it 'returns false if the comment conter is not an integer' do
      subject.title = 'Ismail'
      subject.likes_counter = 1
      subject.comments_counter = 'r'
      expect(subject.valid?).to be false
    end

    it 'returns true if the likes conter greater than or equel 0' do
      subject.title = 'Ismail'
      subject.likes_counter = 0
      subject.comments_counter = 1
      expect(subject.valid?).to be true
      subject.likes_counter = 4
      expect(subject.valid?).to be true
    end

    it 'returns false if the likes conter less than 0' do
      subject.title = 'Ismail'
      subject.likes_counter = -1
      subject.comments_counter = 0
      expect(subject.valid?).to be false
    end

    it 'returns false if the likes conter is not an integer' do
      subject.title = 'Ismail'
      subject.likes_counter = 'rr'
      subject.comments_counter = 1
      expect(subject.valid?).to be false
    end
  end
end
# RSpec.describe User, type: :model do
#   subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
#   before { subject.save }
#   describe '#last_three_posts' do
#     it 'returns last three posts' do
#       expect(subject.last_three_posts).to eq(subject.posts.reverse)
#     end
#   end

#   describe 'Test validations' do
#     it 'returns false if the user name is not present' do
#       subject.name = ''
#       subject.posts_counter = 1
#       expect(subject.valid?).to be false
#     end

#     it 'returns false if the user name is not present or "nil"' do
#       subject.name = nil
#       subject.posts_counter = 1
#       expect(subject.valid?).to be false
#     end

#     it 'returns true if the user name is present' do
#       subject.name = 'Ismail'
#       subject.posts_counter = 1
#       expect(subject.valid?).to be true
#     end
#   end
# end
