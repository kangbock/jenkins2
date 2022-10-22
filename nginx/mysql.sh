#! /bin/bash
# mysql
sudo yum install -y mysql
mysql -uroot -pIt1 -h172.17.0.4 << FOE
  create database project;
  use project;
  create table member (
	  id int AUTO_INCREMENT NOT NULL primary key,
	  email varchar(30) NOT NULL,
	  full_name varchar(20) NOT NULL,
	  password varchar(20) NOT NULL,
	  phone_number varchar(20) DEFAULT NULL,
	  department_name varchar(20) NOT NULL
  	);

  create table board (
  	board_id int AUTO_INCREMENT NOT NULL primary key,
  	member_id int(10) NOT NULL,
  	title varchar(20) NOT NULL,
  	content varchar(200) NOT NULL,
  	time DATETIME DEFAULT now(),
  	FOREIGN KEY (member_id) REFERENCES member(id)
  	);

  grant all privileges on project.* to 'root'@'%' IDENTIFIED BY 'It1';
  grant all privileges on project.* to 'root'@'10.0.0.145' IDENTIFIED BY 'It1';
  grant all privileges on project.* to 'root'@'13.124.98.20' IDENTIFIED BY 'It1';
  grant all privileges on project.* to 'root'@'172.17.0.1' IDENTIFIED BY 'It1';
  grant all privileges on project.* to 'root'@'172.17.0.2' IDENTIFIED BY 'It1';
  grant all privileges on project.* to 'root'@'172.17.0.3' IDENTIFIED BY 'It1';
  grant all privileges on project.* to 'root'@'172.17.0.4' IDENTIFIED BY 'It1';
  flush privileges;

  SHOW GRANTS FOR CURRENT_USER;

  ALTER TABLE member convert to charset utf8;
  ALTER TABLE board convert to charset utf8;

  ALTER TABLE board AUTO_INCREMENT=1;
  SET @COUNT = 0;
  UPDATE board SET board_id = @COUNT:=@COUNT+1;

  SELECT * FROM board, member WHERE member.id = board.member_id;
FOE
