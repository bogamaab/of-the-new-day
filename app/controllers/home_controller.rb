class HomeController < ApplicationController
  #after_action :home_presenter

  def index
  end

  private

  def home_presenter
    @home_presenter = HomePresenter.new(current_user)
  end
end
