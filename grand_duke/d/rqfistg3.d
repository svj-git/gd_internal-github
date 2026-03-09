BEGIN ~rqfistg3~

IF ~Global("rqGDNeutralPathStep5","GLOBAL",2)~ THEN BEGIN SurrenderOrElse
    SAY ~Surrender yourselves, party of <CHARNAME>! We do not wish to harm you. I repeat, no injury shall happen to you if you lay down your weapons.~
    IF ~~ THEN REPLY ~Ha! Flaming Fist shall suffer greatly for this!~
        DO
            ~SetGlobal("rqGDNeutralPathStep5","GLOBAL",3)
            SetGlobal("rqGDNeutralSt5Battle","GLOBAL",1)
            ReputationInc(-6)
            Enemy()~
        EXIT
    IF ~~ THEN REPLY ~I have seen enough bloodshed. We will lay down our weapons and surrender.~
        DO
            ~SetGlobal("rqGDNeutralPathStep5","GLOBAL",3)
            ActionOverride(Player1,LeaveAreaLUAPanic("AR7607","",[959.750],E))
            ActionOverride(Player1,LeaveAreaLUA("AR7607","",[959.750],E))
            ActionOverride(Player1,SetMasterArea("AR8000"))  // Southwest Baldur's Gate
            ActionOverride(Player2,LeaveAreaLUA("AR7607","",[1010.737],E))
            ActionOverride(Player3,LeaveAreaLUA("AR7607","",[1019.697],E))
            ActionOverride(Player4,LeaveAreaLUA("AR7607","",[1068.724],E))
            ActionOverride(Player5,LeaveAreaLUA("AR7607","",[1048.759],E))
            ActionOverride(Player6,LeaveAreaLUA("AR7607","",[1070.770],E))
            MultiPlayerSync()~
        EXIT
    IF ~~ THEN REPLY ~We mean no harm to the Flaming Fist; we shall surrender.~
        DO
            ~SetGlobal("rqGDNeutralPathStep5","GLOBAL",3)
            ActionOverride(Player1,LeaveAreaLUAPanic("AR7607","",[959.750],E))
            ActionOverride(Player1,LeaveAreaLUA("AR7607","",[959.750],E))
            ActionOverride(Player1,SetMasterArea("AR8000"))  // Southwest Baldur's Gate
            ActionOverride(Player2,LeaveAreaLUA("AR7607","",[1010.737],E))
            ActionOverride(Player3,LeaveAreaLUA("AR7607","",[1019.697],E))
            ActionOverride(Player4,LeaveAreaLUA("AR7607","",[1068.724],E))
            ActionOverride(Player5,LeaveAreaLUA("AR7607","",[1048.759],E))
            ActionOverride(Player6,LeaveAreaLUA("AR7607","",[1070.770],E))
            MultiPlayerSync()~
        EXIT
END

