defmodule Awesome.GithubApiClient.RepositoriesTest do
  use ExUnit.Case

  alias Awesome.GithubApiClient.Repositories, as: Repositories

  test "Fetch readme" do
    {:ok, text_readme} = Repositories.get_readme("/owner/repo")

    assert text_readme == "successful"
  end

  test "Fetch stars" do
    assert {:ok, 100_500} = Repositories.get_stars("/owner/repo")
  end

  test "Fetch date last commit" do
    assert {:ok, "2020-02-07T20:12:52Z"} = Repositories.get_date_last_commit("/owner/repo")
  end
end
