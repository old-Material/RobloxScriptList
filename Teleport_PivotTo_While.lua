-- ระบุผู้เล่นที่คุณต้องการให้ Pivot ไปยังตำแหน่งเป้าหมาย
local player = game.Players.LocalPlayer

-- ระบุตำแหน่งเป้าหมาย
local targetPosition = Vector3.new(1077.03, 434.937, 924.153) -- ตำแหน่งเป้าหมายที่คุณต้องการ

-- ระบุความเร็วในการเคลื่อนที่
local moveSpeed = 10 -- ความเร็วของการเคลื่อนที่ (เป็นหน่วยต่อวินาที)

-- คำนวณระยะทางรวมระหว่างตำแหน่งปัจจุบันและเป้าหมาย
local totalDistance = (targetPosition - player.Character.HumanoidRootPart.Position).Magnitude

-- กำหนดระยะทางที่จะเคลื่อนที่ในแต่ละรอบของลูป
local stepDistance = totalDistance / 1000

-- ระบุตำแหน่งเป้าหมายในแต่ละรอบของลูป
local nextTargetPosition = player.Character.HumanoidRootPart.Position + (targetPosition - player.Character.HumanoidRootPart.Position).unit * stepDistance

-- สร้างลูป while เพื่อเคลื่อนที่ไปยังตำแหน่งเป้าหมาย
while (nextTargetPosition - targetPosition).Magnitude > stepDistance / 2 do
    -- ใช้ PivotTo เพื่อให้ผู้เล่น Pivot ไปยังตำแหน่งเป้าหมายในแต่ละรอบของลูป
    player.Character:PivotTo(CFrame.new(nextTargetPosition))

    -- รอเป็นระยะเวลาเพื่อให้เคลื่อนที่ค่อยๆ
    wait(0.03)

    -- คำนวณตำแหน่งเป้าหมายในรอบถัดไป
    nextTargetPosition = nextTargetPosition + (targetPosition - player.Character.HumanoidRootPart.Position).unit * stepDistance
end