/* CADA GRUPO DEBE DE SUBIR EL DIAGRAMA DE LA BASE DE DATOS CON SU SCRIPT */

CREATE USER HOSPITAL IDENTIFIED BY HOSPITAL;
GRANT CREATE SESSION TO HOSPITAL;
GRANT CREATE TABLE TO HOSPITAL;
GRANT CREATE VIEW TO HOSPITAL;
GRANT CREATE PROCEDURE TO HOSPITAL;

ALTER USER HOSPITAL quota unlimited on SYSTEM;

/* -------------------------------------
   TABLAS GENERALES
----------------------------------------*/

CREATE TABLE HOSPITAL.HPTL_PERSONAS(
        ID INTEGER NOT NULL,
        PRIMER_NOMBRE VARCHAR2(60) NOT NULL,
        SEGUNDO_NOMBRE VARCHAR2(60),
        TERCER_NOMBRE VARCHAR2(60),
        PRIMER_APELLIDO VARCHAR2(60) NOT NULL,
        SEGUNDO_APELLIDO VARCHAR2(60),
        APELLIDO_CASADA VARCHAR2(60),
        FECHA_NACIMIENTO DATE,
        SEXO CHAR(1),
        CONSTRAINT HPTL_PERSONAS_PK PRIMARY KEY (ID)
);


CREATE TABLE HOSPITAL.HPTL_TELEFONOS(
        ID INTEGER NOT NULL,
        DESCRIPCION VARCHAR2(60),
        TELEFONO INTEGER,
        CONSTRAINT HPTL_TELEFONOS_PK PRIMARY KEY(ID)
);


CREATE TABLE HOSPITAL.HPTL_PERSONAS_TELEFONOS(
        ID INTEGER NOT NULL,
        PERSONAS_ID INTEGER NOT NULL,
        TELEFONOS_ID INTEGER NOT NULL,
        CONSTRAINT HPTL_PERSONAS_TELEFONOS_PK PRIMARY KEY (ID),
        CONSTRAINT HPTL_PER_PK_HPTL_PER_TEL_FK FOREIGN KEY(PERSONAS_ID) REFERENCES HOSPITAL.HPTL_PERSONAS(ID),
        CONSTRAINT HPTL_TEL_PK_HPTL_PER_TEL_FK FOREIGN KEY(TELEFONOS_ID) REFERENCES HOSPITAL.HPTL_TELEFONOS(ID)
);

CREATE TABLE HOSPITAL.HPTL_TIPO_SANGRE (
		ID INTEGER NOT NULL,
		TIPOSANGRE VARCHAR(20),
		CONSTRAINT HPTL_TIPO_SANGRE_PK PRIMARY KEY (ID)
)

CREATE TABLE HOSPITAL.HPTL_PACIENTES(
        ID INTEGER NOT NULL,
        CODIGO_PACIENTE INTEGER NOT NULL,
        FECHA_REGISTO_PACIENTE DATE,
        PERSONAS_ID INTEGER NOT NULL,
		TIPOSANGRE_ID INTEGER,
        CONSTRAINT HPTL_PACIENTES_PK PRIMARY KEY(ID),
        CONSTRAINT HPTL_PERSONA_PK_HPTL_PAC_FK FOREIGN KEY(PERSONAS_ID) REFERENCES HOSPITAL.HPTL_PERSONAS(ID),
		CONSTRAINT HPTL_TIPO_SAN_PK_HPTL_PAC_FK FOREIGN KEY (TIPOSANGRE_ID) REFERENCES HOSPITAL.HPTL_TIPO_SANGRE(ID)
);


CREATE TABLE HOSPITAL.HPTL_EMPLEADOS(
        ID INTEGER NOT NULL,
        CODIGO_EMPLEADO VARCHAR2(20),
        FECHA_INICIO_LABORES DATE,
        PERSONAS_ID INTEGER NOT NULL,
        CONSTRAINT HPTL_EMPLEADOS_PK PRIMARY KEY (ID),
        CONSTRAINT HPTL_PERSONAS_PK_HPTL_EMP_PK FOREIGN KEY(PERSONAS_ID) REFERENCES HOSPITAL.HPTL_PERSONAS(ID)
);



