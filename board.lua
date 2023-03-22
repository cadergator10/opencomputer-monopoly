--The board config. Allows user to change how monopoly is played.

local function propertySpace(name,group,price,housePrice,charges,mortgage) --spaces that you need to buy every spot to raise the price, then after all are obtained can build on it.
    return {["type"]="prop",["name"]=name,["group"]=group,["price"]=price,["house"]=housePrice,["charge"]=charges,["mortgage"]=mortgage or price / 2}
end
--NOTE: nil on any mortgage auto does half of the price.
local function railroadSpace(name,group,price,charges,mortgage) --spaces that charge of landing on it increases as you purchase more and more. No houses.
    return {["type"]="rail",["name"]=name,["group"]=group,["price"]=price,["charge"]=charges,["mortgage"]=mortgage or price / 2}
end

local function utilitySpace(name,group,price,rollCharge,mortgage) --spaces that charge based on dice roll. (rollCharge holds the multipliers ([1] is 4 and [2] is 10 for a normal monopoly game))
    return {["type"]="util",["name"]=name,["group"]=group,["price"]=price,["house"]=housePrice,["charge"]=charges,["mortgage"]=mortgage or price / 2}
end

local function taxSpace(name,charge) --spaces that charge you upon landing on it no matter what.
    return {["type"]="tax",["name"]=name,["charge"]=charge}
end

local function cardSpace(group) --spaces that let you draw a card
    return {["type"]="card",["group"]=group}
end

local function emptySpace(name) --nothing happens
    return {["type"]="empty",["name"]=name} --name is fine to be nil here
end

local cards = {
    { --chest

    },
    { --chance

    }
}
--Board works on multiples of 4. Corners are hard coded in. Normal board has 9 between each corner, so 36 for a normal board game
local board = {
    propertySpace("Mediterranean Avenue",1,60,50,{2,10,30,90,160,250},30),
    cardSpace(1),
    propertySpace("Baltic Avenue",1,60,50,{4,20,60,180,320,450},30),
    taxSpace("Income Tax",200),
    railroadSpace("Reading RR",1,200,{25,50,100,200},100),
    propertySpace("Oriental Avenue",2,100,50,{6,30,90,270,400,550},50),
    cardSpace(2),
    propertySpace("Vermont Avenue",2,100,50,{6,30,90,270,400,550},50),
    propertySpace("Connecticut Avenue",2,120,50,{8,40,100,300,450,625},60), --End of side 1
    propertySpace("St. Charles Place",3,140,100,{10,50,150,450,625,750},70), --Beg of side 2
    utilitySpace("Electric Company",1,150,{4,10},75),
    propertySpace("States Avenue",3,140,100,{10,50,150,450,625,750},70),
    propertySpace("Virginia Avenue",3,160,100,{12,60,180,500,700,900},80),
    railroadSpace("Pennsylvania RR",1,200,{25,50,100,200},100),
    propertySpace("St. James Place",4,180,100,{14,70,200,550,750,950},90),
    cardSpace(1),
    propertySpace("Tennessee Avenue",4,180,100,{14,70,200,550,750,950},90),
    propertySpace("New York Avenue",4,200,100,{16,80,220,600,800,1000},100), --End of side 2
    propertySpace("Kentucky Avenue",5,220,150,{18,90,250,700,875,1050},110), --Beg of side 3
    cardSpace(2),
    propertySpace("Indiana Avenue",5,220,150,{18,90,250,700,875,1050},110),
    propertySpace("Illinois Avenue",5,240,150,{20,100,300,750,925,1100},120),
    railroadSpace("B&O RR",1,200,{25,50,100,200},100),
    propertySpace("Atlantic Avenue",6,260,150,{22,110,330,800,975,1150},130),
    propertySpace("Ventnor Avenue",6,260,150,{22,110,330,800,975,1150}), --started leaving mortgage empty: half of price is 130
    utilitySpace("Water Works",1,150,{4,10}),
    propertySpace("Marvin Gardens",6,280,150,{24,120,360,850,1025,1200}), --End of side 3
    propertySpace("Pacific Avenue",7,300,200,{26,130,390,900,1100,1275}), --Beg of side 4
    propertySpace("North Carolina Avenue",7,300,200,{26,130,390,900,1100,1275}),
    cardSpace(1),
    propertySpace("Pennsylvania Avenue",7,320,200,{28,150,450,1000,1200,1400}),
    railroadSpace("Short Line",1,200,{25,50,100,200}),
    cardSpace(2),
    propertySpace("Park Place",8,350,200,{35,175,500,1100,1300,1500}),
    taxSpace("Luxury Tax",100),
    propertySpace("Boardwalk",8,400,200,{50,200,600,1400,1700,2000}), --End of side 4
}

