function onTick()
 
    local gps_x = input.getNumber(1)
    local gps_y = input.getNumber(2)
    local compass = input.getNumber(3) -- Heading (0-1)
    local yaw = input.getNumber(4)     -- Laser/Turret azimuth (0-1)
    local pitch = input.getNumber(5)   -- Laser/Turret elevation (0-1)
    local dist = input.getNumber(6)    -- Laser distance in meters
    
    
    local heading_rad = compass * 2 * math.pi
    local yaw_rad = yaw * 2 * math.pi
    local pitch_rad = pitch * 2 * math.pi


    local total_yaw = heading_rad + yaw_rad
    
 
    local ground_dist = dist * math.cos(pitch_rad)
    local alt_offset = dist * math.sin(pitch_rad)
    
  
    local target_x = gps_x + ground_dist * math.sin(total_yaw)
    local target_y = gps_y + ground_dist * math.cos(total_yaw)
    
   
    output.setNumber(1, target_x)
    output.setNumber(2, target_y)
    output.setNumber(3, alt_offset)
end
