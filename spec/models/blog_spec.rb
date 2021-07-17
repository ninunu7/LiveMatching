require 'rails_helper'

  RSpec.describe 'Blogモデルのテスト', type: :model do
    describe 'バリデーションのテスト' do
      subject { blog.valid? }

      let(:customer) { create(:customer) }
      let!(:blog) { build(:blog, customer_id: customer.id) }

    describe '保存テスト' do
      it '有効な投稿内容の場合は保存されるか' do
        expect(FactoryBot.build(:blog)).to be_valid
	    end
	  end

	  context 'titleカラム' do
      it 'titleが空欄でないか' do
	      blog.blog_title = ''
        is_expected.to eq false
      end
    end

    context 'textカラム' do
      it 'textが空欄でないか' do
	      blog.blog_text = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Customerモデルとの関係' do
      it 'N:1となっている' do
        expect(Blog.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
  end
end