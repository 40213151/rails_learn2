class HomeController < ApplicationController
  
  before_action :forbid_login_yosakoiyer,{only: [:top]}
  
  def top
  end
end
