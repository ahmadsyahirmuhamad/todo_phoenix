defmodule MyTodoApp.TodoApp.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias MyTodoApp.TodoApp.User

  # remove extra attributes eg: __meta__ etc
  @derive {Poison.Encoder, only: [:id, :email, :first_name, :last_name]}


  schema "users" do
    field :email, :string
    field :password_hash, :string
    field :first_name, :string
    field :last_name, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    # associations
    has_many :todos, MyTodoApp.TodoApp.Todo

    timestamps()
  end

  def changeset(:create, %User{} = struct, attrs) do
    struct
      |> cast(attrs, [:email, :password, :password_confirmation, :first_name, :last_name])
      |> validate_required([:email, :password, :password_confirmation, :first_name])
      |> generate_password_hash()
  end

  def changeset(:update, %User{} = struct, attrs) do
    struct
      |> cast(attrs, [:first_name, :last_name])
      |> validate_required([:first_name, :last_name])
  end

  def changeset(:change_password, %User{} = struct, attrs) do
    struct
      |> cast(attrs, [:password])
      |> validate_required([:password])
      |> generate_password_hash()
  end

  defp generate_password_hash(changeset) do
    password = get_change(changeset, :password)
    hash = Comeonin.Bcrypt.hashpwsalt(password)
    changeset |> put_change(:password_hash, hash)
  end

end