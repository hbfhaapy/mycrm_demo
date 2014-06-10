class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @q = User.includes(:organization).where("id > ?", 1).search(params[:q])
    @users = @q.result(:distinct => true).page(params[:page])
  end

  def new
    @user = User.new

    respond_to do |format|
      format.js
    end
  end

  def add
    @user = User.new(user_params)
    @user.password = "11111111"

    respond_to do |format|   
      if @user.save
        format.js { render :template => 'users/add' }
      else
        format.js { render :template => 'layouts/error', locals: { errors: @user.errors } }
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
    @organizations = Organization.nested_set.select('id, name, parent_id').all
  end

  def update

    @user = User.find(params[:id])
    @user.organization_id = params[:organization_id] 
    if params[:organization_id]
      if @user.save!
        redirect_to @user, notice: '设置已保存'
      else
        redirect_to edit_user_path(@user), notice: '设置保存失败'
      end
    elsif @user.update_attributes(user_params)
      redirect_to @user, notice: '设置已保存'
    else
      redirect_to edit_user_path(@user), notice: '设置保存失败'
    end
  end


  def update_password
    if params[:user][:password].length < 9
      redirect_to :back, notice: 'the length of password is too short.'
    else
      @user = User.find(params[:id])
      debugger
      if @user.update_attributes(user_params)
        redirect_to root_path, notice: '密码修改成功'
      else
        redirect_to :back, notice: '密码修改失败'
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :remember_me, :avatar, :department_id, :approved, :role_ids, :organization_id, :level)
    end
end
