class PagesController < ActionController::Base
  layout "application"

  def show
    if %w(informacoes lista-de-presentes fotos).include? params[:page]
      render params[:page]
    else
      render file: "/public/404.html", status: 404
    end
  end
end
