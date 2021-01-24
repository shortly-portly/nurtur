defmodule Nurtur.Repo.Migrations.CreateOrganisations do
  use Ecto.Migration

  def change do
    create table(:organisations) do
      add :name, :string
      add :user_id, references(:users)

      timestamps()
    end

  end
end
