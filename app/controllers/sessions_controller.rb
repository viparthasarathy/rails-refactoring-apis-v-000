class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    github_service = GithubService.new
    session[:token] = github_service.authenticate!
    session[:username] = github_service.get_username
    redirect_to '/'
  end
end
