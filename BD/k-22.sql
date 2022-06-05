create database k;
use k;

create table JogoDoAno(
	idJogo INT PRIMARY KEY AUTO_INCREMENT,
	nomeJogo VARCHAR(45)
	)auto_increment = 1001;
    
create table Multiplayer(
	idJogo INT PRIMARY KEY AUTO_INCREMENT,
	nomeJogo VARCHAR(45)
	)auto_increment = 2001;
    
create table Audio(
	idJogo INT PRIMARY KEY AUTO_INCREMENT,
	nomeJogo VARCHAR(45)
	)auto_increment = 3001;
    
create table AcaoAventura(
	idJogo INT PRIMARY KEY AUTO_INCREMENT,
	nomeJogo VARCHAR(45)
	)auto_increment = 4001;
    
create table Indie(
	idJogo INT PRIMARY KEY AUTO_INCREMENT,
	nomeJogo VARCHAR(45)
	)auto_increment = 5001;

insert into JogoDoAno values (null, 'FFXIV'),
							 (null, 'It Takes Two'),
							 (null, 'Metroid Dread'),
							 (null, 'Cyberpunk 2077'),
							 (null, 'Resident Evil Village');
                             

insert into Multiplayer values (null, 'Back 4 blood'),
							   (null, 'Knockout City'),
							   (null, 'New World'),
							   (null, 'Valheim'),
							   (null, 'FFXIV');
                               
insert into Audio values (null, 'Deathloop'),
						 (null, 'Forza Horizon 5'),
						 (null, 'Nier Replicant'),
						 (null, 'Guardians of the Galaxy'),
						 (null, 'Ratchet & Clank');
                         
insert into AcaoAventura values (null, 'Guardians of the Galaxy'),
							   (null, 'FarCry 6'),
							   (null, 'Metroid Dread'),
							   (null, 'Back 4 blood'),
							   (null, 'Resident evil village');
                             
insert into Indie values (null, '12 minutes'),
						 (null, 'Deaths Door'),
						 (null, 'Inscryption'),
						 (null, 'Kena: Bridge of spirits'),
						 (null, 'Loop Hero');
CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    email VARCHAR(50),
    senha VARCHAR(50),
    nomeU VARCHAR(50) unique,
    fkJogoDoAno int,
	FOREIGN KEY (fkJogoDoAno) REFERENCES JogoDoAno(idJogo),
	fkMultiplayer int,
	FOREIGN KEY (fkMultiplayer) REFERENCES Multiplayer(idJogo),
    fkAudio int,
	FOREIGN KEY (fkAudio) REFERENCES Audio(idJogo),
    fkAcaoAventura int,
	FOREIGN KEY (fkAcaoAventura) REFERENCES AcaoAventura(idJogo),
    fkIndie int,
	FOREIGN KEY (fkIndie) REFERENCES Indie(idJogo)
);
insert into usuario values (null, 'pedro1','pedro1@gmail.com','123','pedro1',1001,2001,3001,4001,5001),
 							 (null, 'pedro2','pedro2@gmail.com','123','pedro2',1002,2002,3002,4002,5002),
                              (null, 'pedro3','pedro3@gmail.com','123','pedro3',1003,2003,3003,4003,5003),
                              (null, 'pedro4','pedro4@gmail.com','123','pedro4',1004,2004,3004,4004,5004),
                             (null, 'pedro5','pedro5@gmail.com','123','pedro5',1005,2005,3005,4005,5005),
                             (null, 'pedro5','pedro5@gmail.com','123','pedro5',1005,2005,3005,4005,5005),
						   (null, 'pedro6','pedro6@gmail.com','123','pedro6',1001,2003,3002,4003,5001),
						   (null, 'pedro7','pedro7@gmail.com','123','pedro7',1005,2002,3002,4005,5004),
						   (null, 'pedro8','pedro8@gmail.com','123','pedro8',1003,2002,3002,4003,5004),
						   (null, 'pedro9','pedro9@gmail.com','123','pedro9',1002,2002,3004,4004,5002),
						   (null, 'pedro10','pedro10@gmail.com','123','pedro10',1005,2005,3005,4004,5003),
						   (null, 'pedro11','pedro11@gmail.com','123','pedro11',1001,2004,3004,4004,5003),
						   (null, 'pedro12','pedro12@gmail.com','123','pedro12',1002,2002,3003,4002,5002),
						   (null, 'pedro13','pedro13@gmail.com','123','pedro13',1001,2005,3005,4005,5001),
						   (null, 'pedro14','pedro14@gmail.com','123','pedro14',1005,2002,3003,4001,5005),
						   (null, 'pedro15','pedro15@gmail.com','123','pedro15',1001,2001,3005,4001,5005),
						   (null, 'pedro16','pedro16@gmail.com','123','pedro16',1001,2002,3005,4003,5004),
						   (null, 'pedro17','pedro17@gmail.com','123','pedro17',1001,2003,3002,4001,5002),
						   (null, 'pedro18','pedro18@gmail.com','123','pedro18',1005,2003,3004,4002,5005),
						   (null, 'pedro19','pedro19@gmail.com','123','pedro19',1001,2002,3004,4005,5001),
						   (null, 'pedro20','pedro20@gmail.com','123','pedro20',1003,2005,3002,4005,5002),
						   (null, 'pedro21','pedro21@gmail.com','123','pedro21',1001,2002,3005,4002,5001),
						   (null, 'pedro22','pedro22@gmail.com','123','pedro22',1004,2005,3004,4005,5003),
						   (null, 'pedro23','pedro23@gmail.com','123','pedro23',1003,2003,3005,4003,5005);
                             
                             
select JogoDoAno.nomeJogo, count(usuario.id) as 'Quantidade de Votos' from Usuario join JogoDoAno on fkJogoDoAno = idJogo group by JogoDoAno.nomeJogo;
select Multiplayer.nomeJogo, count(usuario.id) as 'Quantidade de Votos' from Usuario join Multiplayer on fkMultiplayer = idJogo group by Multiplayer.nomeJogo;
select Audio.nomeJogo, count(usuario.id) as 'Quantidade de Votos' from Usuario join Audio on fkAudio = idJogo group by Audio.nomeJogo;
select AcaoAventura.nomeJogo, count(usuario.id) as 'Quantidade de Votos' from Usuario join AcaoAventura on fkAcaoAventura = idJogo group by AcaoAventura.nomeJogo;
select Indie.nomeJogo, count(usuario.id) as 'Quantidade de Votos' from Usuario join Indie on fkIndie = idJogo group by Indie.nomeJogo;
 
-- update usuario set fkJogoDoAno = 1001, fkMultiplayer = 2001, fkAudio = 3001, fkAcaoAventura = 4001, fkIndie = 5001 where id = 2;
select * from usuario;
select * from JogoDoAno;
select * from Multiplayer;
select * from Audio;
select * from AcaoAventura;
select * from Indie;
-- drop database k;


