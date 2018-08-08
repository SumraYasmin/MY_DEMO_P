class Admin::UsersController < AdminController
  before_action :set_user, only: [:changestatus, :changerole, :validates_role]
	before_action :validates_role, only: :changestatus

  def index
  	@users=User.all
  end

  def changestatus
  	if @user.status=="inactive" 
  	   @user.status="active"
    else
  	 	@user.status="inactive"
  	end

  	@user.save
  	@users=User.all
  	render "index"
  end

  def changerole
  	if @user.ismanager?
  	   @user.ismanager="false"
    else
  	 	@user.ismanager="true"
  	end
  	@user.save
  	@users=User.all
  	render "index"

  end

  private

    def validates_role
    	unless @user.user?
    	 @users=User.all
  	     render "index"
  	    end
    end
     def set_user
      @user= User.find(params[:id])
    end

end
