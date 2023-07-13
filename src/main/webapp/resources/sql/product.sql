use jspproject_db;

CREATE TABLE IF NOT EXISTS product(
	p_id VARCHAR(10) NOT NULL,
	p_name VARCHAR(100),
	p_unitPrice INTEGER,
	p_description TEXT,
	p_duration LONG,
	p_continent VARCHAR(20),
	p_travelPlace VARCHAR(30),
	p_unitsInStock LONG,
	p_category VARCHAR(20),
	p_fileName VARCHAR(30),
	PRIMARY KEY (p_id)
)default CHARSET=utf8;

