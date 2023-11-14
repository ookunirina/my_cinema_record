require 'rails_helper'

RSpec.describe Movierecord, type: :model do
  let(:movierecord) { build(:movierecord) }

  context '有効な入力値の場合' do
    it '成功すること' do
      movierecord = build(:movierecord)
      expect(movierecord).to be_valid
    end
  end

  context 'タイトルが存在しない場合' do
    it '無効であること' do
      movierecord = build(:movierecord, title: nil)
      expect(movierecord).to be_invalid
      expect(movierecord.errors[:title]).to include('を入力してください')
    end
  end

  context '視聴方法が存在しない場合' do
    it '無効であること' do
      movierecord = build(:movierecord, viewing_style: nil)
      expect(movierecord).to be_invalid
      expect(movierecord.errors[:viewing_style]).to include('を入力してください')
    end
  end
  
  context '感想が存在しない場合' do
    it '無効であること' do
      movierecord = build(:movierecord, review: nil)
      expect(movierecord).to be_invalid
      expect(movierecord.errors[:review]).to include('を入力してください')
    end
  end

  context 'タイトルが100文字以上の場合' do
    it '無効であること' do
      movierecord = build(:movierecord, title: 'a' * 101)
      expect(movierecord).to be_invalid
      expect(movierecord.errors[:title]).to include('は100文字以内で入力してください')
    end
  end

  context '感想が65536文字以上の場合' do
    it '無効であること' do
      movierecord = build(:movierecord, review: 'a' * 65_536)
      expect(movierecord).to be_invalid
      expect(movierecord.errors[:review]).to include('は65535文字以内で入力してください')
    end
  end
end