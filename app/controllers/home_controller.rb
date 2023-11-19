class HomeController < ApplicationController
  def index
    @user = Users::SessionPresenter.new(nil, **options)
  end
end
