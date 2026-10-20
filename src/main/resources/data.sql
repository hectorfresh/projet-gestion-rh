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

INSERT INTO poste(nom,role_id) VALUES
('comptable',1),
('programmeur junior',1),
('directeur',5);

INSERT INTO contrat(salaire,poste_id) VALUES
(1000000,3);

INSERT INTO  employe(contrat_id) VALUES
(1);


