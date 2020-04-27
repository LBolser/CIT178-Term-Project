/*
USE myBookshelf;
GO
INSERT INTO series VALUES ('1','Mute','1')
INSERT INTO series VALUES ('2','Xanth','46')
INSERT INTO series VALUES ('3','The Sword of Truth','15')
INSERT INTO series VALUES ('4','The Obsidian Universe','8')
INSERT INTO series VALUES ('5','Firekeeper','9')
INSERT INTO series VALUES ('6','Callahan''s','8')
INSERT INTO series VALUES ('7','Discworld','41')

INSERT INTO zipcode VALUES ('10019','New York','NY','USA')
INSERT INTO zipcode VALUES ('10007','New York','NY','USA')
INSERT INTO zipcode VALUES ('10271','New York','NY','USA')
INSERT INTO zipcode VALUES ('EC4Y 0DZ','London','','United Kingdom')
INSERT INTO zipcode VALUES ('98108','Seattle','WA','USA')
INSERT INTO zipcode VALUES ('49684','Traverse City','MI','USA')
INSERT INTO zipcode VALUES ('08831','Monroe Township','NJ','USA')
INSERT INTO zipcode VALUES ('98011','Auburn','WA','USA') 

--ALTER TABLE publishers ADD PublishersPhone varchar(30);

INSERT INTO publishers VALUES ('123','The Hearst Corporation','300 West 57th Street','10019','(212)649-4115','https://www.hearst.com/magazines/hearst-books')
INSERT INTO publishers VALUES ('124','Avon Books','195 Broadway','10007','(212) 207-7000','https://www.harpercollins.com/avonromance/')
INSERT INTO publishers VALUES ('125','Tor Fantasy','120 Broadway, 22rd Floor','10271','(123) 456-0001','https://www.torforgeblog.com/faq/')
INSERT INTO publishers VALUES ('126','Ace Books','1745 Broadway','10019','(234)567-0002','http://www.penguin.com/publishers/berkley/')
INSERT INTO publishers VALUES ('127','Victor Gollancz','50 Victoria Embankment','EC4Y 0DZ','+44 20 3122 6000','https://www.gollancz.co.uk/') */

--ALTER TABLE distributors ADD DistributionMethod varchar(30);
--ALTER TABLE distributors DROP COLUMN DistributorsWebsite;
--ALTER TABLE distributors ADD DistributorsWebsite varchar(100); 

--ALTER TABLE distributors ADD DistributorsAddress Varchar(50); 
--ALTER TABLE distributors DROP COLUMN DistributorsPhone;
--ALTER TABLE distributors DROP COLUMN DistributionMethod;
--ALTER TABLE distributors DROP COLUMN DistributorsWebsite;
--ALTER TABLE distributors ADD DistributorsPhone varchar(30);
--ALTER TABLE distributors ADD DistributionMethod varchar(30);
--ALTER TABLE distributors ADD DistributionWebsite varchar(100);


--INSERT INTO distributors VALUES ('910','Amazon','98108','PO Box 81226','(888) 280-3321','Online','https://www.amazon.com/books-used-books-textbooks/b?ie=UTF8&node=283155')
--INSERT INTO distributors VALUES ('911','BAM','49684','2612 Crossing Cir',' (231) 935-0194','In Store','https://www.booksamillion.com/')
--INSERT INTO distributors VALUES ('912','BAM','49684','2612 Crossing Cir',' (231) 935-0194','Online','https://www.booksamillion.com/')
--INSERT INTO distributors VALUES ('913','Barnes & Noble','08831','1 Barnes & Noble Way','1-800-843-2665','Online','https://www.barnesandnoble.com/')
--INSERT INTO distributors VALUES ('914','Horizon Books','49684','243 E Front St','(231) 946-7290','In Store','https://www.horizonbooks.com/')
--INSERT INTO distributors VALUES ('915','Thriftbooks.com','98011','123 Main','1-888-979-1408','Online','https://www.thriftbooks.com/')

/*
INSERT INTO authors VALUES ('panthony1','Piers','Anthony','123 Xanth Rd','98108','123-456-7890')
INSERT INTO authors VALUES ('tgoodkind1','Terry','Goodkind','521 Mord Sith Lane','49684','234-567-8910')
INSERT INTO authors VALUES ('mlackey1','Mercedes','Lackey','652 Kellen Drive','49684','345-678-9012')
INSERT INTO authors VALUES ('jlindskold1','Jane','Lindskold','254 Firekeeper St','49684','456-789-0123')
INSERT INTO authors VALUES ('srobinson1','Spider','Robinson','359 Callahan Ave','98108','567-890-1234')
INSERT INTO authors VALUES ('tpratchet1','Terry','Pratchet','1 Omnia Hwy','98108','678-901-2345')


INSERT INTO books VALUES ('1401033474','Mute','123','4/1/1981','Science Fiction','1','1')
INSERT INTO books VALUES ('0380759470','Isle of View','124','10/1/1990','Fantasy','2','13')
INSERT INTO books VALUES ('0765305224','Naked Empire','125','10/1/1990','Fantasy','3','8')
INSERT INTO books VALUES ('0765341425','To Light a Candle','125','10/1/2004','Fantasy','4','2')
INSERT INTO books VALUES ('0812575482','Through Wolf''s Eyes','125','8/1/2001','Fantasy','5','1')
INSERT INTO books VALUES ('0441812775','Time Travelers Strictly Cash','126','12/1/1981','Science Fiction','6','2')
INSERT INTO books VALUES ('0060177500','Small Gods','127','10/1/1992','Fantasy','7','13') 

INSERT INTO bookauthors VALUES ('1401033474','panthony1')
INSERT INTO bookauthors VALUES ('0380759470','panthony1')
INSERT INTO bookauthors VALUES ('0765305224','tgoodkind1')
INSERT INTO bookauthors VALUES ('0765341425','mlackey1')
INSERT INTO bookauthors VALUES ('0812575482','jlindskold1')
INSERT INTO bookauthors VALUES ('0441812775','srobinson1')
INSERT INTO bookauthors VALUES ('0060177500','tpratchet1') */
