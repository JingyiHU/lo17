#!/usr/bin/perl

while (<>) {
	if (/<texte>/ || /<titre>/) {
		tr/A-Z/a-z/;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])0.746932628094375,([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])14005([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])peut([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])même([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])tout([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])celui([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])notamment([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])fois([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])fait([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])alors([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])autres([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])autant([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])encore([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])sa([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])ses([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])leur([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])plusieurs([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])cadre([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])première([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])développement([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])très([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])ont([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])cet([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])jusqu([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])cours([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])il([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])son([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])celle([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])donc([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])étant([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])si([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])hui([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])rappelons([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])aujourd([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])objectif([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])sein([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])dernier([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])mais([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])effet([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])comme([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])deux([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])été([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])aux([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])qu([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])dont([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])ci([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])sont([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])aussi([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])se([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])ces([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])sur([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])avec([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])s([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])plus([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])ce([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])ainsi([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])est([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])que([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])par([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])cette([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])qui([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])dans([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])un([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])au([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])une([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])pour([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])d([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])les([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])en([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])le([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])et([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])l([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		s/([ \t',.;:?\/"`+*^\(\)\[\]<>-])de([ \t',.;:?\/"`+*^\(\)\[\]<>-])/$1$2/g;
		}
	print $_
	}
