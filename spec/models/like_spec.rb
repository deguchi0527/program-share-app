require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @like = FactoryBot.build(:like)
  end

  describe 'いいねの保存' do
    context 'いいねが保存できる場合' do
      it 'userとtweetが紐付いていれば保存できる' do
        expect(@like).to be_valid
      end
    end
    context 'いいねが保存できない場合' do
      it 'userが紐付いていないと保存できない' do
        @like.user = nil
        @like.valid?
        expect(@like.errors.full_messages).to include('User must exist')
      end
      it 'tweetが紐付いていないと保存できない' do
        @like.tweet = nil
        @like.valid?
        expect(@like.errors.full_messages).to include('Tweet must exist')
      end
    end
  end
end
