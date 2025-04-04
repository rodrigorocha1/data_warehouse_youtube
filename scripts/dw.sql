
CREATE TABLE DIM_CANAIS(
    ID_CANAL VARCHAR(40) NOT NULL PRIMARY KEY,
    NM_CANAL VARCHAR(80) NOT NULL,
    DATA_INSERCAO DATETIME DEFAULT GETDATE()

)



CREATE TABLE DIM_VIDEO(
    ID_VIDEO VARCHAR(40) NOT NULL PRIMARY KEY,
    NM_VIDEO VARCHAR(80) NOT NULL,
    DATA_INSERCAO DATETIME DEFAULT GETDATE()

)

CREATE TABLE ASSUNTO(
    ID_ASSUNTO INT,
    NOME_ASSUNTO VARCHAR(80),
    DATA_INSERCAO DATETIME DEFAULT GETDATE()
)

DROP TABLE FT_ESTATISTICA_VIDEO;


ALTER TABLE FT_ESTATISTICA_VIDEO
DROP CONSTRAINT FK_ESTATISTICA_CANAL;

ALTER TABLE FT_ESTATISTICA_VIDEO
DROP CONSTRAINT FK_ESTATISTICA_VIDEO;

CREATE TABLE FT_ESTATISTICA_VIDEO(
    ID_ASSUNTO INT,
    ID_CANAL VARCHAR(40) NOT NULL,
    ID_VIDEO VARCHAR(40) NOT NULL,
    TOTAL_VISUALIZACOES INT NOT NULL,
    TOTAL_LIKES INT NOT NULL,
    TOTAL_FAVORITOS INT NOT NULL,
    TOTAL_COMENTARIOS INT NOT NULL,
    CONSTRAINT FK_ESTATISTICA_CANAL FOREIGN KEY (ID_CANAL) REFERENCES DIM_CANAIS(ID_CANAL),
    CONSTRAINT FK_ESTATISTICA_VIDEO FOREIGN KEY (ID_VIDEO) REFERENCES DIM_VIDEO(ID_VIDEO)
)

ALTER TABLE FT_ESTATISTICA_VIDEO
ADD DATA_INSERCAO  DATETIME DEFAULT GETDATE();

ALTER TABLE FT_ESTATISTICA_VIDEO
ADD DATA_ATUALIZACAO  DATETIME DEFAULT GETDATE();



ALTER TABLE ASSUNTO
ALTER COLUMN ID_ASSUNTO INT  NOT NULL;


ALTER TABLE ASSUNTO
ADD CONSTRAINT PK_ID_ASSUNTO PRIMARY KEY (ID_ASSUNTO);


ALTER TABLE FT_ESTATISTICA_VIDEO
ADD CONSTRAINT FK_ESTATISTICAS_ASSUNTO FOREIGN KEY (ID_ASSUNTO)
REFERENCES ASSUNTO(ID_ASSUNTO);

SELECT *
FROM FT_ESTATISTICA_VIDEO;


CREATE TABLE LOG_INFO_DAG(


);