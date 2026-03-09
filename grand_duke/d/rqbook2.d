BEGIN ~rqbook2~

IF ~OR(3)
            Class(LastTalkedToBy,RANGER_ALL)
            Class(LastTalkedToBy,PALADIN_ALL)
            Class(LastTalkedToBy,FIGHTER_ALL)
        Global("rqGDBrokkrTreasure","GLOBAL",8)~
        THEN BEGIN Book2IntroValidClass
        SAY ~This Dwarven manual, originally intended for dwarves, could be used by you or your party to train in martial arts.~
        IF ~~ THEN REPLY ~I will train myself following the techniques to become specialized with dwarven weapon tool weapon of dwarwes the axe.~ DO
            ~~ GOTO MartialArtsAxe
        IF ~~ THEN REPLY ~I will train myself following the techniques to become specialized with dwarven weapon tool weapon of dwarwes the war hammer.~ DO
            ~~ GOTO MartialArtsHammer
        IF ~!Class(LastTalkedToBy,CLERIC_ALL) !Class(LastTalkedToBy,CLERIC_ALL)~ THEN REPLY ~I will train myself following the techniques to become specialized with the main battlefield weapon of dwarves, the halberd.~ DO
            ~~ GOTO MartialArtsHalberd
        IF ~~ THEN REPLY ~I will train myself following the techniques to become specialized with the primary militia weapon of dwarves, the spear.~ DO
            ~~ GOTO MartialArtsSpear
        IF ~!Class(LastTalkedToBy,CLERIC_ALL)~ THEN REPLY ~I will train myself following the techniques to become specialized with the primary missile weapon of dwarves, the crossbow.~ DO
            ~~ GOTO MartialArtsCrossbow
        IF ~~ THEN REPLY ~Leave the book alone for now.~ EXIT
END
/*
IF ~Class(LastTalkedToBy,FIGHTER_ALL)~ THEN BEGIN FighterLearnsBest
    SAY ~As a fighter i am able to use this book to not just be specialized but to improve my mastery.~
        IF ~!Class(LastTalkedToBy,CLERIC_ALL)~ THEN REPLY ~I will train myself following the techniques to improve my skill with dwarven weapon tool weapon of dwarwes the axe.~ DO
            ~~ GOTO MartialArtsAxe
        IF ~~ THEN REPLY ~I will train myself following the techniques to improve my skill with dwarven weapon tool weapon of dwarwes the war hammer.~ DO
            ~~ GOTO MartialArtsHammer
        IF ~!Class(LastTalkedToBy,CLERIC_ALL)~ THEN REPLY ~I will train myself following the techniques to improve my skill with the main battlefield weapon of dwarves, the halberd.~ DO
            ~~ GOTO MartialArtsHalberd
        IF ~~ THEN REPLY ~I will train myself following the techniques to improve my skill with the primary militia weapon of dwarves, the spear.~ DO
            ~~ GOTO MartialArtsSpear
        IF ~!Class(LastTalkedToBy,CLERIC_ALL)~ THEN REPLY ~I will train myself following the techniques to improve my skill with the primary missile weapon of dwarves, the crossbow.~ DO
            ~~ GOTO MartialArtsCrossbow
END
*/

IF ~OR(3)
        !Class(LastTalkedToBy,FIGHTER_ALL)
        !Class(LastTalkedToBy,RANGER_ALL)
        !Class(LastTalkedToBy,PALADIN_ALL)
    Global("rqGDBrokkrTreasure","GLOBAL",8)~
    THEN BEGIN Book2IntroInvalidClass
        SAY ~I am not a warrior; training with weapons is unnecessary for me.~
        IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN MartialArtsAxe
    SAY ~After absorbing the knowledge contained in the dwarven manual, you have become specialized in axes.~
    IF ~~ THEN DO ~ApplySpellRES("rqaxe",Myself) ~ EXIT
END

IF ~~ THEN BEGIN MartialArtsHammer
    SAY ~After absorbing the knowledge contained in the dwarven manual, you have become specialized in war hammers.~
    IF ~~ THEN DO ~ApplySpellRES("rqhamm",Myself)~ EXIT
END

IF ~~ THEN BEGIN MartialArtsHalberd
    SAY ~After absorbing the knowledge contained in the dwarven manual, you have become specialized in the halberd.~
    IF ~~ THEN DO ~ApplySpellRES("rqhalber",Myself)~ EXIT
END

IF ~~ THEN BEGIN MartialArtsSpear
    SAY ~After absorbing the knowledge contained in the dwarven manual, you have become specialized in spear.~
    IF ~~ THEN DO ~ApplySpellRES("rqspear",Myself)~ EXIT
END

IF ~~ THEN BEGIN MartialArtsCrossbow
    SAY ~After absorbing the knowledge contained in the dwarven manual, you have become specialized in crossbow.~
    IF ~~ THEN DO ~ApplySpellRES("rqxbow",Myself)~ EXIT
END
