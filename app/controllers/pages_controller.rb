class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def search
    @user = User.search(params[:search])
  end


end
