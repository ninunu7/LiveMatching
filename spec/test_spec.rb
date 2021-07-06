require 'rails_helper'

  RSpec.describe Blog, "Blogモデルに関するテスト", type: :model do
    describe 'バリデーションのテスト' do
       it "titleが空欄でないか" do
        blog = Blog.new(title: '', body:'hoge')
	      expect(blog).to be_invalid
	      expect(blog.errors[:title]).to include("can't be blank")
       end
  end
end