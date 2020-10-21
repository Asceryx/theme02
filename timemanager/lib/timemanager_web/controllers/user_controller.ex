defmodule TimemanagerWeb.UserController do
  use TimemanagerWeb, :controller

  alias Timemanager.Accounts
  alias Timemanager.Accounts.User

  action_fallback TimemanagerWeb.FallbackController

  def index(conn, %{"email" => _email, "username" => username}) do
    user = Accounts.get_user_by_username(username)
    render(conn, "show.json", user: user)
  end


  def index(conn, %{"username" => username}) do
    user = Accounts.get_user_by_username(username)
    render(conn, "show.json", user: user)
  end


  def index(conn, %{"email" => email}) do
    user = Accounts.get_user_by_email(email)
    render(conn, "show.json", user: user)
  end

  def index(conn, %{}) do
    get_all_users(conn)
  end

  def get_all_users(conn) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
