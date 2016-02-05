class SwipesController < ApplicationController
    before_action :login_user

      # POST /api/swipes
    def create
      case params[:type]
        when "yes"
          swipe_yes
        when "no"
          swipe_no
      end
    end

    def feed
      @next_five_users = current_user.narrow_users[0..4] if current_user
      if request.xhr?
        if @next_five_users.empty?
          render :text => "<h3 class='text-center'>No more swipes for now. Please check back soon!</h3>"
        else
          # send back all the rendered cards and their count to the ajax call as json
          {num_cards: @next_five_users.length,
          cards: (render :partial => 'swipes/generate_cards', :locals => {:users => @next_five_users })
          }.to_json
        end

      else
        if current_user.bio.nil?
          redirect_to '/profile'
        else
          unless session[:swipes_explanation] || (current_user.swipes.count > 0)
            flash[:show_modal] = true
            flash[:modal_to_show]= 'users/swipes_explanation'
            session[:swipes_explanation] = true;
          end
        end
      end
    end

    private

    def swipe_yes
      new_swipe = current_user.swipes.create(swipee_id: params[:user_id], swiped_yes: true)
      match_found = User.find(params[:user_id]).swipes.where(swipee_id: current_user.id, swiped_yes: true).length > 0
      @matched_user = User.find(params[:user_id]) if match_found
      @match = Match.where(second_user_id: current_user.id, first_user_id: @matched_user.id)

      if request.xhr?
        render :partial => 'matches/overlay_modal' if @matched_user
        render :status => 418, :text => "I'm a teapot" unless @matched_user
      else
        if match_found
          render '/matches/overlay' and return if match_found
        else
          redirect_to "/feed"
        end
      end
    end

    def swipe_no
      current_user.swipes.create(swipee_id: params[:user_id], swiped_yes: false)
      if request.xhr?
        head :ok, content_type: "text/html"
      else
        redirect_to "/feed"
      end
    end
end
