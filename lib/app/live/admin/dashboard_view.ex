defmodule App.Live.Admin.DashboardView do
  use Phoenix.LiveView

  # import App.Router.Helpers

  @doc false
  def mount(session, %Phoenix.LiveView.Socket{} = socket) do
    {:ok, assign(socket, session: session)}
  end

  @spec render(%{socket: Phoenix.LiveView.Socket.t()}) :: Phoenix.LiveView.Rendered.t()
  def render(%{socket: %Phoenix.LiveView.Socket{}} = assigns) do
    ~L"""
    <!--- <div class="controller-title">
      <div class="fluid-container">
        Dashboard
      </div>
    </div> ---!>

    <section id="dashboard" class="fluid-container">
      <div class="row">
        <div class="col m3 s12">
          <div class="green card">
            <div class="dashboard">
              <div class="content">
                <div class="white-text value">
                  90.000,00
                </div>
                <div class="white-text label">
                  Spent
                </div>
              </div>
              <div class="white-text icon light">
                <i class="material-icons">monetization_on</i>
              </div>
            </div>
          </div>
        </div>

        <div class="col m3 s12">
          <div class="orange darken-4 card">
            <div class="dashboard">
              <div class="content">
                <div class="white-text value">
                  235
                </div>
                <div class="white-text label">
                  Sells
                </div>
              </div>
              <div class="white-text icon light">
                <i class="material-icons">shopping_cart</i>
              </div>
            </div>
          </div>
        </div>

        <div class="col m3 s12">
          <div class="blue card">
            <div class="dashboard">
              <div class="content">
                <div class="white-text value">
                  90
                </div>
                <div class="white-text label">
                  Visits
                </div>
              </div>
              <div class="white-text icon light">
                <i class="material-icons">people</i>
              </div>
            </div>
          </div>
        </div>

        <div class="col m3 s12">
          <div class="cyan card">
            <div class="dashboard">
              <div class="content">
                <div class="white-text value">
                  25
                </div>
                <div class="white-text label">
                  New Users
                </div>
              </div>
              <div class="white-text icon light">
                <i class="material-icons">person_add</i>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col m12 s12">
          <div class="grey darken-2 card">
            <div class="dashboard">
              <div class="content">
                <div class="white-text value">
                  90.000,00
                </div>
                <div class="white-text label">
                  Spent
                </div>
              </div>
              <div class="white-text icon dark">
                <i class="material-icons">monetization_on</i>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    """
  end
end
