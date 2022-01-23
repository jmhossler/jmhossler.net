defmodule PersonalInfoWeb.PageController do
  use PersonalInfoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
