require 'rails_helper'

RSpec.describe TweetForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    @tweet_form = FactoryBot.build(:tweet_form, user_id: user.id)
  end

  describe 'ツイートの保存' do
    context 'ツイートが保存できるとき' do
      it '全てのフォームが正しく入力できていれば保存できる' do
        expect(@tweet_form).to be_valid
      end
      it 'link_oneが空でも保存できる' do
        @tweet_form.link_one = ''
        expect(@tweet_form).to be_valid
      end
      it 'link_twoが空でも保存できる' do
        @tweet_form.link_two = ''
        expect(@tweet_form).to be_valid
      end
      it 'link_threeが空でも保存できる' do
        @tweet_form.link_three = ''
        expect(@tweet_form).to be_valid
      end
      it 'link_fourが空でも保存できる' do
        @tweet_form.link_four = ''
        expect(@tweet_form).to be_valid
      end
    end
    context 'ツイートが保存できないとき' do
      it 'imageが空では保存できない' do
        @tweet_form.image = ''
        @tweet_form.valid?
        expect(@tweet_form.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空では保存できない' do
        @tweet_form.title = ''
        @tweet_form.valid?
        expect(@tweet_form.errors.full_messages).to include("Title can't be blank")
      end
      it 'infoが空では保存できない' do
        @tweet_form.info = ''
        @tweet_form.valid?
        expect(@tweet_form.errors.full_messages).to include("Info can't be blank")
      end
      it 'category_idが空では保存できない' do
        @tweet_form.category_id = ''
        @tweet_form.valid?
        expect(@tweet_form.errors.full_messages).to include("Category can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @tweet_form.user_id = nil
        @tweet_form.valid?
        expect(@tweet_form.errors.full_messages).to include("User can't be blank")
      end
      it 'category_idが1だと保存できない' do
        @tweet_form.category_id = 1
        @tweet_form.valid?
        expect(@tweet_form.errors.full_messages).to include('Category must be other than 1')
      end
    end
  end
end
