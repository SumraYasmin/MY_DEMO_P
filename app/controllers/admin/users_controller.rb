class Admin::UsersController < AdminController
	before_action :validates_role, only: :changestatus

  def index
  	@users=User.all
  end

  def changestatus
  	@user=User.find(params[:id])
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
  	@user=User.find(params[:id])
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
    	@user=User.find(params[:id])
    	unless @user.user?
    	 @users=User.all
  	     render "index"
  	    end
    end

end