CREATE TABLE HOSPITAL.HPTL_DOCTORES(
        ID INTEGER NOT NULL,
        COLEGIADO VARCHAR2(20) NOT NULL,
        EMPLEADOS_ID INTEGER NOT NULL,
        CONSTRAINT HPTL_DOCTORES_PK PRIMARY KEY (ID),
        CONSTRAINT HPTL_EMPLEADOS_PK_HPTL_DOC_FK FOREIGN KEY(EMPLEADOS_ID) REFERENCES HOSPITAL.HPTL_PERSONAS(ID)
);


CREATE TABLE HOSPITAL.HPTL_ESPECIALIDADES_DOCTORES(
	ID INTEGER NOT NULL,
	CODIGO VARCHAR2(10),
	DESCRIPCION VARCHAR2(256),
	CONSTRAINT HPTL_ESPECIALIDADES_DOC_PK PRIMARY KEY (ID)
);


CREATE TABLE HOSPITAL.HPTL_DOCTORES_ESPECIALIDAD_DOC(
	ID INTEGER NOT NULL,
	DOCTORES_ID INTEGER NOT NULL,
	ESPECIALIDADES_DOCTORES INTEGER NOT NULL,
	CONSTRAINT HPTL_DOCTORES_ESP_DOC_PK PRIMARY KEY(ID),
	CONSTRAINT HPTL_DOC_PK_DOC_ESP_DOC_FK FOREIGN KEY(DOCTORES_ID) REFERENCES HOSPITAL.HPTL_DOCTORES(ID),
	CONSTRAINT HPTL_ESP_DOC_PK_HTPL_DOC_FK FOREIGN KEY(ESPECIALIDADES_DOCTORES) REFERENCES HOSPITAL.HPTL_ESPECIALIDADES_DOCTORES(ID)
);


CREATE TABLE HOSPITAL.HPTL_PUESTOS(
	ID INTEGER NOT NULL,
	CODIGO VARCHAR2(10) NOT NULL,
	DESCRIPCION VARCHAR2(256),
	CONSTRAINT HPTL_PUESTOS_PK PRIMARY KEY (ID)
);


CREATE TABLE HOSPITAL.HPTL_EMPLEADOS_PUESTOS(
	ID INTEGER NOT NULL,
	EMPLEADOS_ID INTEGER NOT NULL,
	PUESTOS_ID INTEGER NOT NULL,
	CONSTRAINT HPTL_EMPLEADOS_PUESTOS_PK PRIMARY KEY (ID),
	CONSTRAINT HPTL_PUE_PK_HPTL_EMP_PUE_FK FOREIGN KEY(PUESTOS_ID) REFERENCES HOSPITAL.HPTL_PUESTOS(ID)
);


CREATE TABLE HOSPITAL.HPTL_AREAS(
	ID INTEGER NOT NULL,
	CODIGO VARCHAR2(10),
	DESCRIPCION VARCHAR2(256),
	CONSTRAINT HPTL_AREAS_PK PRIMARY KEY(ID)
);

CREATE TABLE HOSPITAL.HPTL_PUESTOS_AREAS(
	ID INTEGER NOT NULL,
	PUESTOS_ID INTEGER NOT NULL,
	AREAS_ID INTEGER NOT NULL,
	CONSTRAINT HPTL_PUESTOS_AREAS_PK PRIMARY KEY (ID),
	CONSTRAINT HPTL_AREAS_PK_HPTL_PUE_ARE_FK FOREIGN KEY(AREAS_ID) REFERENCES HOSPITAL.HPTL_AREAS(ID),
	CONSTRAINT HPTL_PUE_PK_HPTL_PUE_ARE_FK FOREIGN KEY(PUESTOS_ID) REFERENCES HOSPITAL.HPTL_PUESTOS(ID)
);


CREATE TABLE HOSPITAL.HPTL_HORARIOS(
	ID INTEGER NOT NULL,
	HORA_INICIO DATE NOT NULL,
	HORA_FIN DATE NOT NULL,
	CONSTRAINT HPTL_HORARIOS_PK PRIMARY KEY (ID)
);
---MORE

CREATE TABLE HOSPITAL.HPTL_TIPO_ENFERMEDADES(
	ID INTEGER NOT NULL,
	CODIGO INTEGER NOT NULL,
	DESCRIPCION VARCHAR2(50),
	CONSTRAINT HTPTL_TIPO_ENFERMEDADES_PK PRIMARY KEY(ID)

);

