class SearchFacade
  def self.private_repos(current_user)
    private = RepoService.private_repos(current_user)
    private.map do |repo|
      Repo.new(repo)
    end
  end

  def self.public_repos(current_user)
    public = RepoService.public_repos(current_user)
    public.map do |repo|
      Repo.new(repo)
    end
  end

  def self.all_repos(current_user)
    self.public_repos(current_user).count + self.private_repos(current_user).count
  end

  def self.access(code)
    AccessService.response(code)
  end

  def self.user_access(access_token)
    AccessService.user_access(access_token)
  end
end
