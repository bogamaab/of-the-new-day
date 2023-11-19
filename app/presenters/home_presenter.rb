class HomePresenter < ApplicationPresenter
  TECHNICIAN_OPTIONS = [
    {
      translate: I18n.t('shared.header.logout'),
      route: Rails.application.routes.url_helpers.destroy_user_session_path
    }
  ].freeze
end
