module GitWrapperHelpers
  
  def commit_on_branch(branch)
    commit = GitCommit.new
    commit.stub!(:branch).and_return(branch)
    commit
  end
end
