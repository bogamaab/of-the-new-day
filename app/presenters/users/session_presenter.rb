class Users::SessionPresenter < ApplicationPresenter
  include Users::SessionFormService
  # include Users::SessionValidator

  def session_path
    rails_routes.user_session_path
  end
end
