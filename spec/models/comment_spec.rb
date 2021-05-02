require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメントの保存' do
    context 'コメント投稿が保存できる場合' do
      it 'textが正しく入力できていれば保存できる' do
        expect(@comment).to be_valid
      end
    end
    context 'コメント投稿が保存できない場合' do
      it 'textが空では保存できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
      it 'tweetが紐付いていないと保存できない' do
        @comment.tweet = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Tweet must exist")
      end
    end
  end
end
