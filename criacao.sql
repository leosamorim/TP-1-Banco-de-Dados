CREATE TABLE ESTADO (
    uf_id VARCHAR(2) PRIMARY KEY,
    state_name VARCHAR(50) NOT NULL
);

CREATE TABLE VACCINE (
    vaccine_id SERIAL PRIMARY KEY,
    vaccine_name VARCHAR(100) NOT NULL
);

CREATE TABLE PARTY (
    party_id SERIAL PRIMARY KEY,
    party_name VARCHAR(20) NOT NULL
);

CREATE TABLE GOVERNOR (
    gov_id SERIAL PRIMARY KEY,
    gov_name VARCHAR(100) NOT NULL,
    uf_id VARCHAR(2) REFERENCES ESTADO(uf_id),
    party_id INT REFERENCES PARTY(party_id),
    year INT REFERENCES YEAR(year)
);

CREATE TABLE COVERAGE (
    coverage_id SERIAL PRIMARY KEY,
    coverage_value NUMERIC(12, 6),
    uf_id VARCHAR(2) REFERENCES ESTADO(uf_id),
    vaccine_id INT REFERENCES VACCINE(vaccine_id),
    year INT REFERENCES YEAR(year)
);

CREATE TABLE PRESIDENT (
    president_year_id SERIAL PRIMARY KEY,
    president_name VARCHAR(50) NOT NULL,
    party_id INT REFERENCES PARTY(party_id),
    year INT REFERENCES YEAR(year)
);