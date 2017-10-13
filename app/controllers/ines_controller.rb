class InesController < ApplicationController
  before_action :authenticate_yosakoiyer

  def create
    @ine = Ine.new(yosakoiyer_id: @current_yosakoiyer.id, post_id: params[:post_id])
    @ine.save
    redirect_to("/posts/#{params[:post_id]}")
  end

  def destroy
    @ine = Ine.find_by(yosakoiyer_id: @current_yosakoiyer.id, post_id: params[:post_id])
    @ine.destroy
    redirect_to("/posts/#{params[:post_id]}")
  end
  
end