CREATE TABLE HOSPITAL.HPTL_ENFERMEDADES(
	ID INTEGER NOT NULL,
	CODIGO VARCHAR2(20) NOT NULL,
	TIPOS_ENFERMEDADES_ID INTEGER NOT NULL,	
	DESCRIPCION VARCHAR2(50),
	CONSTRAINT HPTL_ENFERMEDADES_PK PRIMARY KEY(ID),
	CONSTRAINT HPTL_ENF_PK_HPTL_TIP_ENF_FK FOREIGN KEY(TIPOS_ENFERMEDADES_ID) REFERENCES HOSPITAL.HPTL_TIPO_ENFERMEDADES(ID)	
);


CREATE TABLE HOSPITAL.HPTL_PAISES(
	ID INTEGER NOT NULL,
	CODIGO VARCHAR2(15) NOT NULL,
	DESCRIPCION VARCHAR2(30),
	CONSTRAINT HPTL_PAISES_PK PRIMARY KEY(ID)
);

CREATE TABLE HOSPITAL.HPTL_DEPARTAMENTOS(
	ID INTEGER NOT NULL,
	CODIGO VARCHAR2(15) NOT NULL,
	DESCRIPCION VARCHAR2(50),
	PAIS_ID INTEGER NOT NULL,
	CONSTRAINT HPTL_DEPARTAMENTOS_PK PRIMARY KEY(ID),
	CONSTRAINT HTPTL_PAISES_FK_DEP FOREIGN KEY(PAIS_ID) REFERENCES HOSPITAL.HPTL_PAISES(ID)
);

CREATE TABLE HOSPITAL.HPTL_MUNICIPIOS(
	ID INTEGER NOT NULL,
	CODIGO VARCHAR2(15) NOT NULL,
	DESCRIPCION VARCHAR2(50),
	DEPARTAMENTO_ID INTEGER NOT NULL,
	CONSTRAINT HPTL_MUNICIPIOS_PK PRIMARY KEY(ID),
	CONSTRAINT HPTL_DEPARTAMENTOS_FK_MUN FOREIGN KEY(DEPARTAMENTO_ID) REFERENCES HOSPITAL.HPTL_DEPARTAMENTOS(ID)
);

CREATE TABLE HOSPITAL.HPTL_DIRECCIONES(
	ID INTEGER NOT NULL,
	NUMERO_CASA VARCHAR2(10),
	COLONIA VARCHAR2(50),
	CALLE_AVENIDA VARCHAR2(50),
	MUNICIPIO_ID INTEGER NOT NULL,
	CONSTRAINT HPTL_DIRECCIONES_PK PRIMARY KEY(ID),
	CONSTRAINT HTPL_MUN_FK_DIRECCIONES FOREIGN KEY(MUNICIPIO_ID) REFERENCES HOSPITAL.HPTL_MUNICIPIOS(ID)
); 

CREATE TABLE HOSPITAL.HPTL_CLINICAS(
	ID INTEGER NOT NULL,
	CODIGO VARCHAR2(30) NOT NULL,
	DESCRIPCION VARCHAR2(50),
	DIRECCIONES_ID INTEGER NOT NULL,
	CONSTRAINT HPTL_CLINICAS_PK PRIMARY KEY(ID),
	CONSTRAINT HPTL_DIR_PK_HPTL_CLI_FK FOREIGN KEY(DIRECCIONES_ID) REFERENCES HOSPITAL.HPTL_DIRECCIONES(ID)
);


CREATE TABLE HOSPITAL.HPTL_MEDICAMENTOS(
	ID INTEGER NOT NULL,
	CODIGO VARCHAR2(30) NOT NULL,
	DESCRIPCION VARCHAR2(30),
	CONSTRAINT HPTL_MEDICAMENTOS_PK PRIMARY KEY(ID)
);

CREATE TABLE HOSPITAL.HPTL_TIPOS_EXAMENES(
	ID INTEGER NOT NULL,
	DESCRIPCION VARCHAR2(50),
	CONSTRAINT HPTL_TIPOS_ENFERMEDADES_PK PRIMARY KEY(ID)
);


