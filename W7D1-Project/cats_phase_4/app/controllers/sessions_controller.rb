class SessionsController <  ApplicationController

    before_action :require_logged_in, only: [:destroy]
    before_action :require_logged_out, only: [:new, :create]

    def new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

        if @user
            login(@user)
            session[:session_token] = @user.reset_session_token!
            redirect_to cats_url
            # redirect_to cats_url(@cat)
        else 
            render :new
        end
    end

    def destroy
        logout!
        redirect_to new_sesion_url
    end







end