defmodule WebApp.Web.TestView do
  use WebApp.Web, :view

  @spec render(String.t, map) :: map
  def render("index.json", _params) do
    %{data: nil}
  end
end