CREATE TABLE HOSPITAL.HPTL_EXAMENES(
	ID INTEGER NOT NULL,
	CODIGO VARCHAR2(30) NOT NULL,
	TIPOS_EXAMENES_ID INTEGER NOT NULL,
	DESCRIPCION VARCHAR2(30),
	CONSTRAINT HPTL_EXAMENES_PK PRIMARY KEY(ID),
	CONSTRAINT HPTL_EX_HPTL_TIPOS_ENF_FK FOREIGN KEY(TIPOS_EXAMENES_ID) REFERENCES HOSPITAL.HPTL_TIPOS_EXAMENES(ID)	
);


CREATE TABLE HOSPITAL.HPTL_TIPOS_EQUIPOS(
	ID INTEGER NOT NULL,
	EQUIPOS_ID INTEGER NOT NULL,
	DESCRIPCION VARCHAR2(50),
	CONSTRAINT HPTL_TIPOS_EQUIPOS_PK PRIMARY KEY(ID)
);


CREATE TABLE HOSPITAL.HPTL_EQUIPOS(
	ID INTEGER NOT NULL,
	CODIGO VARCHAR2(30) NOT NULL,
	TIPO_EQUIPOS_ID INTEGER NOT NULL,
	DESCRIPCION VARCHAR2(30),
	CONSTRAINT HPTL_EQUIPOS_PK PRIMARY KEY(ID),
	CONSTRAINT HPTL_EQ_PK_HPTL_TIP_ENF_FK FOREIGN KEY(TIPO_EQUIPOS_ID) REFERENCES HOSPITAL.HPTL_TIPOS_EQUIPOS(ID)	
);


CREATE TABLE HOSPITAL.HPTL_TIPO_DOCUMENTOS(
	ID INTEGER NOT NULL,
	CODIGO VARCHAR2(15) NOT NULL,
	DESCRIPCION VARCHAR2(30),
	CONSTRAINT HPTL_DOCUMENTO_PK PRIMARY KEY(ID)
);


CREATE TABLE HOSPITAL.HPTL_PERSONA_DOCTO(
        ID INTEGER NOT NULL,
        PERSONAS_ID INTEGER NOT NULL,
        TIPO_DOC_ID INTEGER NOT NULL,
        CONSTRAINT HPTL_PERSONAS_DOCTO_PK PRIMARY KEY (ID),
        CONSTRAINT HPTL_PER_PK_HPTL_PER_DOC_FK FOREIGN KEY(PERSONAS_ID) REFERENCES HOSPITAL.HPTL_PERSONAS(ID),
        CONSTRAINT HPTL_TIP_PK_HPTL_PER_DOC_FK FOREIGN KEY(TIPO_DOC_ID) REFERENCES HOSPITAL.HPTL_TIPO_DOCUMENTOS(ID)
);

-- CONSULTA EXTERNA GRUPO #3

CREATE TABLE HOSPITAL.HPTL_CITAS (
		ID INTEGER NOT NULL,
		PACIENTES_ID INTEGER NOT NULL,
		CLILNICAS_ID INTEGER NOT NULL,
		DOCTORES_ID INTEGER NOT NULL,
		FECHA_CITA DATE,
		HORA_CITA TIME,
		CONSTRAINT HPTL_CITAS_PK PRIMARY KEY (ID),
		CONSTRAINT HPTL_PAC_PK_HTPL_CIT_FK FOREIGN KEY (PACIENTES_ID) REFERENCES HOSPITAL.HPTL_PACIENTES(ID),
		CONSTRAINT HPTL_DOC_PK_HTPL_CIT_FK FOREIGN KEY (DOCTORES_ID) REFERENCES HOSPITAL.HPTL_DOCTORES(ID),
		CONSTRAINT HPTL_CLI_PK_HTPL_CIT_FK FOREIGN KEY (CLINICAS_ID) REFERENCES HOSPITAL.HPTL_CLINICAS(ID)
)

CREATE TABLE HOSPITAL.HPTL_HIS_MEDICA_ENCA (
		ID INTEGER NOT NULL,
		PACIENTES_ID INTEGER NOT NULL,
		CONSTRAINT HPTL_HIS_MEDICA_ENCA_PK PRIMARY KEY (ID),
		CONSTRAINT HPTL_PAC_PK_HTPL_HIS_FK FOREIGN KEY (PACIENTES_ID) REFERENCES HOSPITAL.HPTL_PACIENTES(ID)
)

