use Mix.Config

remote_schema_resolver = fn(url) -> 
  {:ok,{{_,_,_},_,body}} = :httpc.request('#{url}')
  body |> to_string() |> Poison.decode!
end

config :ex_json_schema, :remote_schema_resolver, remote_schema_resolver
