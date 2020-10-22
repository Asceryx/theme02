defmodule TimemanagerWeb.WorkingTimeController do
  use TimemanagerWeb, :controller

  alias Timemanager.Time
  alias Timemanager.Time.WorkingTime

  action_fallback TimemanagerWeb.FallbackController

  def index(conn, %{"userID" => user_id, "id" => id}) do
    working_time = Time.list_workingtimes(%{"user_id" => user_id, "id" => id})
    render(conn, "show.json", working_time: working_time)
  end

  def index(conn, %{"userID" => user_id, "start" => the_start, "end" => the_end}) do
    workingtimes = Time.list_workingtimes(%{"user_id" => user_id, "start" => the_start, "end" => the_end})
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def index(conn, %{"userID" => user_id, "start" => the_start}) do
    workingtimes = Time.list_workingtimes(%{"user_id" => user_id, "start" => the_start})
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def index(conn, %{"user_id" => user_id, "end" => the_end}) do
    workingtimes = Time.list_workingtimes(%{"userID" => user_id, "end" => the_end})
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def index(conn, %{"userID" => user_id}) do
    workingtimes = Time.list_workingtimes(%{"user_id" => user_id})
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def create(conn, %{"working_time" => working_time_params, "userID" => user_id}) do
    with {:ok, %WorkingTime{} = working_time} <- Time.create_working_time(working_time_params, %{"user_id" => user_id}) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.working_time_path(conn, :index, working_time))
      |> render("show.json", working_time: working_time)
    end
  end

  def show(conn, %{"id" => id}) do
    working_time = Time.get_working_time!(id)
    render(conn, "show.json", working_time: working_time)
  end

  def update(conn, %{"id" => id, "working_time" => working_time_params}) do
    working_time = Time.get_working_time!(id)

    with {:ok, %WorkingTime{} = working_time} <- Time.update_working_time(working_time, working_time_params) do
      render(conn, "show.json", working_time: working_time)
    end
  end

  def delete(conn, %{"id" => id}) do
    working_time = Time.get_working_time!(id)

    with {:ok, %WorkingTime{}} <- Time.delete_working_time(working_time) do
      send_resp(conn, :no_content, "")
    end
  end
end
