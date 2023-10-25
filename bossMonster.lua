local islandsLocation = {
	{levelRequirement = 90, position = Vector3.new(-2173, 114, -611)
	{levelRequirement = 160, position = Vector3.new(-4903, 117, -2819)
	{levelRequirement = 250, position = Vector3.new(-5274, 131, -687)
	{levelRequirement = 350, position = Vector3.new(-5971, 154, 2411)
	{levelRequirement = 450, position = Vector3.new(-2859, 118, 1917)
	{levelRequirement = 600, position = Vector3.new(50, 110, 2298)

	{levelRequirement = 700, position = Vector3.new(558, 151, 5675)
	{levelRequirement = 800, position = Vector3.new(-2404, 785, 5551)
	{levelRequirement = 950, position = Vector3.new(-6152, 119, 6881)
	{levelRequirement = 1150, position = Vector3.new(2661, 1103, 95)
	{levelRequirement = 1300, position = Vector3.new(3717, 134, 3952)

	{levelRequirement = 1450, position = Vector3.new(3666, 116, 6727)
	{levelRequirement = 1600, position = Vector3.new(2624, 116, -2546)
	{levelRequirement = 1750, position = Vector3.new(6704, 111, -2622)

	{levelRequirement = 1900, position = Vector3.new(6707, 114, 92)
	{levelRequirement = 2050, position = Vector3.new(7056, 114, 2726)
	{levelRequirement = 2200, position = Vector3.new(7462, 111, 6574)

}


local bossMonster ={
	[400] = "Tashii",
	[550] = "King Gorilla",
	[650] = "Marine Captain",
	[750] = "Minotaur",
	[850] = "Vice Admiral",
	[900] = "Ice Admiral",
	[1100] = "Thunder God",
	[1250] = "Revolutionary Boss",
	[1400] = "Warden",
	[1500] = "Vergo",
	[1550] = "Snow Harpy",
	[1700] = "Neptune",
	[1850] = "Shiryu",
	[2000] = "G4 Boss",
	[2150] = "Ryummy"
}


local gameData = {
    { questLevel = 1, isLand = "Starter Island", isLandPosition = Vector3.new(-2185, 144, -3240), monster = "Thief", npcId = "1" },
    { questLevel = 10, isLand = "Starter Island", isLandPosition = Vector3.new(-2185, 144, -3240), monster = "Bandit", npcId = "1" },
    { questLevel = 40, isLand = "Clown Island", isLandPosition = Vector3.new(-2173, 114, -611), monster = "Pirate Clown", npcId = "2" },
    { questLevel = 90, isLand = "Shark Park", isLandPosition = Vector3.new(-4903, 117, -2819), monster = "Fishman", npcId = "3" },
    { questLevel = 160, isLand = "Desert Ruins", isLandPosition = Vector3.new(-5274, 131, -687), monster = "Desert Thief", npcId = "4" },
    { questLevel = 250, isLand = "Sea Restaurant", isLandPosition = Vector3.new(-5971, 154, 2411), monster = "Krieg Pirate", npcId = "5" },
    { questLevel = 350, isLand = "Logue Town", isLandPosition = Vector3.new(-2859, 118, 1917), monster = "Marine Recruit", npcId = "6" },
    { questLevel = 450, isLand = "Tall Woods", isLandPosition = Vector3.new(50, 110, 2298), monster = "Monkey", npcId = "7" },
    { questLevel = 500, isLand = "Tall Woods", isLandPosition = Vector3.new(50, 110, 2298), monster = "Gorilla", npcId = "7" },
    { questLevel = 600, isLand = "Marine Base Town", isLandPosition = Vector3.new(558, 151, 5675), monster = "Marine Grunt", npcId = "8" },
    { questLevel = 700, isLand = "Three Islands", isLandPosition = Vector3.new(-2404, 785, 5551), monster = "Satyr", npcId = "9" },
    { questLevel = 800, isLand = "Marine HQ", isLandPosition = Vector3.new(-6152, 119, 6881), monster = "Elite Marine", npcId = "10" },
    { questLevel = 950, isLand = "Sky Island", isLandPosition = Vector3.new(2661, 1103, 95), monster = "Sandorian Warrior", npcId = "11" },
    { questLevel = 1000, isLand = "Sky Island", isLandPosition = Vector3.new(2661, 1103, 95), monster = "Divine Soldier", npcId = "11" },
    { questLevel = 1050, isLand = "Sky Island", isLandPosition = Vector3.new(2661, 1103, 95), monster = "Holy Soldier", npcId = "12" },
    { questLevel = 1150, isLand = "Revolutionary Base", isLandPosition = Vector3.new(3717, 134, 3952), monster = "Revolutionary", npcId = "13" },
    { questLevel = 1200, isLand = "Revolutionary Base", isLandPosition = Vector3.new(3717, 134, 3952), monster = "Revolutionary Elite", npcId = "13" },
    { questLevel = 1300, isLand = "Impel Jail", isLandPosition = Vector3.new(3666, 116, 6727), monster = "Impel Guard", npcId = "14" },
    { questLevel = 1350, isLand = "Impel Jail", isLandPosition = Vector3.new(3666, 116, 6727), monster = "Impel Elite", npcId = "14" },
    { questLevel = 1450, isLand = "Cold Island", isLandPosition = Vector3.new(2624, 116, -2546), monster = "Corrupt Marine", npcId = "15" },
    { questLevel = 1600, isLand = "Fishman Island", isLandPosition = Vector3.new(6704, 111, -2622), monster = "Island Fishman", npcId = "16" },
    { questLevel = 1650, isLand = "Fishman Island", isLandPosition = Vector3.new(6704, 111, -2622), monster = "Fishman Elite", npcId = "16" },
    { questLevel = 1750, isLand = "Skull Island", isLandPosition = Vector3.new(6707, 114, 92), monster = "Skull Pirate", npcId = "17" },
    { questLevel = 1800, isLand = "Skull Island", isLandPosition = Vector3.new(6707, 114, 92), monster = "Pirate Elite", npcId = "17" },
    { questLevel = 1900, isLand = "Bubble Island", isLandPosition = Vector3.new(7056, 114, 2726), monster = "Pirate", npcId = "18" },
    { questLevel = 1950, isLand = "Bubble Island", isLandPosition = Vector3.new(7056, 114, 2726), monster = "Armored Marine", npcId = "18" },
    { questLevel = 2050, isLand = "Thriller Boat", isLandPosition = Vector3.new(7056, 114, 2726), monster = "Skeleton", npcId = "19" },
    { questLevel = 2100, isLand = "Thriller Boat", isLandPosition = Vector3.new(7462, 111, 6574), monster = "Mummy", npcId = "19" },
}
