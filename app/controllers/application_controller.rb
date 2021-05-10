class ApplicationController < ActionController::Base

  Refile.secret_key = '485f316e91beb308c58c6453c9f038c68475de30611cab8de1aba63975e139900f091f2d541ec0f18cfb243f1107395706ff63caa6306c6c303ca2cfbf5010df'

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_items_path
    when Customer
      root_path
    end
  end
end
