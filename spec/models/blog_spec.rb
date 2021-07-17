require 'rails_helper'

  RSpec.describe 'Blogモデルのテスト', type: :model do
    describe 'バリデーションのテスト' do
      subject { blog.valid? }

      let(:customer) { create(:customer) }
      let!(:blog) { build(:blog, customer_id: customer.id) }


  #   describe '保存テスト' do
  #     it '有効な投稿内容の場合は保存されるか' do
  #       expect(FactoryBot.build(:blog)).to be_valid
	 #   end
	 # end

	  context 'titleカラム' do
      it 'titleが空欄でないか' do
      #   blog = Blog.new(title: '', body:'hoge')
	     # expect(blog).to be_invalid
	     # expect(blog.errors[:blog_title]).to include("を入力してください")
	      blog.blog_title = ''
        is_expected.to eq false
      end
    end

    context 'textカラム' do
      it 'textが空欄でないか' do
      #   blog = Blog.new(title: 'hoge', body:'')
      #   expect(blog).to be_invalid
	     # expect(blog.errors[:blog_text]).to include("を入力してください")
	      blog.blog_text = ''
        is_expected.to eq false
      end
    end
  end
end