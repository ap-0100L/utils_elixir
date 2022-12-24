defimpl Jason.Encoder, for: Regex do
  ##############################################################################
  ##############################################################################
  @moduledoc """
  ## Module
  """

  ##############################################################################
  @doc """
  ## Function
  """
  @impl Jason.Encoder
  def encode(value, options) do
    value
    |> inspect()
    |> Jason.Encoder.encode(options)
  end

  ##############################################################################
  ##############################################################################
end
