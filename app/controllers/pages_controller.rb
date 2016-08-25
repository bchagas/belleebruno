class PagesController < ActionController::Base
  before_filter :remove_xframe_option

  layout "application"

  def show
    if params[:page] && template_exists?(params[:page], ["pages"])
      render params[:page]
    else
      render file: "/public/404.html", status: 404
    end
  end

  private

  def remove_xframe_option
    response.headers.delete('X-Frame-Options')
  end
end
