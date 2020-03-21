defmodule Awesome.GithubApiClient.Repositories do
  alias Awesome.Fetcher, as: Fetcher

  @repos_url Application.get_env(:github_api_client, :base_url) <> "/repos"

  def get_readme(owner_slash_repo) do
    {:ok, %{"content" => readme_content_base64}} =
      Fetcher.fetch_body(@repos_url <> owner_slash_repo <> "/readme")

    decode_readme = Base.decode64!(readme_content_base64, ignore: :whitespace)

    {:ok, decode_readme}
  end

  def get_stars(owner_slash_repo) do
    {:ok, %{"stargazers_count" => stars}} = Fetcher.fetch_body(@repos_url <> owner_slash_repo)

    {:ok, stars}
  end

  def get_date_last_commit(owner_slash_repo) do
    {:ok, last_commit} = Fetcher.fetch_body(@repos_url <> owner_slash_repo <> "/commits/master")
    date = get_in(last_commit, ["commit", "author", "date"])

    {:ok, date}
  end
end
