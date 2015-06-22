Garage.configure {}

Garage::TokenScope.configure do
  register :public, desc: 'accessing publicly available data' do
    access :read,   User
    access :write,  User
  end
end

Doorkeeper.configure do
  orm :active_record

  # デフォルトのスコープ
  default_scopes :public

  optional_scopes(*Garage::TokenScope.optional_scopes)

  # アプリケーションのオーナーの認証
  resource_owner_authenticator do
    current_user || redirect_to(new_user_session_path)
  end
end

Doorkeeper.configuration.token_grant_types << "authorization_code"
Garage.configuration.strategy = Garage::Strategy::Doorkeeper
