BEGIN;

-- FUNCTION: public.insert_new_res_etat()

-- DROP FUNCTION IF EXISTS public.insert_new_res_etat();

CREATE OR REPLACE FUNCTION public.insert_new_res_etat()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
BEGIN
	-- Verifie que nom_employe et salary sont donnés
	IF (TG_TABLE_NAME = 'reservations' AND TG_WHEN = 'AFTER'
		AND TG_OP = 'INSERT') THEN
		INSERT INTO public.etat_res(id_res, date_debut, id_etat_res)
		VALUES(NEW.id_res, now(),get_id_etat_res('demander'));
	END IF;
	RETURN NULL;
END;
$BODY$;

ALTER FUNCTION public.insert_new_res_etat()
    OWNER TO postgres;

-- Trigger: insert_new_res_etat

-- DROP TRIGGER IF EXISTS insert_new_res_etat ON public.reservations;

CREATE TRIGGER insert_new_res_etat
    AFTER INSERT
    ON public.reservations
    FOR EACH ROW
    EXECUTE FUNCTION public.insert_new_res_etat();
COMMIT;