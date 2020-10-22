defmodule TimemanagerWeb.WorkingTimeView do
  use TimemanagerWeb, :view
  alias TimemanagerWeb.WorkingTimeView
  alias Timemanager.Time

  def render("index.json", %{workingtimes: workingtimes}) do
    %{data: render_many(workingtimes, WorkingTimeView, "working_time.json")}
  end

  def render("show.json", %{working_time: working_time}) do
    %{data: render_one(working_time, WorkingTimeView, "working_time.json")}
  end

  def render("working_time.json", %{working_time: working_time}) do
    %{id: working_time.id,
      start: Timemanager.Time.get_time(working_time.start),
      end: Timemanager.Time.get_time(working_time.end)
    }
  end
end
