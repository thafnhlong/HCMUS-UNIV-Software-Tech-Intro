CREATE TABLE Users (
  ID           int(10) NOT NULL AUTO_INCREMENT, 
  userName     varchar(255), 
  password     varchar(255), 
  email        varchar(255), 
  DOB          time(7), 
  gender       tinyint(3), 
  avatar       varchar(255), 
  permision    int(10) NOT NULL, 
  `delete`     tinyint(3), 
  createDate   time(7), 
  modifileDate time(7), 
  status       int(10), 
  activeToken  varchar(255), 
  refreshToken varchar(255), 
  PRIMARY KEY (ID)) ENGINE=InnoDB;
CREATE TABLE Songs (
  ID          int(10) NOT NULL AUTO_INCREMENT, 
  Name        varchar(255), 
  Lyric       int(10), 
  Singer      varchar(255), 
  composer    varchar(255), 
  author      int(10) NOT NULL, 
  views       int(10), 
  likes       int(10), 
  category    int(10) NOT NULL, 
  status      int(10), 
  reason      varchar(255), 
  createDate  time(7), 
  publishDate time(7), 
  `delete`    tinyint(3), 
  PRIMARY KEY (ID)) ENGINE=InnoDB;
CREATE TABLE Categories (
  ID           int(10) NOT NULL AUTO_INCREMENT, 
  Name         varchar(255), 
  `delete`     tinyint(3), 
  createDate   time(7), 
  modifileDate time(7), 
  PRIMARY KEY (ID)) ENGINE=InnoDB;
CREATE TABLE Permision (
  ID           int(10) NOT NULL AUTO_INCREMENT, 
  Name         varchar(255), 
  Description  varchar(255), 
  createDate   time(7), 
  modifileDate time(7) NOT NULL, 
  `delete`     tinyint(3), 
  PRIMARY KEY (ID)) ENGINE=InnoDB;
CREATE TABLE Users_Comments (
  ID           int(10) NOT NULL AUTO_INCREMENT, 
  content      varchar(255), 
  `User`       int(10) NOT NULL, 
  Song         int(10) NOT NULL, 
  `delete`     tinyint(3), 
  createDate   time(7), 
  modifileDate time(7), 
  PRIMARY KEY (ID)) ENGINE=InnoDB;
CREATE TABLE Users_Favorite_Songs (
  ID           int(10) NOT NULL AUTO_INCREMENT, 
  `User`       int(10) NOT NULL, 
  Song         int(10) NOT NULL, 
  `delete`     tinyint(3), 
  createDate   int(10), 
  modifileDate int(10), 
  PRIMARY KEY (ID)) ENGINE=InnoDB;
CREATE TABLE Users_like_Songs (
  ID     int(10) NOT NULL AUTO_INCREMENT, 
  `User` int(10) NOT NULL, 
  Song   int(10) NOT NULL, 
  PRIMARY KEY (ID)) ENGINE=InnoDB;
CREATE TABLE Song_category (
  ID       int(10) NOT NULL AUTO_INCREMENT, 
  Song     int(10) NOT NULL, 
  category int(10) NOT NULL, 
  `delete` tinyint(3), 
  PRIMARY KEY (ID)) ENGINE=InnoDB;
ALTER TABLE Songs ADD CONSTRAINT author FOREIGN KEY (author) REFERENCES Users (ID);
ALTER TABLE Users ADD CONSTRAINT permision FOREIGN KEY (permision) REFERENCES Permision (ID);
ALTER TABLE Users_Comments ADD CONSTRAINT FKUsers_Comm215024 FOREIGN KEY (`User`) REFERENCES Users (ID);
ALTER TABLE Users_Comments ADD CONSTRAINT FKUsers_Comm193966 FOREIGN KEY (Song) REFERENCES Songs (ID);
ALTER TABLE Users_Favorite_Songs ADD CONSTRAINT FKUsers_Favo456767 FOREIGN KEY (`User`) REFERENCES Users (ID);
ALTER TABLE Users_Favorite_Songs ADD CONSTRAINT FKUsers_Favo477825 FOREIGN KEY (Song) REFERENCES Songs (ID);
ALTER TABLE Users_like_Songs ADD CONSTRAINT FKUsers_like408315 FOREIGN KEY (`User`) REFERENCES Users (ID);
ALTER TABLE Users_like_Songs ADD CONSTRAINT FKUsers_like387257 FOREIGN KEY (Song) REFERENCES Songs (ID);
ALTER TABLE Song_category ADD CONSTRAINT FKSong_categ986104 FOREIGN KEY (category) REFERENCES Categories (ID);
ALTER TABLE Song_category ADD CONSTRAINT FKSong_categ859474 FOREIGN KEY (Song) REFERENCES Songs (ID);
