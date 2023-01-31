Debug = true
Promise = nil

exports(
	"ActionMinigame",
	function(data)
		SetNuiFocus(true, false)
		SendNUIMessage(
			{
				action = "ACTION_MINIGAME",
				data = data
			}
		)
		Promise = promise.new()
		local result = Citizen.Await(Promise)
		return result
	end
)

RegisterNUICallback(
	"ACTION_MINIGAME_RESULT",
	function(result, cb)
		SetNuiFocus(false, false)
		Promise:resolve(result)
		cb("OK")
	end
)

if Debug then
	RegisterCommand(
		"test",
		function()
			local result =
				exports["sct_skillcheck_minigame"]:ActionMinigame(
				{
					duration = 1,
					maxRound = 5
				}
			)
			print(json.encode(result))
		end,
		false
	)
end
