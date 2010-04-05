class LoginController < ApplicationController
  def unauthenticated
    render_404
  end
end
