CREATE TABLE "usr"
(
  "usrId" integer NOT NULL,
  "login" character(50) NOT NULL,
  "password" character(50),
  "email" character(50),
  CONSTRAINT "PrimaryKey" PRIMARY KEY ("usrId")
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "usr" OWNER TO postgres;
GRANT ALL ON TABLE "usr" TO postgres;
GRANT ALL ON TABLE "usr" TO test;