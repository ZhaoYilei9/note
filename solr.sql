CREATE DATABASE solr;
USE solr;
CREATE TABLE person(
	id VARCHAR(10),
	p_name VARCHAR(25) not NULL,
	p_age INT not null,
	PRIMARY KEY (id)


)CHARACTER SET = utf8;


insert INTO person(id,p_name,p_age)
VALUES ("1001","a",12),("1002","b",13),("1003","c",32);