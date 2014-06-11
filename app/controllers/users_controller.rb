class UsersController < ApplicationController
  load_and_authorize_resource :class => "User"
  skip_load_resource :only => :add
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def advanced_search
    @search = User.search(params[:q])
    @search.build_grouping unless @search.groupings.any?
    @users  = params[:distinct].to_i.zero? ? @search.result : @search.result(distinct: true)

    respond_with @users
  end

  def index
    @q = User.includes(:organization).where("id > ?", 1).search(params[:q])
    @users = @q.result(:distinct => true).page(params[:page])
  end

  def show
  end

  def new
    @user = User.new
    respond_to do |f|
      f.js
    end
  end

  def add
    @user = User.new(params[:user])
    @user.password = "11111111"
    respond_to do |f|
      if @user.save
        f.js { render :template => 'users/add' }
      else
        f.js { render :template => 'layouts/error', locals: { errors: @user.errors } }
      end
    end
  end

  def edit
    @organizations = Organization.nested_set.select('id, name, parent_id').all
    respond_to do |f|
      f.html # show.html.erb
      f.json { render json: @user }
    end
  end

  def update
    @user.organization_id = params[:organization_id] if params[:organization_id]
    if @user.update user_params
      redirect_to @user, notice: '设置已保存'
    else
      redirect_to edit_user_path(@user), notice: '设置保存失败'
    end
  end

  def update_password
    if @user.update user_params
      redirect_to root_path, notice: '密码修改成功'
    else
      redirect_to :back, notice: '密码修改失败'
    end
  end

  private
    def set_user
      @user = User.find params[:id]
    end

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :remember_me, :login, :avatar, :department_id, :approved, :role_ids, :organization_id, :level)
    end
end