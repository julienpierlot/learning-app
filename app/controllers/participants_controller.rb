class ParticipantsController < ApplicationController

  def show
    @participant = Participant.find(params[:id])
    unless (user_signed_in? && (current_user.id == @participant.event.user_id)) || (params["token"].present? && params["token"] == @participant.email_token)
    redirect_to root_path
    flash[:notice] = "Not authorized to access this page"
    end
  end

end
