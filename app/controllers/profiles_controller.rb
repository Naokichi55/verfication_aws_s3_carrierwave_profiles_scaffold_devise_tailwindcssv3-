class ProfilesController < ApplicationController
	def new
		@profile = Profile.new
	end

  def show
    @profile = Profile.find(params[:id])
  end

  def create
    @profile = current_user.build_profile(profile_params)
		if @profile.save
      redirect_to profiles_path
		else
			flash.now[:danger] = "プロフィールの作成に失敗しました"
			render  :new, status: :unprocessable_entity
		end
  end

  def edit
		@profile = current_user.profile
  end

 def update
		@profile = current_user.profile
		if @profile.update(profile_params)
			redirect_to profile_path(@profile), success: "プロフィール情報の更新に成功しました"
		else
      flash.now[:danger] = "プロフィールの投稿に失敗しました"
			render :new, status: :unprocessable_entity
		end
  end

  def destroy
    profile = current_user.profiled.find(params[:id])
    profile.destroy!
    redirect_to rackets_path, success: "profile情報を削除しました。"
  end

	private
  def profile_params
		params.require(:profile).permit(:racket, :history, :play_style, :level, :gender, :body, :avataor)
  end
end
