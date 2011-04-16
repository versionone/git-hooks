module GitWrapperHelpers
  
  def commit_on_branch(branch)
    commit = GitCommit.new
    commit.stub!(:branch).and_return(branch)
    commit
  end

  class FakeFile
    attr_reader :content

    def write(body)
      @content = body
    end

  end
end
