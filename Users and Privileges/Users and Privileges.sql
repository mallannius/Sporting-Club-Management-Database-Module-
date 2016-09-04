-- Users and Privileges --

-- Creating User1 --

create user programmer identified by 'mypass';

-- Granting Privilege to User1--

grant select on * to programmer;

-- --------------------------------------------------------


-- Creating User2 --
 
create user admin identified by 'passwod';

-- Granting Privilege to User2--

grant all privileges on `riverside club`.* to 'admin'@'%' with grant option;
