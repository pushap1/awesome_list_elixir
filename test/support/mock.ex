defmodule Mock do
  @json_library Application.get_env(:phoenix, :json_library)

  def get("https://api.github.com/repos/h4cc/awesome-elixir/readme") do
    {
      :ok,
      %{
        status_code: 200,
        body: @json_library.encode!(%{"content" => Base.encode64("readme")})
      }
    }
  end

  def get("https://api.github.com/repos/owner/repo/readme") do
    {
      :ok,
      %{
        status_code: 200,
        body: @json_library.encode!(%{"content" => Base.encode64("successful")})
      }
    }
  end

  def get("https://api.github.com/repos/owner/repo") do
    {
      :ok,
      %{
        status_code: 200,
        body: @json_library.encode!(%{"stargazers_count" => 100_500})
      }
    }
  end

  def get("https://api.github.com/repos/owner/repo/commits/master") do
    {
      :ok,
      %{
        status_code: 200,
        body:
          @json_library.encode!(%{
            "commit" => %{
              "author" => %{
                "date" => "2020-02-07T20:12:52Z"
              }
            }
          })
      }
    }
  end
end
