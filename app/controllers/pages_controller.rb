class PagesController < ApplicationController
  caches_page :contact

  def contact
  end

  def index
    @users = User.all_cached.paginate(page: params[:page], per_page: 10)
    # eager-loading
  end
end
