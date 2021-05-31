# Awk script for markdown preprocessing and Lilypond music notation

BEGIN {
  inheader = 0
}

/<dc-metadata>/ {
    inheader = 1
    print
}

/<\/dc-metadata>/ {
    inheader = 0
		print "    <dc:Identifier id=\"uid\">Esperanto-English</dc:Identifier>"
		print "    <dc:Title><h2>Esperanto to English</h2></dc:Title>"
        print "    <dc:Language>Esperanto</dc:Language>"
}

{
    if (!inheader) {
        print
    }
}


