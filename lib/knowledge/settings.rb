# coding: utf-8
require "grit"
module Knowledge
  mattr_accessor :user_class, :current_user_method, :require_user_method, :repository

  class << self
    def user_class
      (@@user_class || "User").constantize
    end
    
    def current_user_method
      @@current_user_method || "current_user"
    end

    def require_user_method
      @@require_user_method || "require_user"
    end

    def repository=(repos)
      @@repository = Grit::Repo.new(repos)
    end
  end
end
