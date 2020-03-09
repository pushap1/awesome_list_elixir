defmodule Awesome.Fetcher do
  @default_http_client Application.get_env(:github_api_client, :http_client)

  def fetch_body(url, opts \\ []) do
    http_client = Keyword.get(opts, :http_client, @default_http_client)

    case http_client.get(url) do
      {:ok, %{body: body, status_code: 200}} ->
        {:ok, Jason.decode!(body)}

      {:ok, %{status_code: status_code}} ->
        {:error, status_code}

      {:error, error} ->
        {:error, error}
    end
  end
end
