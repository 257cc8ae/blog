class ApplicationController < ActionController::Base
  before_action :ensure_domain

  def ensure_domain
    if controller.controller_name != "posts" || controller.controller_name != "tags"
      if request.host == "the-lusaca-blog.herokuapp.com"
        redirect_to "https://blog.lusaca.net"
      end
    end
  end
end
