class HomeController < ApplicationController
  def index
    @user = Users::SessionPresenter.new(User.new, **{})
  end
end
