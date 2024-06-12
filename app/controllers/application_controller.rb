class ApplicationController < ActionController::Base
  include SessionsHelper

  private
  
     #ログイン済みユーザーかどうか確認
     def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください"
        #status: :see_otherを記述しないと遷移先にもリクエストが遷移する。
        redirect_to login_url, status: :see_other
      end
    end
end
