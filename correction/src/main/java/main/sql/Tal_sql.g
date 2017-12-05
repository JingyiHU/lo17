grammar Tal_sql;

@lexer::header {
    package main.sql.output;
}

@parser::header {
    package main.sql.output;
}

SELECT : 'SELECT'
;

COUNT 	: 'COUNT'
;

FICHIER : 'FICHIER'
;

NUMERO : 'NUMERO'
;

NOMBRE : 'NOMBRE'
;

CONJ : 'ET' | 'OU'
;

POINT : '.'
;

TEXTE : 'TEXTE'
;

DATE : 'DATE'
;

CHAR 	: 'Â' .. 'ü'|'a'..'z'|'A'..'Z'
;

VAR 	: (CHAR | '0'..'9')+
;

WS  : (' ' |'\t' | '\r') {skip();} | '\n' 
;

listerequetes returns [Arbre lr_arbre = new Arbre("")]:
		r = requete POINT
			{
				lr_arbre.ajouteFils($r.req_arbre);
			}
;

requete returns [Arbre req_arbre = new Arbre("")]
	@init {Arbre ps_arbre;} : 
		SELECT
			{
				req_arbre.ajouteFils(new Arbre("","select "));
			} 
		(NOMBRE
			{
			String columns = "count(distinct fichier)";
			req_arbre.ajouteFils(new Arbre("",columns));
			req_arbre.setStringData("columns", columns);
			}
		| FICHIER
			{
			String columns = "fichier";
			String displayColumns = "string_agg(mot, ',') as mots, " + columns;
			req_arbre.ajouteFils(new Arbre("",displayColumns));
			req_arbre.setStringData("columns", columns);
			}
		 | NUMERO
			{
			String columns = "numero";
			String displayColumns = "string_agg(mot, ',') as mots, " + columns;
			req_arbre.ajouteFils(new Arbre("",displayColumns));
			req_arbre.setStringData("columns", columns);
			}
		| DATE
		{
			String columns = "mois, annee, texte.fichier";
			String displayColumns = "count(*) as count, jour, " + columns;
			req_arbre.ajouteFils(new Arbre("", displayColumns));
			req_arbre.setStringData("columns", columns);
		})
		(TEXTE
			{
				req_arbre.ajouteFils(new Arbre("","from texte"));
				req_arbre.ajouteFils(new Arbre("","where"));
			}
		| DATE
			{
				req_arbre.ajouteFils(new Arbre("","from date"));
				req_arbre.ajouteFils(new Arbre("","left join texte on texte.fichier = date.fichier"));
				req_arbre.ajouteFils(new Arbre("","where"));
			}
		)
		ps = params 
			{
				ps_arbre = $ps.les_pars_arbre;
				req_arbre.ajouteFils(ps_arbre);
				req_arbre.setIntegerData("param_count", ps_arbre.getIntegerData("param_count"));
				req_arbre.setBooleanData("intersection", ps_arbre.getBooleanData("intersection"));
			}
;

params returns [Arbre les_pars_arbre = new Arbre("")]
	@init	{Arbre par1_arbre, par2_arbre;} : 
		par1 = param 
			{
				par1_arbre = $par1.lepar_arbre;
				les_pars_arbre.ajouteFils(par1_arbre);
				les_pars_arbre.incrementIntegerData("param_count");
			}
		(conj = CONJ? par2 = param
			{
				par2_arbre = $par2.lepar_arbre;
				les_pars_arbre.ajouteFils(new Arbre("", "OR"));
				les_pars_arbre.ajouteFils(par2_arbre);
				les_pars_arbre.incrementIntegerData("param_count");			
				
				if (conj != null && "ET".equals(conj.getText())) {
					les_pars_arbre.setBooleanData("intersection", true);
				}
			}
		)*
;

param returns [Arbre lepar_arbre = new Arbre("")] :
	a = VAR
		{ lepar_arbre.ajouteFils(new Arbre("mot =", "'"+a.getText()+"'"));}
;

