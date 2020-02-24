defmodule GithubClient do

    @base_url Application.get_env(:github_client, :base_url)

    def get_readme_content(owner, repo) do
        HTTPoison.get!("#{@base_url}/repos/#{owner}/#{repo}/readme")
        |> Map.fetch!(:body)
    end

end