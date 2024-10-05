# pure railsのリクエストスペック
RSpec.describe "UsersController", type: :request do
  describe "GET /users" do
    subject { get "/users" }

    let!(:user1) { create(:user, first_name: "yuki", last_name: "haga")}
    let!(:user2) { create(:user, first_name: "tarou", last_name: "hoge")}

    it "200が返ってくること" do
      subject
      expect(response.status).to eq 200
    end

    it "ユーザー名が表示されていること" do
      subject
      # bodyがhtmlの時の簡易的な検証方法
      # もっと詳細にやりたいなら、Capybaraとかでやると良いかも
      expect(response.body).to include "yuki"
      expect(response.body).to include "tarou"
    end
  end
end
