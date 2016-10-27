defmodule Lightspeed do
  @moduledoc """
  An OAuth2 strategy for Lightspeed.
  """
  use OAuth2.Strategy

  alias OAuth2.Strategy.AuthCode

  defp config do
    [strategy: Lightspeed,
     site: "https://cloud.merchantos.com",
     authorize_url: "/oauth/authorize.php",
     token_url: "/oauth/access_token.php"]
  end

  # ?response_type=code&client_id={client_id}&scope={scope}

  # Public API

  def client do
    Application.get_env(:oauth2_example, Lightspeed)
    |> Keyword.merge(config())
    |> OAuth2.Client.new()
  end

  def authorize_url!(params \\ []) do
    OAuth2.Client.authorize_url!(client(), params)
  end

  def get_token!(params \\ [], headers \\ []) do
    OAuth2.Client.get_token!(client(), params)
  end

  # Strategy Callbacks

  def authorize_url(client, params) do
    AuthCode.authorize_url(client, params)
  end

  def get_token(client, params, headers) do
    client
    |> put_header("Accept", "application/json")
    |> AuthCode.get_token(params, headers)
  end
end
