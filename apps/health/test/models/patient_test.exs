defmodule Health.PatientTest do
  use Health.ModelCase

  alias Health.Patient

  @valid_attrs %{name: "some content", surname: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Patient.changeset(%Patient{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Patient.changeset(%Patient{}, @invalid_attrs)
    refute changeset.valid?
  end
end
