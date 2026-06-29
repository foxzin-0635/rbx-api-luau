local CR = getModule("CreateRecursive")
local autoc = {}

function autoc.Init()
  local menu = CR.Create({
    {
      ClassName = "ScreenGui",
      Childs = {
        {
          ClassName = "Frame",
          BackgroundColor3 = Color3.fromRGB(5,5,5),
          BorderSizePixel = 0,
          Size = UDim2.new(0,350,0,15),
          Position = UDim2.fromScale(0.5,0.5),
          AnchorPoint = Vector2.new(0.5,0.5),
          Childs = {
            {
              ClassName = "UICorner"
            },
            {
              ClassName = "Frame",
              BackgroundColor3 = Color3.fromRGB(5,5,5),
              BorderSizePixel = 0,
              Size = UDim2.new(1,0,0,5),
              Position = UDim2.fromScale(0.5,1),
              AnchorPoint = Vector2.new(0.5,1)
            },
            {
              ClassName = "UIDragDetector"
            }
          }
        }
      }
    }
  }, nil, game:GetService("CoreGui"))

  task.wait(15)
  menu:Destroy()
end

return autoc