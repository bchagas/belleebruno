class PagesController < ActionController::Base
  layout "application"

  def show
    if params[:page] && template_exists?(params[:page], ["pages"])
      render params[:page]
    else
      render file: "/public/404.html", status: 404
    end
  end
end
