\c postgres
DROP DATABASE IF EXISTS rh WITH (FORCE);
CREATE DATABASE rh;
\c rh

INSERT INTO role(nom) VALUES
('no role'),
('manager'),
('r_h'),
('finance'),
('direction');

INSERT INTO departement(nom) VALUES
('DSI'),
('Finance'),
('Marketing'),
('Direction');

INSERT INTO poste(nom,role_id,departement_id) VALUES
('comptable',1,2),
('programmeur junior',1,1),
('directeur',5,4);

INSERT INTO contrat(salaire,poste_id) VALUES
(1000000,3);

INSERT INTO  employe(contrat_id) VALUES
(1);

INSERT INTO statut_besoin(nom) VALUES
('accepter'),
('refuser');


