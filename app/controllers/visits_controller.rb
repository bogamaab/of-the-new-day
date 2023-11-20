# frozen_string_literal: true
class VisitsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def edit
    resource = Visit.find(params[:id])
    visit_presenter(resource)
  end

  def update
  end

  private

  def visit_presenter(visit, options = {})
    @visit = VisitPresenter.new(visit, **options)
  end
end
