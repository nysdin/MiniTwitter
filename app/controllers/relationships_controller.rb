class RelationshipsController < ApplicationController

  def create
    user = User.find_by(id: params[:following_id])
    current_user.follow(user)
    redirect_back(fallback_location: root_url)
  end

  def destroy
    user = Relationship.find(params[:id]).following
    current_user.unfollow(user)
    redirect_back(fallback_location: root_url)
  end
end