class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new]

  def new
  end

  def create
    # 認証処理を行うメソッド。login(メールアドレス, パスワード)の形で使う。認証に成功すればそのUserモデルのインスタンス、失敗すればnilが返る。sessionにも自動的に情報が追加される。
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to(:uesrs, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end
end
