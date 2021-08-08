defmodule RealWorldWeb.Router do
  use RealWorldWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :put_secure_browser_headers, %{"Access-Control-Allow-Origin" => "*"}
  end

  scope "/", RealWorldWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", RealWorldWeb do
    pipe_through :api

    # authentication
    post "/users/login", ApiController, :register_user

    # registration
    post "/users", ApiController, :register_user

    # get current uder
    get "/user", ApiController, :register_user

    # update user
    put "/user", ApiController, :register_user

    # get profile
    get "/profiles/:username", ApiController, :register_user

    # follow user
    post "/profiles/:username/follow", ApiController, :register_user

    # unfollow user
    delete "/profiles/:username/follow", ApiController, :register_user

    # list articles
    get "/articles", ApiController, :get_articles

    # feed articles
    get "/articles/feed", ApiController, :get_articles

    # get article
    get "/articles/:slug", ApiController, :get_articles

    # create article
    get "/articles", ApiController, :get_articles

    # update article
    put "/articles/:slug", ApiController, :get_articles

    # delete article
    delete "/articles/:slug", ApiController, :get_articles

    # add comments to an article
    post "/articles/:slug/comments", ApiController, :get_articles

    # get comments from an article
    get "/articles/:slug/comments", ApiController, :get_articles

    # delete comment
    delete "/articles/:slug/comments/:id", ApiController, :get_articles

    # favorite article
    post "/articles/:slug/favorite", ApiController, :get_articles

    # unfavorite article
    delete "/articles/:slug/favorite", ApiController, :get_articles

    # get tags
    get "/tags", ApiController, :get_tags
  end

  # Other scopes may use custom stacks.
  # scope "/api", RealWorldWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: RealWorldWeb.Telemetry
    end
  end
end
