require 'git'
require 'octokit'
require_relative "cloner"

class CloneJob
  @queue = :default

  def self.perform(after_sha, destination_hostname, destination_repo, originating_hostname, originating_repo, sync_method)

    cloner = Cloner.new({
      :after_sha            => after_sha,
      :destination_hostname => destination_hostname,
      :destination_repo     => destination_repo,
      :originating_hostname => originating_hostname,
      :originating_repo     => originating_repo,
      :sync_method          => sync_method
    })

    cloner.clone
  end
end