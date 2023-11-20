# frozen_string_literal: true

class VisitPresenter < ApplicationPresenter
  def visit_path
    rails_routes.visit_path(source)
  end
end