class ApplicationController < ActionController::Base
  before_action :ensure_domain

  def ensure_domain
    if request.host == "the-lusaca-blog.herokuapp.com"
      redirect_to "https://blog.lusaca.net"
    end
  end
end
