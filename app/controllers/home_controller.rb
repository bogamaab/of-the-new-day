class HomeController < ApplicationController
  def index
    if current_user.present?
      redirect_to visits_path
    else
      user_presenter
    end
  end

  private

  def user_presenter
    @user = Users::SessionPresenter.new(User.new, **{})
  end
end
