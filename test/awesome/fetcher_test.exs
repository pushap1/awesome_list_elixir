defmodule Awesome.FetcherTest do
  use ExUnit.Case

  defmodule HttpClient do
    def get("fetch successful") do
      {
        :ok,
        %{
          status_code: 200,
          body: Jason.encode!(%{fetch: "successful"})
        }
      }
    end

    def get("fetch not found") do
      {
        :ok,
        %{
          status_code: 404
        }
      }
    end

    def get("timeout connection") do
      {
        :error,
        %{id: nil, reason: :connect_timeout}
      }
    end
  end

  test "Fetch successful" do
    assert {:ok, %{"fetch" => "successful"}} =
             Awesome.Fetcher.fetch_body("fetch successful", http_client: HttpClient)
  end

  test "Fetch not found" do
    assert {:error, 404} = Awesome.Fetcher.fetch_body("fetch not found", http_client: HttpClient)
  end

  test "Error, connect timeout" do
    assert {:error, %{id: id, reason: :connect_timeout}} =
             Awesome.Fetcher.fetch_body("timeout connection", http_client: HttpClient)
  end
end
