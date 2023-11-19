class ApplicationController < ActionController::Base
  before_action :home_presenter

  private

  def home_presenter
    @home_presenter = HomePresenter.new(current_user)
  end
end
