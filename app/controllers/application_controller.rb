class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :determine_layout

  private
    def determine_layout
      current_user ? 'application' : 'public'
    end
end