# Première lecture

---

Légende : 

- En **gras** les entités potentielles

- En <u>souligné</u> les actions réalisables (droit d'accés)

---

Bonjour Azzouz,

Nous vous contactons en urgence pour nous aider à créer notre structure de données.
Vous avez quartier libre sur la structure (nous vous demanderons des explications plus tard pour comprendre vos choix). On veut juste du postgressql.

Voici nos critères : 

Nous avons ouvert un restaurant qui fait de la cuisine française.
In fine, nous ferons une application Web basée sur la structure sql demandée.

Tout le monde pourrait se connecter dessus, (**clients** et **employés**). 
Il faudrait avoir un accès limité en fonction du type d'**utilisateur**.

Voici le point de vue du **client**: 
    - Il aurait <u>accès</u> au **plan du restaurant**, aux **tables**, ainsi qu'aux **réservations**.
    - Il pourrait <u>réserver</u> une **table** (nous avons 12 tables de 2, 4 de 4 et 2 de 6 : ces nombres peuvent évoluer au fil des années)
    - Une fois la **réservation** acceptée, le **client** pourra <u>commander</u> à l'avance ses **boissons** ( une liste sera définie) ainsi que les **plats** (menu ou à la carte avec une liste définie)
    - Le point fort de notre restaurant est que le **client** aura 3 choix de **dressage** par **plat** ( une image sera montrée sur chaque **plat**)
    - Une fois le repas terminé, le **client** pourra <u>payer</u>, laisser un avis directement à table à l'aide d'une tablette présente sur la table, et une notification sera envoyée aux **employés** avec un voyant, indiquant que le **client** est en règle

Voici le point de vue de l'employé :
    - L'**employé** peut aussi <u>être</u> **client**
    - L'**employé** reçoit en direct les **commandes** en cours, avec les **horaires** en fonctions des **réservations** (cela permet d'être réactif)
    - Avec la fiche **client**, l'**employé** <u>sait</u> à qui il parle, <u>sait</u> comment le contacter pour des offres de fidélité et <u>connait</u> son adresse(facultatif) afin de lui envoyer des cadeaux si c'est un très bon **client**).

Voici l'idée générale. Elle n'est pas à 100% abouti, nous comptons sur vous pour jouer avec votre imagination.

L'idéal serait d'avoir plusieurs fichiers séparés pour bien distinguer les différents éléments et surtout un exécutable (ou .bat) pour pouvoir créer la totalité de la structure en 2 clicks.




