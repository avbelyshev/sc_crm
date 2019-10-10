json.user do
  json.email @user.email
  json.sign_out_link url_for(destroy_client_session_path)
end
