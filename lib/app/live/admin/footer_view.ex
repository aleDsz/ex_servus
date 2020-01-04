defmodule App.Live.Admin.FooterView do
  use App, :view
  use Phoenix.LiveView

  def render("admin", assigns) do
    ~L"""
    <footer class="blue-grey darken-4 page-footer">
      <div class="footer-copyright">
        <span class="container white-text center">© 2020 Servus CMS<span>
      </div>
    </footer>
    """
  end
end
