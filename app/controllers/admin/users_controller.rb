class Admin::UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  def index
    # @users = User.all
    @users = User.all.accessible_by(current_ability)
  end

  # GET /users/1
  def show
    # authorize! :read, @user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_user_url(@user), notice: "L'utilisateur.rice a bien été créé." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_user_url(@user), notice: "L'utilisateur.rice a bien été mis à jour." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: "L'utilisateur.rice a bien été supprimé." }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :admin, :password, :password_confirmation)
  end
end
