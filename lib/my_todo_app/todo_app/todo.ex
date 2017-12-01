defmodule MyTodoApp.TodoApp.Todo do
  use Ecto.Schema
  import Ecto.Changeset
  alias MyTodoApp.TodoApp.Todo

  # remove extra attributes eg: __meta__ etc
  @derive {Poison.Encoder, only: [:id, :user_id, :title, :description]}


  schema "todos" do
    field :title, :string
    field :description, :string

    # associations
    belongs_to :user, MyTodoApp.TodoApp.User

    timestamps()
  end

  def changeset(:create, %Todo{} = struct, attrs) do
    struct
      |> cast(attrs, [:title, :description])
      |> cast_assoc(:user, required: true)
      |> validate_required([:title, :description])
  end

  def changeset(:update, %Todo{} = struct, attrs) do
    struct
      |> cast(attrs, [:id, :user_id, :title, :description])
      |> validate_required([:id, :user_id, :title, :description])
  end

end