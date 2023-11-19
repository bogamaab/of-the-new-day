# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def new
    user_session_presenter
    respond_to { |format| format.html { render 'home/index' } }
  end

  def create
    user_session_presenter(sanatize_create_params[:identification_number], options: sanatize_create_params).validate
    if @user.errors.any?
      flash_message('alert', 'new')
      respond_to { |format| format.html { render 'home/index' } }
    else
      sign_in(:user, @user)
      flash_message('notice', 'new')
      respond_to { |format| format.html { redirect_to after_sign_in_path } }
    end
  end

  def destroy
    if current_user.present?
      sign_out(current_user)
      flash_message('notice', 'destroy')
      page_for_redirect = after_sign_out_path
    else
      flash_message('alert', 'destroy')
      new_user_session_path
      page_for_redirect = new_user_session_path
    end

    respond_to { |format| format.html { redirect_to page_for_redirect } }
  end

  private

  def flash_message(event, method)
    flash[event.to_sym] = t("users.sessions.#{method}.#{event}")
  end

  def user_session_presenter(identification_number = nil, options: {})
    @user = Users::SessionPresenter.new(find_or_new_user(identification_number), **options)
  end

  def find_or_new_user(identification_number = nil)
    User.find_by(identification_number: identification_number) || User.new
  end

  def after_sign_in_path
    visits_index_path
  end

  def after_sign_out_path
    root_path
  end

  def sanatize_create_params
    params
      .require(:user)
      .permit(
        :identification_number,
        :password
      )
  end
end
