local i
local colorCount = 6
local codeLength = 4
local gameLength = 10
local randomNumber

local name
local colorCode = ""

local firstAttempt = false

local colorList = {"R", "G", "B", "Y", "P", "C"}






local function flush()
    for i = 1,100,1 do
        print("")
    end
end






flush()
print("Hello there! Lets start with your name...")
name = io.read()

for i = 1,codeLength,1 do
    randomNumber = math.random(1, colorCount)
    colorCode = colorCode..colorList[randomNumber]
end

print(colorCode)
