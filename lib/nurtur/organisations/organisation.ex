defmodule Nurtur.Organisations.Organisation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "organisations" do
    field :name, :string

    has_many :users, Nurtur.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(organisation, attrs) do
    organisation
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
