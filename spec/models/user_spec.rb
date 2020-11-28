require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'アカウント登録' do
    # 1
    it "name、name_kana、email、passwordとpassword_confirmationが存在すれば登録できること" do
     user = FactoryBot.build(:user)
     expect(user).to be_valid
    end

    # 2
    it "nameがない場合は登録できないこと" do
     user = FactoryBot.build(:user, name: "")
     user.valid?
     expect(user.errors[:name]).to include("が入力されていません。")
    end

    # 3
    it "name_kanaがない場合は登録できないこと" do
     user = FactoryBot.build(:user, name_kana: "")
     user.valid?
     expect(user.errors[:name_kana]).to include("が入力されていません。")
    end

    # 4
    it "emailがない場合は登録できないこと" do
     user = FactoryBot.build(:user, email: "")
     user.valid?
     expect(user.errors[:email]).to include("が入力されていません。")
    end

    # 5
    it "passwordがない場合は登録できないこと" do
     user = FactoryBot.build(:user, password: "")
     user.valid?
     expect(user.errors[:password]).to include("が入力されていません。")
    end

    # 6
    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
     user = FactoryBot.build(:user, password_confirmation: "")
     user.valid?
     expect(user.errors[:password_confirmation]).to include("が内容とあっていません。")
    end

    # 7
    it "nameが11文字以上であれば登録できないこと" do
     user = FactoryBot.build(:user, name: "12345678901")
     user.valid?
     expect(user.errors[:name]).to include("は10文字以下に設定して下さい。")
    end

    # 8
    it "nameが10文字以下であれば登録できること" do
     user = FactoryBot.build(:user, name: "1234567890")
     user.valid?
     expect(user).to be_valid
    end

    # 9
    it "name_kanaが21文字以上であれば登録できないこと" do
     user = FactoryBot.build(:user, name_kana: "123456789012345678901")
     user.valid?
     expect(user.errors[:name_kana]).to include("は20文字以下に設定して下さい。")
    end

    # 10
    it "name_kanaが20文字以下であれば登録できること" do
     user = FactoryBot.build(:user, name_kana: "12345678901234567890")
     user.valid?
     expect(user).to be_valid
    end

    # 11
    it "重複したemailが存在する場合登録できないこと" do
     user = FactoryBot.create(:user)
     another_user = FactoryBot.build(:user)
     another_user.valid?
     expect(another_user.errors[:email]).to include("は既に使用されています。")
    end

    # 12
    it "passwordが6文字以上であれば登録できること" do
     user = FactoryBot.build(:user, password: "123456", password_confirmation: "123456")
     user.valid?
     expect(user).to be_valid
    end

    # 13
    it "passwordが5文字以下である場合は登録できないこと" do
     user = FactoryBot.build(:user, password: "12345", password_confirmation: "12345")
     user.valid?
     expect(user.errors[:password]).to include("は6文字以上に設定して下さい。")
    end
  end
end
