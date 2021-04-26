CREATE DATABASE pet_adoptionDB;

 CREATE TABLE `LOCATION`(
    `id` int NOT NULL,
    `name` varchar(100) NOT NULL,
    `addr1` varchar(100) NOT NULL,
    `addr2` varchar(100),
    `city` varchar(35) NOT NULL,
    `state` CHAR(2) NOT NULL,
    `zip` varchar(20) NOT NULL,
    `phone` varchar(20) NOT NULL,
    `email` varchar(100) NOT NULL
    )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

 -- INSERTING THE LOCATION/FACILITY DATA

    INSERT INTO `LOCATION`(`id`,`name`,`addr1`,`addr2`,`city`,`state`,`zip`,`phone`,`email`) VALUES
    ('11','One Of A Kind Pets','1929 W. Market St.',NULL,'Akron','OH','44313','(330) 865-6200','volunteer@oneofakindpets.com'), 
    ('12','Akron Pet Adoption','2100 Front St.',NULL,'Akron','OH','44313','(330) 456-2345','akronpetadoption@gmail.com'), 
    ('13','Animals in Need','1738 German St.',NULL,'Cleveland','OH','44101','(216) 939-6421','ClevelandPets@gmail.com');

    CREATE TABLE `TYPE`(
        `id` int NOT NULL,
        `description` varchar(25)
    )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

    -- INSERTING TYPE DATA

    INSERT INTO `TYPE` (`id`,`description`) VALUES
    ('1','dog'),
    ('2','cat');

    CREATE TABLE `BREED`(
        `id` int NOT NULL,
        `name` varchar(100),
        `type_id` int NOT NULL
    )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

    -- INSERTING BREED DATA

    INSERT INTO `BREED`(`id`,`name`,`type_id`) VALUES
    ('101', 'Domestic Short Hair', '2'),
    ('102', 'Domestic Long Hair', '2'),
    ('201', 'Golden Retriever', '1'),
    ('202', 'Terrier', '1'),
    ('203', 'Black Mouth Cur','1'),
    ('204', 'Mixed', '1'),
    ('205', 'Beagle','1'),
    ('206', 'Labrador Retriever','1'),
    ('207', 'Collie','1');


    CREATE TABLE `PET`(
        `id` int NOT NULL,
        `name` varchar(25) NOT NULL,
        `type_id` int(11) NOT NULL,
        `breed_id` int(11) NOT NULL,
        `age` varchar(11),
        `description` varchar(500),
        `weight` varchar(10) NOT NULL,
        `size` char(1) NOT NULL,
        `sex` BOOLEAN NOT NULL,
        `active` boolean NOT NULL,
        `acquisitiondate` DATE NOT NULL,
        `sp_neu` BOOLEAN,
        `Location_id` int(11) NOT NULL
    )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

    -- INSERTING PET DATA

    INSERT INTO `PET`(`id`,`name`,`type_id`,`breed_id`,`age`,`description`,`weight`,`size`,`sex`,`active`,`acquisitiondate`,`sp_neu`,`Location_id`) VALUES
    ('101', 'Tucker', '1', '201', 'Adult', 'Tucker was brought to us by a partner rescue that pulled him from a pound in the Southern Ohio/Kentucky area. He is about two years old, and full of energy! Tucker is a friendly boy, but has not quite learned how to control himself. He does not seem to be very friendly with other dogs, but loves people!', '54 lbs', 'L','1','1','2020-06-19','1','11'),
    ('102', 'Reed', '1', '202', 'Adult','Reed is a fun wiggle-butt who is about four years old, but seems so much younger!  He has a puppy energy about him that is so endearing.  We brought Reed to our rescue from our local animal control facility.  He is such a handsome boy who will need someone who enjoys puppy energy, or is willing to train him out of it.','71 lbs','L','1','1','2021-01-14','1','13'),
    ('103', 'Molly', '1', '203', 'Adult', 'Molly is a delightful girl who came to us with her best friend Bear.  She is the quiet, more subdued of the two.  Both of these fur babies were surrendered to a pound in the southern OH/KY area and transported to us by a partner rescue to find their forever homes.','43 lbs','M','0','1','2021-02-10','1','12'),
    ('104', 'Lazlo', '1', '205', 'Adult', 'Lazlo is a great boy!  He is all business while he is outside, as his nose can not seem to go fast enough for him!  Lazlo was most likely someones hunting dog at one point, as he is ready to go when leashed up and outside!','23 lbs','S','1','1','2021-01-01','1','11'),
    ('105', 'Kelvin', '1', '205' , 'Adult', 'Kelvin is your typical Beagle boy!  He is seven years old and was most likely someones hunting buddy.  He came to us from a partner rescue in West Virginia after he found himself in their high-intake shelter.','17 lbs','S','1','1','2021-02-14','1','13'),
    ('106', 'Keilo', '1', '206', 'Adult', 'Keilo came to us recently as an owner surrender because his person was no longer able to care for him.  He is a quiet boy who is still trying to figure things out.', '58 lbs','L','1','1','2020-11-08','1','11'),
    ('107', 'Gloria','1', '204', 'Adult', 'Gloria is truly a special girl.  We picked her up from the Crawford Co. Humane Society with wounds on her front legs, and absolutely no meat on her bones at all. Through it all, Gloria has remained the sweetest, most docile little love ever.','42 lbs','L','0','1','2020-08-12','1','12'),
    ('108', 'Bear', '1', '206', 'Adult', 'Bears photo is a perfect example of his personality!  He is a great big, loveable, slobbery teddy bear!  He and his best friend Molly were both surrendered to a pound in the southern Ohio/KY area.','101 lbs','L','1','1','2020-09-01','1','11'),
    ('109', 'Freckles', '1', '207', 'Senior', 'Freckles is a special boy.  He is an older gentleman who moves slow but still enjoys his strolls along the sidewalk.  Freckles has been with us for quite some time because we cant seem to cure his chronic cough.', '30 lbs','S','1','1','2019-12-25','0','13'),
    ('110', 'Lila', '1', '202','Young', 'Lila is a great girl who was, unfortunately, with the wrong family early in her life.  She was adopted by a family in the West Virginia area as a puppy.  She was in a home with kids and cats and got along just fine.  However, Lila developed cherry eye.', '45 lbs','M','0','1','2021-03-06','1','11'),
    ('201', 'Waldo','2','101','Adult','Waldo was an owner surrender to us, and he is responding to life at the rescue much like his buddy Derek. They are both a bit scared and unsure, but both boys are very sweet and relieved to find a friendly face and soft touch.', '14 lbs','L','1','1','2021-01-4','1','12'),
    ('202', 'Sweetheart','2','101','Adult','Sweetheart is a gem of a kitty who is only about a year old.  She came to us from a high-intake shelter in West Virginia, and we are shocked that she was there.  Sweetheart lives up to her name, as she is very laid back and friendly.','8 lbs','M','0','1','2021-01-01','1','11'),
    ('203', 'Snoop','2','101', 'Adult', 'When Snoop first came to us in February he was very frightened.  As a result, he lashed out at those who tried to give him attention.  Now that he knows we can be trusted and we just want to love him, he is a very sweet boy.','11 lbs','L','1','1','2021-02-13','1','13'),
    ('204', 'Poppet','2','101', 'Adult', 'Poppet is a lovely lady who is so polite.  She is content to rest peacefully until she has a visitor.  At that time, she will rise to greet her new visitors and show them proper attention.', '5.4 lbs','S','0','1','2021-01-08','1','13'),
    ('205', 'Nadya','2','101','Adult', 'When Nadya came to us in January. she was very clearly expecting kittens.  Because of difficulties, our vets performed a C-section to deliver her babies.  She is all healed, the babies have found homes, and now it is Nadyas turn.','7 lbs','M','0','1','2021-01-14','1','12'),
    ('206', 'Moxie','2','101','Adult', 'Moxie is a wonderfully calm kitty who is ready to be spoiled in a home.  She was a recent mom who is done with that life and ready for the next.  Moxie is only about 7-8 years old and was found as a stray in Akron.', '7 lbs','M','0','1','2020-10-04','1','11'),
    ('207', 'Moscato','2','102', 'Adult', 'Moscato is a unique kitty who came to us as an owner surrender.  She is a stunning girl who is super friendly as well.  She is estimated to be between 3-5 years old.','8 lbs','M','0','1','2020-12-27','1','11'),
    ('208', 'Mckenzie','2','101','Adult', 'McKenzie was found as a stray in Wooster.  When she first arrived with us, she was not open to any interactions.  She was scared and defensive.  However, McKenzie is beginning to relax and let down her guard.','7 lbs','M','0','1','2021-02-24','1','13'),
    ('209', 'Derek','2','101', 'Adult','Unfortunately, Dereks owner could no longer care for him, and now he is here with us. He is a sweet boy who is a bit nervous about life at the rescue. He is still a little scared and trying to stay hidden, but when you find this boy, he is so relieved and welcoming of a friendly face and lots of affection!','18 lbs','L','1','1','2021-01-02','1','13'),
    ('210', 'Milo','2','101','Adult', 'Milo & Patches are bonded brothers who came to us from a pound in WV.  They are both SO INCREDIBLY AFFECTIONATE!  They will be the first to greet you in their little cat room, and they will tap you on the shoulder, rub against your legs, and give you the most adorable faces.', '6 lbs', 'S', '1','1','2021-02-13','1','11');

    CREATE TABLE `CONTACT`(
        `id` int(11) NOT NULL,
        `firstname` varchar(25) NOT NULL, 
        `lastname` varchar(25) NOT NULL,
        `phone_no` varchar(20),
        `email` varchar(100) NOT NULL UNIQUE,
        `addr1` varchar(100),
        `addr2` varchar(100),
        `city` varchar(35),
        `state` char(2),
        `zip` varchar(20),
        `password` varchar(100) NOT NULL
    )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

    CREATE TABLE `ADOPTION`(
        `id` int(11) NOT NULL,
        `adopt_date` DATE,
        `adopt_fee` varchar(8) NOT NULL,
        `contact_id` int(11) NOT NULL,
        `pet_id` int(11) NOT NULL
    )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

    CREATE TABLE `PICTURES`(
        `id` int(11) NOT NULL,
        `imagepath` varchar(30),
        `caption` varchar(20),
        `pet_id` int(11) NOT NULL
    )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

    -- INSERTING PICTURES DATA

    INSERT INTO `PICTURES`(`id`,`imagepath`,`caption`,`pet_id`) VALUES
    ('1','dog_2.jpg','Tucker','101'),
    ('2','dog_3.jpg','Reed','102'),
    ('3','dog_4.jpg','Molly','103'),
    ('4','dog_5.jpg','Lazlo','104'),
    ('5','dog_6.jpg','Kelvin','105'),
    ('6','dog_7.jpg','Keilo','106'),
    ('7','dog_8.jpg','Gloria','107'),
    ('8','dog_9.jpg','Bear','108'),
    ('9','dog_10.jpg','Freckles','109'),
    ('10','dog_11.jpg','Lila','110'),
    ('11','cat_1.jpg','waldo','201'),
    ('12','cat_2.jpg','sweetheart','202'),
    ('13','cat_3.jpg','snoop','203'),
    ('14','cat_4.jpg','Poppet','204'),
    ('15','cat_5.jpg','Nadya','205'),
    ('16','cat_6.jpg','Moxie','206'),
    ('17','cat_7.jpg','Moscato','207'),
    ('18','cat_8.jpg','Mckenzie','208'),
    ('19','cat_9.jpg','Derek','209'),
    ('20','cat_10.jpg','Milo','210');

    -- ALTERING TABLES WITH KEYS AND PRIMARY KEYS

    ALTER TABLE `LOCATION`
        ADD PRIMARY KEY(`id`);

    ALTER TABLE `TYPE`
        ADD PRIMARY KEY (`id`);

    ALTER TABLE `BREED`
        ADD PRIMARY KEY (`id`),
        ADD KEY (`type_id`);

    ALTER TABLE `PET`
        ADD PRIMARY KEY (`id`),
        ADD KEY (`type_id`),
        ADD KEY (`breed_id`),
        ADD KEY (`Location_id`);

    ALTER TABLE `CONTACT`
        ADD PRIMARY KEY (`id`);

    ALTER TABLE `ADOPTION`
        ADD PRIMARY KEY (`id`),
        ADD KEY (`contact_id`),
        ADD KEY (`pet_id`);

    ALTER TABLE `PICTURES`
        ADD PRIMARY KEY (`id`),
        ADD KEY (`pet_id`);
    
    -- AUTO INCREMENT
    ALTER TABLE `LOCATION`
        MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

    ALTER TABLE `TYPE`
        MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

    ALTER TABLE `BREED`
        MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

    ALTER TABLE `PET`
        MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

    ALTER TABLE `CONTACT`
        MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

    ALTER TABLE `ADOPTION`
        MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

    ALTER TABLE `PICTURES`
        MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

    -- ALTERING KEYS TO MAKE FOREIGN KEYS

    ALTER TABLE `BREED`
        ADD CONSTRAINT `breed_fk_1` FOREIGN KEY (`type_id`) REFERENCES `TYPE` (`id`);

    ALTER TABLE `PET`
        ADD CONSTRAINT `pet_fk_1` FOREIGN KEY (`type_id`) REFERENCES `TYPE` (`id`),
        ADD CONSTRAINT `pet_fk_2` FOREIGN KEY (`breed_id`) REFERENCES `BREED` (`id`),
        ADD CONSTRAINT `pet_fk_3` FOREIGN KEY (`Location_id`) REFERENCES `LOCATION` (`id`);

    ALTER TABLE `ADOPTION`
        ADD CONSTRAINT `adoption_fk_1` FOREIGN KEY (`contact_id`) REFERENCES `CONTACT` (`id`),
        ADD CONSTRAINT `adoption_fk_2` FOREIGN KEY (`pet_id`) REFERENCES `PET` (`id`);

    ALTER TABLE `PICTURES`
        ADD CONSTRAINT `picture_fk_1` FOREIGN KEY (`pet_id`) REFERENCES `PET` (`id`);
