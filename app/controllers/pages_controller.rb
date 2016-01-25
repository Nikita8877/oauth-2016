class PagesController < ApplicationController
  def index
    @users = User.all_cached.paginate(page: params[:page], per_page: 10)
    # eager-loading
  end
end