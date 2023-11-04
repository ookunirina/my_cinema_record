require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    context 'すべてのフィールドが有効な場合' do
      it '有効であること' do
        user = build(:user)
        expect(user).to be_valid
      end
    end

    context '名前がない場合' do
      it '名前が空欄だと登録できない' do
        user = build(:user, name: nil)
        expect(user).to_not be_valid
        expect(user.errors[:name]).to include("を入力してください")
      end
    end

    context '名前が255文字を超える場合' do
      it '登録できないこと' do
        user = build(:user, name: 'a' * 256)
        user.valid?
        expect(user.errors[:name]).to include("は255文字以内で入力してください")
      end
    end

    context 'メールアドレスがない場合' do
      it 'メールアドレスが空欄だと登録できない' do
        user = build(:user, email: nil)
        expect(user).to_not be_valid
        expect(user.errors[:email]).to include("を入力してください")
      end
    end

    context 'メールアドレスが重複している場合' do
      it '重複したメールアドレスでは登録できない' do
        existing_user = create(:user, email: 'test@example.com')
        user_with_duplicate_email = build(:user, email: existing_user.email)
        expect(user_with_duplicate_email).to_not be_valid
        expect(user_with_duplicate_email.errors[:email]).to include('はすでに存在します')
      end
    end

    context 'パスワードがない場合' do
      it 'パスワードが空欄だと登録できない' do
        user = build(:user, password: nil)
        expect(user).to_not be_valid
        expect(user.errors[:password]).to include("は3文字以上で入力してください")
      end
    end

    context 'パスワードが3文字未満の場合' do
      it 'パスワードが3文字以上でなければ登録できない' do
        password = Faker::Internet.password(min_length: 3, max_length: 3)
        user = build(:user, password: 'pw', password_confirmation: 'pw')
        expect(user).not_to be_valid
        expect(user.errors[:password]).to include('は3文字以上で入力してください') 
      end
    end

    context 'パスワード(確認)が空の場合' do
      it 'パスワード(確認)が空欄だと登録できない' do
        user_without_password_confirmation = build(:user, password_confirmation: '')
        expect(user_without_password_confirmation).to be_invalid
        expect(user_without_password_confirmation.errors[:password_confirmation]).to include('を入力してください')
      end
    end

    context 'パスワードとパスワード(確認)が一致しない場合' do
      it 'パスワードと確認が一致していないと登録できない' do
        password = Faker::Internet.password
        user = build(:user, password: 'password', password_confirmation: 'mismatch')
        expect(user).to_not be_valid
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end
    end
  end
end
