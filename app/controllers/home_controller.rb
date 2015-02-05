class HomeController < ApplicationController
  def index
    password = Devise.friendly_token.first(8)

    @user = User.new(
      password: password,
      password_confirmation: password
    )
  end
end
