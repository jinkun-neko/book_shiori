# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: [:edit, :update]

  def create
    #スーパークラス(devise)のcreateアクションを呼ぶ 
    super 
    #WelcomeMailerクラスのsend_when_signupメソッドを呼び、POSTから受け取ったuserのemailとnameを渡す
    WelcomeMailer.send_when_signup(params[:user][:email],params[:user][:name]).deliver
  end

  protected
  
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
  
  def update_resource(resource, params)
    resource.update_without_current_password(params) #独自のメソッド。解説は下記にて。
  end

  # 必須ではないがupdate後にtop画面にリダイレクトするメソッド
  def after_update_path_for(_resource)
      pages_show_path
  end

    #ゲストユーザーはアカウント情報を編集・更新できない
    def ensure_normal_user
      if resource.email == 'guest@example.com'
        redirect_to root_path, alert: 'ゲストユーザーは編集できません。'
      end
    end
end
