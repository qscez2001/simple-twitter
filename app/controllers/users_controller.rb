class UsersController < ApplicationController

  def tweets
    @user = User.find(params[:id])
    @tweeted = Tweet.where(user: @user).order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to edit_user_path(@user)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to edit_user_path(@user)
  end

  def followings
    @followings # 基於測試規格，必須講定變數名稱
  end

  def followers
    @followers # 基於測試規格，必須講定變數名稱
  end

  def likes
    @likes # 基於測試規格，必須講定變數名稱
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :avatar)
  end

end
