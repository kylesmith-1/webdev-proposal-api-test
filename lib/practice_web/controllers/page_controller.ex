defmodule PracticeWeb.PageController do
  use PracticeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end


  def send(conn, %{}) do
    y = Practice.send()
    render conn, "send.html", y: y
  end

  # TODO: Add an action for palindrome. DONE
  # TODO: Add a template for palindrome over in lib/*_web/templates/page/??.html.eex DONE
end
