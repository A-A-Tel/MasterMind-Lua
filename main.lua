local randomNumber
local colorCount = 7
local codeLength = 6
local gameLength = 10

local name
local playerInput
local codeEvaluation
local colorListString = "["
local colorCode = ""

local firstAttempt = false
local wrongInput = false

local colorList = {"R", "G", "B", "Y", "P", "C", "O"}


local function flush()
    for i=1,100,1 do
        print("")
    end
end



flush()
print("Hello there! Lets start with your name...")
name = io.read()

for i=1,codeLength,1 do

    randomNumber = math.random(1, colorCount)
    colorCode = colorCode..colorList[randomNumber]
end

colorListString = colorListString..colorList[1]
for i=2,colorCount,1 do

    colorListString = colorListString..", "..colorList[i]
end
colorListString = colorListString.."]"

for i=1,gameLength,1 do
    ::redo::

    flush()

    if name == "Admin" then

        print(colorCode)
    end

    print("Attempt: "..i.."/"..gameLength)
    print("Welcome "..name..", please enter your guess down below.")
    print("Choose from: "..colorListString)
    print()

    if firstAttempt == true then

        print(playerInput)
        print()
        print(codeEvaluation)
        print()
        print("Incorrect colors have been labeled with hyphons (-).")
        print("Correct colors have been labaled black (B).")
        print("Colors present in the code have been labeled white (W)")
        print()
    end

    if wrongInput == true then

        wrongInput = false
        print("ERROR")
        print("Your guess must be "..codeLength.." characters long!")
    end

    playerInput = io.read()

    if #playerInput ~= codeLength then

        wrongInput = true
        goto redo
    end

    firstAttempt = true
    playerInput = string.upper(playerInput)
    codeEvaluation = ""

    if colorCode == playerInput then

        flush()
        print("Nice you did it!")
        return
    end

    for i2=1,codeLength,1 do

        local char1 = string.sub(playerInput,i2,i2)
        local char2 = string.sub(colorCode,i2,i2)

        if char1 == char2 then

            codeEvaluation = codeEvaluation.."B"
        elseif string.find(colorCode,char1) then

            codeEvaluation = codeEvaluation.."W"
        else

            codeEvaluation = codeEvaluation.."-"
        end
    end
end
print("Womp Womp")
