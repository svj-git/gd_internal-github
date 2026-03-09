I_C_T BODHI 6 RevBodhiDeal
== rqbroJ IF ~IsValidForPartyDialog("rqbro")~ THEN ~Take the offer, <CHARNAME>. I tell ya, the Shadow Thieves be even more treacherous than she be. Trust not their words, or ye'll regret it!~
END

I_C_T HELLJON 7 RevIrenicus
== rqbroJ IF ~IsValidForPartyDialog("rqbro")~ THEN ~I'll dunk me beard in yer damn cursed blood, ye scurvy rat!~
END

I_C_T HELLJON 8 RevIrenicus
== rqbroJ IF ~IsValidForPartyDialog("rqbro")~ THEN ~I'll dunk me beard in yer damn cursed blood, ye scurvy rat!~
END

I_C_T HELLJON 9 RevIrenicus
== rqbroJ IF ~IsValidForPartyDialog("rqbro")~ THEN ~I'll dunk me beard in yer damn cursed blood, ye scurvy rat!~
END

I_C_T HELLJON 10 RevIrenicus
== rqbroJ IF ~IsValidForPartyDialog("rqbro")~ THEN ~I'll dunk me beard in yer damn cursed blood, ye scurvy rat!~
END

INTERJECT_COPY_TRANS PLAYER1 25 BrokkrInHell
== rqbroJ IF ~IsValidForPartyDialog("rqbro")~ THEN ~Ah, ye treacherous pull o' yours dragged ye into the Abyss, did it? Aye, where's that blasted mage o' yours, I wonder? I've a mighty thirst to carve a new hole in his skull, I do.~
END

INTERJECT_COPY_TRANS FINSOL01 27 BrokkrDivinity
== rqbro25J IF ~IsValidForPartyDialog("rqbro")~ THEN ~If ye refuse yer rightful inheritance, yer name shall be cursed and spoken as a fool's by all who hear it!~
END

EXTEND_TOP FATESP 6 #1
  IF ~!Dead("rqbro")
        !InMyArea("rqbro")
        Global("rqGDBrokSummoned","GLOBAL",0)~ THEN REPLY ~Bring me Brokkr, the dwarven fighter/thief.~
    DO ~CreateVisualEffect("SPPORTAL",[1999.1228])
        Wait(2)
        CreateCreature("rqfith25",[1999.1228],0)
        AddXPObject("rqbro",2500000)
        SetGlobal("rqGDBrokSummoned","GLOBAL",1)~ GOTO 8
END

EXTEND_BOTTOM PLAYER1 33
IF ~IsValidForPartyDialog("rqbro")~ THEN DO ~~ GOTO Brokkr555
END

EXTEND_BOTTOM PLAYER1 33
IF ~IsValidForPartyDialog("rqbro")~ THEN DO ~~ GOTO Brokkr555
END

APPEND PLAYER1
IF ~~ Brokkr555
SAY ~Your eyes judge dwarf Brokkr. Will he risk everything for your battle with Irenicus?~
IF ~~ THEN REPLY ~It is for you to decide, Brokkr. Are you with me or are you not?~ EXTERN ~rqbroJ~ reasoning
IF ~~ THEN REPLY ~Brokkr, you don't need to do this...~ EXTERN ~rqbroJ~ reasoning
END
END

APPEND rqbroJ
IF ~~ reasoning
SAY ~Ye helped me once before, so why in the depths of the earth wouldn't I lend ye a hand now to snatch the final victory?~
COPY_TRANS PLAYER1 33
END
END

// Volo companions
EXTEND_BOTTOM SARVOLO 9
    IF ~InParty("rqbro")~ THEN REPLY ~Tell me about Brokkr.~ GOTO VoloAboutBrokkr
END

APPEND SARVOLO

    IF ~~ THEN BEGIN VoloAboutBrokkr
        SAY ~No one knows from where he has come from, yet this shadowy champion has grown into one of the most powerful warriors. Mastering both fighting skills and the arts of subterfuge, he has become one of the most terrifying dwarves to ravage Faerun.~
        IF ~!IsValidForPartyDialog("rqbro")~ THEN GOTO 9
        IF ~IsValidForPartyDialog("rqbro")~ THEN EXTERN ~rqbro25J~ BrokkrAnswerToVolo
    END
END
