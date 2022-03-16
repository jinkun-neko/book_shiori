class User < ApplicationRecord
  validates :username, presence: true 

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :omniauthable, omniauth_providers: %i[google_oauth2]

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank? 
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username]) # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:username]) # アカウント編集の時にnameとprofileのストロングパラメータを追加
  end

  # omniauthのコールバック時に呼ばれるメソッド
  def self.find_or_create_for_oauth(auth)
    find_or_create_by!(email: auth.info.email) do |user|
        user.provider = auth.provider,
        user.uid = auth.uid,
        user.username = auth.info.name,
        user.email = auth.info.email,
        user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.google_oauth2"] && session["devise.google_oauth2_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  private

  #twitterでサインアップする時に、本来サインアップに必要なメールアドレスカラムをダミーで埋める
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
