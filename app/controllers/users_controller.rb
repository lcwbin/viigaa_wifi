class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  protect_from_forgery :except => :sign_in
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  #Sign_in
  def sign_in
    user = User.find_by(username: params[:user][:username])    #查找用户
    if user && user.authenticate(params[:user][:password])    #判断是否存在用户以及检查用户密码

      date = Time.new
      date = date.strftime("%Y-%m-%d")

      client = Creditdetail.find_by_sql("select * from creditdetails where created_at like '"+date+"%' and userid='"+user.userid.to_s+"' limit 1")
      if client.length<=0
        user.update_attribute(:credits, user.credits+50)  #修改用户表的用户积分

        @creditdetail = Creditdetail.new()
        @creditdetail.credit=50
        @creditdetail.intype="1"
        @creditdetail.way="1"
        @creditdetail.userid=user.userid
        @creditdetail.save
      end
      render :json => {:message=>"success",:datetime=>client.length}
    else
      render :json => {:message=>"fail"}
    end
  end


  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.userid=UUIDTools::UUID.timestamp_create().to_s
    @user.flow=50
    @user.credits=100
    @user.errorTime=0
    @user.status=1
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password,:password_confirmation, :nickname)
    end
end
