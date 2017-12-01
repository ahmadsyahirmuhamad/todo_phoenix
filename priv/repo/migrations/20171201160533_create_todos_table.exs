defmodule MyTodoApp.Repo.Migrations.CreateTodosTable do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :title, :string
      add :description, :text
      add :user_id, references(:users)

      timestamps()
    end
    create unique_index(:todos, [:id, :user_id])
  end
end
