class SessionsController < ApplicationController
  before_filter :set_user, :only => [:signup]
  skip_before_filter :require_login, except: [:destroy]
  
  layout 'signin', :only => [:new, :signup]
  
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(:users, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:root, notice: 'Logged out!')
  end
  
  def signup
    
  end
  
private
  
  def set_user
    if model = Module.const_get(params[:type].classify)
      if model.base_class == User
        @user = model.new
      end
    end
  rescue NameError
    redirect_to :root
  end
end