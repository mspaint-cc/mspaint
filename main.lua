if not getgenv().ExecutorSupport then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/mspaint/main/executorTest.lua"))()
end


loadstring(game:HttpGet("https://raw.githubusercontent.com/Fuydutdtu/mspaintv3omg/refs/heads/main/places/2440500124.lua"))()
if not getgenv().BloxstrapRPC then
    local HttpService = game:GetService("HttpService")

    local BloxstrapRPC = {}

    export type RichPresence = {
        details:     string?,
        state:       string?,
        timeStart:   number?,
        timeEnd:     number?,
        smallImage:  RichPresenceImage?,
        largeImage:  RichPresenceImage?
    }

    export type RichPresenceImage = {
        assetId:    number?,
        hoverText:  string?,
        clear:      boolean?,
        reset:      boolean?
    }

    function BloxstrapRPC.SendMessage(command: string, data: any)
        local json = HttpService:JSONEncode({
            command = command, 
            data = data
        })
        
        print("[BloxstrapRPC] " .. json)
    end

    function BloxstrapRPC.SetRichPresence(data: RichPresence)
        if data.timeStart ~= nil then
            data.timeStart = math.round(data.timeStart)
        end
        
        if data.timeEnd ~= nil then
            data.timeEnd = math.round(data.timeEnd)
        end
        
        BloxstrapRPC.SendMessage("SetRichPresence", data)
    end 

    getgenv().BloxstrapRPC = BloxstrapRPC
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/mspaint/main/places/" .. game.GameId .. ".lua"))()
