defmodule MyTodoApp.TodoApp.Todo do
  use Ecto.Schema
  import Ecto.Changeset
  alias MyTodoApp.TodoApp.Todo

  # remove extra attributes eg: __meta__ etc
  @derive {Poison.Encoder, only: [:id, :user_id, :title, :description, :completed]}


  schema "todos" do
    field :title, :string
    field :description, :string
    field :completed, :boolean, default: false

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
      |> cast(attrs, [:id, :title, :description])
      |> validate_required([:id, :title, :description])
  end

  def changeset(:completed, %Todo{} = struct, attrs) do
    struct
      |> cast(attrs, [:id, :completed])
      |> validate_required([:id, :completed])
  end

end