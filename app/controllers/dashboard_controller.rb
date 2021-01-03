class DashboardController < ApplicationController
  def show
    @private_repos = SearchFacade.private_repos(current_user)
    @public_repos = SearchFacade.public_repos(current_user)
    @all_repos = SearchFacade.all_repos(current_user)
  end
end
