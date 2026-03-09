BEGIN ~rqburth~

IF ~~ THEN BEGIN RevengeParty3
    SAY ~Bah! Stop this useless talk and watch carefully. <CHARNAME> might come here at any time. Thieves said he is in Athkatla. Damn! there he is! Kill him! ~
    IF ~~ THEN
        DO %Enemy()
            ActionOverride("rqburgo1",Enemy())
            ActionOverride("rqburgo2",Enemy())
            ActionOverride("rqburgo3",Enemy())
            DisplayStringHead("rqburgo2",~Anbasa Bite!~)% // Anbasa Bite!
        EXIT
END

BEGIN ~rqburgo1~

IF ~~ THEN BEGIN RevengeParty2
    SAY ~Y-yeah, I g-gree... Wait, no! I no agree! We sh-should find dis <CHARNAME> and... and eat his bone fat!~ // Y-yeah, I g-gree... Wait, no! I no agree! We sh-should find dis <CHARNAME> and... and eat his bone fat!
    IF ~~ THEN EXTERN ~rqburth~ RevengeParty3
END

BEGIN ~rqburgo2~

IF ~True()~ THEN BEGIN RevengeParty1
    SAY ~Uh, I dunno 'bout dis Bur'Thuk thingy, maybe we shud go back home, yeah.~
    IF ~~ THEN EXTERN ~rqburgo1~ RevengeParty2
END
