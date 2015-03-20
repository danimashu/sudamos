module Helpers
  def authenticate_admin_via_http
    credentials = ActionController::HttpAuthentication::Basic.encode_credentials Figaro.env.admin_user!, Figaro.env.admin_password!
    request.env['HTTP_AUTHORIZATION'] = credentials
  end
end