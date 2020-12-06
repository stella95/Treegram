class FollowsController < ApplicationController
    def index
        @users=User.all
    end
        
    def create
        other_user = User.find(params[:user_id])
        if Follow.find_by(follower_id: current_user.id, followed_id: other_user.id) != nil
            flash[:notice] = "You already follow"
        else
            @follow = Follow.create(follower_id: current_user.id, followed_id: other_user.id)
            @follow.save
            flash[:notice] = "Successfully follow"
        end
    end
    
end
