data Result value = Error | OK value deriving (Show)

abbrev "Washington" = OK "WA"
abbrev "Oregon" = OK "OR"
abbrev "Texas"  = OK "TX"
abbrev _        = Error