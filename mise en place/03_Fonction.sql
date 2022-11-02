CREATE OR REPLACE FUNCTION get_id_etat_res(etat TEXT)
RETURNS  public.liste_etat_reservation.id_etat_res%Type
AS $$
DECLARE 
	resultat liste_etat_reservation.id_etat_res%Type;
BEGIN
	SELECT id_etat_res INTO resultat FROM liste_etat_reservation 
	WHERE lower(int_etat) = lower(etat);
	RETURN resultat;
END
$$
LANGUAGE plpgsql;
---

-- DROP FUNCTION IF EXISTS public.get_id_type_article(text);

CREATE OR REPLACE FUNCTION public.get_id_type_article(
	type_article text)
    RETURNS uuid
    LANGUAGE 'sql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
SELECT liste_types_articles.id_type_article
FROM liste_types_articles
WHERE lower(liste_types_articles.int_type) = lower(type_article)
$BODY$;

ALTER FUNCTION public.get_id_type_article(text)
    OWNER TO postgres;