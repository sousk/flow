class LoginController < ApplicationController
  def unauthenticated
    puts "!----"
    p params
    puts "!----"
    raise params.keys.join(",")
  end
end
