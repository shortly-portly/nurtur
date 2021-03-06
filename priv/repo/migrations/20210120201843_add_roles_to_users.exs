defmodule Nurtur.Repo.Migrations.AddRolesToUsers do
  use Ecto.Migration

  alias Nurtur.Accounts.User.RolesEnum

  def up do
    RolesEnum.create_type()

    alter table(:users) do
      add :role, RolesEnum.type()
    end
  end

  def down do
    alter table(:users) do
      remove :role
    end

    RolesEnum.drop_type()
  end
end
