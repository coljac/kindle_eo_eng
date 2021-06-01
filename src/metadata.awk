# Awk script for markdown preprocessing and Lilypond music notation

BEGIN {
  inheader = 0
}

/<dc-metadata>/ {
    inheader = 1
    print
}

/DictionaryInLanguage/ {
    $0 = "      <DictionaryInLanguage>eo</DictionaryInLanguage>  "
}

/<\/dc-metadata>/ {
    inheader = 0
		print "    <dc:Identifier id=\"uid\">esperanto_english</dc:Identifier>"
		print "    <!-- Title of the document -->"
		print "    <dc:Title><h2>Esperanto to English</h2></dc:Title>"
        print "    <dc:Language>EN</dc:Language>"
}

{
    if (!inheader) {
        print
    }
}


