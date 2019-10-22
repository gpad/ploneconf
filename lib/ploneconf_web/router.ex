defmodule PloneconfWeb.Router do
  use PloneconfWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PloneconfWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/storage", PageController, :storage
    get "/memory", PageController, :memory
    get "/const", PageController, :const
  end

  # Other scopes may use custom stacks.
  # scope "/api", PloneconfWeb do
  #   pipe_through :api
  # end
end
