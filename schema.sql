CREATE TABLE application_status (
    person_id bigint NOT NULL,
    status character varying,
    application_status_id bigint NOT NULL
);

CREATE SEQUENCE application_status_application_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE application_status_application_status_id_seq OWNED BY application_status.application_status_id;

CREATE SEQUENCE application_status_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE application_status_person_id_seq OWNED BY application_status.person_id;

CREATE TABLE availability (
    availability_id integer NOT NULL,
    person_id integer,
    from_date date,
    to_date date
);

ALTER TABLE availability ALTER COLUMN availability_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME availability_availability_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE competence (
    competence_id integer NOT NULL,
    i18n_key character varying(255)
);

ALTER TABLE competence ALTER COLUMN competence_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME competence_competence_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE competence_profile (
    competence_profile_id integer NOT NULL,
    person_id integer,
    competence_id integer,
    years_of_experience numeric(4,2)
);

ALTER TABLE competence_profile ALTER COLUMN competence_profile_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME competence_profile_competence_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE person (
    person_id bigint NOT NULL,
    name character varying(255),
    surname character varying(255),
    pnr character varying(255),
    email character varying(255),
    password character varying(255),
    role_id integer,
    username character varying(255)
);

ALTER TABLE person ALTER COLUMN person_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME person_person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE role (
    role_id integer NOT NULL,
    name character varying(255)
);

ALTER TABLE role ALTER COLUMN role_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME role_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

ALTER TABLE ONLY application_status ALTER COLUMN person_id SET DEFAULT nextval('application_status_person_id_seq'::regclass);

ALTER TABLE ONLY application_status ALTER COLUMN application_status_id SET DEFAULT nextval('application_status_application_status_id_seq'::regclass);

INSERT INTO competence OVERRIDING SYSTEM VALUE VALUES (1, 'ticket-sales');
INSERT INTO competence OVERRIDING SYSTEM VALUE VALUES (2, 'lotteries');
INSERT INTO competence OVERRIDING SYSTEM VALUE VALUES (3, 'roller-coaster-operations');

INSERT INTO role OVERRIDING SYSTEM VALUE VALUES (1, 'recruiter');
INSERT INTO role OVERRIDING SYSTEM VALUE VALUES (2, 'applicant');

ALTER TABLE ONLY application_status
    ADD CONSTRAINT application_status_pkey PRIMARY KEY (person_id);

ALTER TABLE ONLY availability
    ADD CONSTRAINT availability_pkey PRIMARY KEY (availability_id);

ALTER TABLE ONLY competence
    ADD CONSTRAINT competence_pkey PRIMARY KEY (competence_id);

ALTER TABLE ONLY competence_profile
    ADD CONSTRAINT competence_profile_pkey PRIMARY KEY (competence_profile_id);

ALTER TABLE ONLY person
    ADD CONSTRAINT person_pkey PRIMARY KEY (person_id);

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);

ALTER TABLE ONLY availability
    ADD CONSTRAINT availability_person_id_fkey FOREIGN KEY (person_id) REFERENCES person(person_id);

ALTER TABLE ONLY competence_profile
    ADD CONSTRAINT competence_profile_competence_id_fkey FOREIGN KEY (competence_id) REFERENCES competence(competence_id);

ALTER TABLE ONLY competence_profile
    ADD CONSTRAINT competence_profile_person_id_fkey FOREIGN KEY (person_id) REFERENCES person(person_id);

ALTER TABLE ONLY application_status
    ADD CONSTRAINT fk6i25i1kwi5btbwjd4cmh5rfy1 FOREIGN KEY (person_id) REFERENCES person(person_id);

ALTER TABLE ONLY person
    ADD CONSTRAINT person_role_id_fkey FOREIGN KEY (role_id) REFERENCES role(role_id);

-- Completed on 2024-02-27 15:58:17 CET
