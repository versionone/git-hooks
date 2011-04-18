require 'spec_helper'
require File.expand_path('../../lib/gittr', __FILE__)

describe "prepare-commit-msg Git Hook" do
  include GittrHelpers

  describe "branch doesn't have asset number" do
    [ 'master',
      'developing',
      '9-abcde',
      'AAAA-012345',
      'A--012345']
    it 'asset is nil' do
      commit = commit_on_branch('master')
      commit.asset_for_branch.should_not be
    end
  end

  describe "branch has asset number" do
    [ 'S-01234',
      'S-01234-was-the-start',
      'the-S-01234-middle',
      'the-end.too_S-01234',
      'this_is-my.S-01234-branch_here'].each do |branch|

      it "finds the asset in: #{branch}" do
        commit = commit_on_branch(branch)
        commit.asset_for_branch.should == 'S-01234'
      end
    end

    [ 'TS-09876', 'ENV-01234'].each do |branch|
      it "finds the asset in: #{branch}" do
        commit = commit_on_branch(branch)
        commit.asset_for_branch.should == branch
      end

      it "finds long asset numers" do
        commit = commit_on_branch("big-long_ENV-123456789_or_more")
        commit.asset_for_branch.should == "ENV-123456789"
      end
    end
  end

  describe "commit message" do

    describe "with the asset name in a comment" do
      before(:each) do
        fake_message = <<-COMMIT_MSG
# this is a commit message
# with the asset name S-01234 embedded
# right in it. weird!
                          COMMIT_MSG
        File.stub!(:readlines).and_return(fake_message.split("\n"))
        @commit = commit_on_branch("foo_S-01234")
      end

      it "doesn't already references asset" do
        @commit.references?("S-01234").should be_false
      end

      it "message doesn't include asset name" do
        @commit.message.should_not include("S-01234")
      end

      it "extra comments captured" do
        @commit.extra_comments.should include("asset name S-01234 embedded")
      end

    end

    describe "with the asset name" do
      before(:each) do
        fake_message = <<-COMMIT_MSG
some commit for S-01234

# this is a commit message
# with the asset name S-01234 embedded
# right in it. weird!
                          COMMIT_MSG
        File.stub!(:readlines).and_return(fake_message.split("\n"))
        @commit = commit_on_branch("foo_S-01234")
      end
      
      it "already references asset" do
        @commit.references?("S-01234").should be_true
      end

      it "message does include asset name" do
        @commit.message.should include("S-01234")
      end

      it "extra comments captured" do
        @commit.extra_comments.should include("asset name S-01234 embedded")
      end

    end
  end

  describe "referencing an asset" do
      fake_message = <<-COMMIT_MSG


VersionOne: S-98765
# some extra stuff
                       COMMIT_MSG

    before(:each) do
      @fake_file = FakeFile.new
      File.stub!(:readlines).and_return(["# some extra stuff"])
      File.stub!(:open).and_yield(@fake_file)
      commit = commit_on_branch("S-98765")
      @commit_message = commit.reference("S-98765")
    end

    it "prepare commit message" do
      @commit_message.should == fake_message
      @fake_file.content.should == fake_message
    end
  end

end
