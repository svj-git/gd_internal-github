// Iacob
BEGIN ~rqiacob~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN IacobThreat
    SAY ~Blood of demons! You shall not profane this land with your existence!~
    IF ~~ THEN DO
        ~Enemy()
        ActionOverride("rqgedeon",Enemy())
        ActionOverride("rqdaniel",Enemy())
        ActionOverride("rqavaram",Enemy())
        ActionOverride("rqelias",Enemy())
        ActionOverride("rqiosias",Enemy())
        ActionOverride("rqmicha",Enemy())~
    EXIT
END
