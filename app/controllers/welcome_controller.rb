class WelcomeController < ApplicationController
    def guest
        guest_user # guest_userを作成する
        redirect_to tasks_url
      end
end
