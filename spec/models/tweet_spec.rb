require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe 'ツイートの保存' do
    context 'ツイートが保存できるとき' do
      it '全てのフォームが正しく入力できていれば保存できる' do
        expect(@tweet).to be_valid
      end
      it 'link_oneが空でも保存できる' do
        @tweet.link_one = ''
        expect(@tweet).to be_valid
      end
      it 'link_twoが空でも保存できる' do
        @tweet.link_two = ''
        expect(@tweet).to be_valid
      end
      it 'link_threeが空でも保存できる' do
        @tweet.link_three = ''
        expect(@tweet).to be_valid
      end
      it 'link_fourが空でも保存できる' do
        @tweet.link_four = ''
        expect(@tweet).to be_valid
      end
    end
    context 'ツイートが保存できないとき' do
      it 'imageが空では保存できない' do
        @tweet.image = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空では保存できない' do
        @tweet.title = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Title can't be blank")
      end
      it 'infoが空では保存できない' do
        @tweet.info = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Info can't be blank")
      end
      it 'category_idが空では保存できない' do
        @tweet.category_id = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Category can't be blank")
      end
      it 'private_idが空では保存できない' do
        @tweet.private_id =''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Private can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('User must exist')
      end
      it 'category_idが1だと保存できない' do
        @tweet.category_id = 1
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Category must be other than 1')
      end
      it 'private_idが1だと保存できない' do
        @tweet.private_id = 1
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Private must be other than 1")
      end
    end
  end
end
