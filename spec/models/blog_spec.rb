require 'rails_helper'

  RSpec.describe Blog, "Blogモデルのテスト", type: :model do
    describe '保存テスト' do
      it "有効な投稿内容の場合は保存されるか" do
        expect(FactoryBot.build(:blog)).to be_valid
	    end
	  end
	  context "空欄でないか" do
      it "titleが空欄でないか" do
        blog = Blog.new(title: '', body:'hoge')
	      expect(blog).to be_invalid
	      expect(blog.errors[:blog_title]).to include("can't be blank")
      end
      it "textが空欄でないか" do
        blog = Blog.new(title: 'hoge', body:'')
        expect(blog).to be_invalid
	      expect(blog.errors[:blog_text]).to include("can't be blank")
      end
    end
  end