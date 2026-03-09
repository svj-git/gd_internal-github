BEGIN ~rqcrat01~

IF ~True()~ THEN BEGIN Crate
    SAY ~Trest has instructed me to release men working for Alatos only inside citadel. I should release these prisoners inside citadel on the main floor.~
    IF ~AreaCheck("AR7607")~ THEN REPLY ~I will release these fools, and everyone will blame Alatos for my attack on the Flaming Fist!~ DO
        ~CreateCreatureObject("rqthi1a",Player1,0,0,0)
        CreateCreatureObject("rqthi2a",Player1,0,0,0)
        CreateCreatureObject("rqthi3a",Player1,0,0,0)
        CreateCreatureObject("rqthi4a",Player1,0,0,0)
        DestroyItem("rqcrat01")~ EXIT
    IF ~!AreaCheck("AR7607")~ THEN REPLY ~I should not jeopardize my mission by releasing these fools outside the citadel.~ EXIT
END