CREATE TABLE HOSPITAL.HPTL_HIS_MEDICA_DETA (
		ID INTEGER NOT NULL,
		HIS_ENC_ID INTEGER,
		OBSERVACIONES VARCHAR(50),
		ENFERMEDADES_ID INTEGER,
		CITAS_ID INTEGER,
		CONSTRAINT HPTL_HIS_MEDICA_DETA_PK PRIMARY KEY (ID),
		CONSTRAINT HPTL_HIS_PK_HPTL_HIS_FK FOREIGN KEY (HIS_ENC_ID) REFERENCES HOSPITAL.HPTL_HIS_MEDICA_ENCA(ID),
		CONSTRAINT HPTL_ENF_PK_HPTL_HIS_FK FOREIGN KEY (ENFERMEDADES_ID) REFERENCES HOSPITAL.HPTL_ENFERMEDADES(ID),
		CONSTRAINT HPTL_CIT_PK_HPTL_HIS_FK FOREIGN KEY (CITAS_ID) REFERENCES HOSPITAL.HPTL_CITAS(ID)
)

CREATE TABLE HOSPITAL.HPTL_RECETAS (
		ID INTEGER NOT NULL,
		HIS_DET_ID INTEGER,
		OBSERVACIONES VARCHAR(250),
		CONSTRAINT HPTL_RECETAS_PK PRIMARY KEY (ID),
		CONSTRAINT HPTL_HIS_PK_HPTL_REC_FK FOREIGN KEY (HIS_DET_ID) REFERENCES HOSPITAL.HPTL_HIS_MEDICA_DETA(ID)
)

CREATE TABLE HOSPITAL.HPTL_HIS_EXAMENES (
		EXAMENES_ID INTEGER NOT NULL,
		HIS_DET_ID INTEGER NOT NULL,
		CONSTRAINT HPTL_HIS_EXAMENES_PK PRIMARY KEY (EXAMENES_ID,HIS_DET_ID),
		CONSTRAINT HPTL_EXA_PK_HPTL_HIS_EXA_FK FOREIGN KEY (EXAMENES_ID) REFERENCES HOSPITAL.HPTL_EXAMENES,
		CONSTRAINT HPTL_HIS_PK_HPTL_HIS_EXA_FK FOREIGN KEY (HIS_DET_ID) REFERENCES HOSPITAL.HPTL_HIS_MEDICA_DETA
);

-- SCRIPT GRUPO #9
CREATE TABLE HOSPITAL.HPTL_AREAS (
		ID INTEGER NOT NULL,
		CODIGO VARCHAR2(10) NULL,
		DESCRIPCION VARCHAR2(256) NULL,
		CONSTRAINT HPTL_AREAS_PK PRIMARY KEY ID)
);

-- SECUENCIAS PARA IDs (TABLAS GENERALES)

CREATE SEQUENCE HOSPITAL.HPTL_PERSONAS_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_TELEFONOS_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_PERSONAS_TELEFONOS_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_TIPO_SANGRE_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_PACIENTES_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_EMPLEADOS_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_DOCTORES_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_ESPECIALIDADES_DOCTORES_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_DOCTORES_ESPECIALIDAD_DOC_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_PUESTOS_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_EMPLEADOS_PUESTOS_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_AREAS_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_PUESTOS_AREAS_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_HORARIOS_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_TIPO_ENFERMEDADES_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_ENFERMEDADES_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_PAISES_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_DEPARTAMENTOS_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_MUNICIPIOS_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_DIRECCIONES_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_CLINICAS_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_MEDICAMENTOS_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_TIPOS_EXAMENES_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_EXAMENES_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_TIPOS_EQUIPOS_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_EQUIPOS_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_TIPO_DOCUMENTOS_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_PERSONA_DOCTO_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE

-- SECUENCIAS PARA IDs (TABLAS GRUPO #3)

CREATE SEQUENCE HOSPITAL.HPTL_CITAS_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_HIS_MEDICA_ENCA_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_MEDICA_DETA_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE

CREATE SEQUENCE HOSPITAL.HPTL_RECETAS_SEQ 
INCREMENT BY 1
START WITH 1
NOMAXVALUE





