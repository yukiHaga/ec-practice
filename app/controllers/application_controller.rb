class ApplicationController < ActionController::Base
  before_action :require_login

  private
    # require_loginで呼ばれるメソッドをオーバーライドしてリダイレクト先を変更している
    def not_authenticated
      redirect_to login_path, alert: "Please login first"
    end
end
