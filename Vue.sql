-- DROP MATERIALIZED VIEW IF EXISTS public.listes_boissons;

CREATE MATERIALIZED VIEW IF NOT EXISTS public.listes_boissons
TABLESPACE pg_default
AS
 SELECT md5(articles.int_article::text) AS id,
    articles.int_article,
    articles.ingrd,
    articles.prix
   FROM articles
  WHERE articles.id_type_article = (get_id_type_article('boisson'))
WITH DATA;

ALTER TABLE IF EXISTS public.listes_boissons
    OWNER TO postgres;


CREATE UNIQUE INDEX id_boisson
    ON public.listes_boissons USING btree
    (id COLLATE pg_catalog."default")
    TABLESPACE pg_default;
	
---

-- DROP MATERIALIZED VIEW IF EXISTS public.listes_plats;

CREATE MATERIALIZED VIEW IF NOT EXISTS public.listes_plats
TABLESPACE pg_default
AS
 SELECT md5(articles.int_article::text) AS id,
    articles.int_article,
    articles.ingrd,
    articles.prix
   FROM articles
  WHERE articles.id_type_article = (get_id_type_article('plat'))
WITH DATA;

ALTER TABLE IF EXISTS public.listes_plats
    OWNER TO postgres;


CREATE UNIQUE INDEX id_plat
    ON public.listes_plats USING btree
    (id COLLATE pg_catalog."default")
    TABLESPACE pg_default;