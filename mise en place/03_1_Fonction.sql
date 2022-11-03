BEGIN;
CREATE OR REPLACE FUNCTION get_id_etat_res(etat TEXT)
RETURNS  uuid
AS $$
DECLARE 
	resultat uuid;
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
AS $$
DECLARE 
	resultat uuid;
BEGIN
	SELECT id_type_article INTO resultat
	FROM liste_types_articles
	WHERE lower(int_type) = lower(type_article);
	RETURN resultat;
END
$$
LANGUAGE plpgsql;

COMMIT;