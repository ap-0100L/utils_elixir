defimpl Jason.Encoder, for: Function do
  ####################################################################################################################
  ####################################################################################################################
  @moduledoc """
  ## Module
  """

  ####################################################################################################################
  @doc """
  ## Function
  """
  @impl Jason.Encoder
  def encode(value, options) do
    value
    |> inspect()
    |> Jason.Encoder.encode(options)
  end

  ####################################################################################################################
  ####################################################################################################################
end
