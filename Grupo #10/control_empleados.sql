/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     23/05/2016 22:17:41                          */
/*==============================================================*/


alter table COLXZONAXUBICA_GEO
   drop constraint FK_COLXZONA_REFERENCE_ZONAXUBI;

alter table COLXZONAXUBICA_GEO
   drop constraint FK_COLXZONA_REFERENCE_COLONIA;

alter table DEPARTAMENTO
   drop constraint FK_DEPARTAM_REFERENCE_MUNICIPI;

alter table DETALLE_MOVIMIENTO
   drop constraint FK_DETALLE__REFERENCE_TIPO_MOV;

alter table DETALLE_MOVIMIENTO
   drop constraint FK_DETALLE__REFERENCE_EMPLEADO;

alter table DIRECCION
   drop constraint FK_DIRECCIO_REFERENCE_COLXZONA;

alter table DIRECCIONXPERSONA
   drop constraint FK_DIRECCIO_REFERENCE_EMPLEADO;

alter table DIRECCIONXPERSONA
   drop constraint FK_DIRECCIO_REFERENCE_DIRECCIO;

alter table DOCTOSXPERSONA
   drop constraint FK_DOCTOSXP_REFERENCE_EMPLEADO;

alter table DOCTOSXPERSONA
   drop constraint FK_DOCTOSXP_REFERENCE_TIPO_DOC;

alter table MUNICIPIO
   drop constraint FK_MUNICIPI_REFERENCE_PAIS;

alter table PERSONAXTELEFONO
   drop constraint FK_PERSONAX_REFERENCE_EMPLEADO;

alter table PERSONAXTELEFONO
   drop constraint FK_PERSONAX_REFERENCE_TELEFONO;

alter table PLAZA_ADMINISTRATIVA
   drop constraint FK_PLAZA_AD_REFERENCE_AREA;

alter table PLAZA_ADMINISTRATIVA
   drop constraint FK_PLAZA_AD_REFERENCE_PLAZA;

alter table PUESTOXEMPLEADO
   drop constraint FK_PUESTOXE_REFERENCE_EMPLEADO;

alter table PUESTOXEMPLEADO
   drop constraint FK_PUESTOXE_REFERENCE_PLAZA_AD;

alter table SEDE
   drop constraint FK_SEDE_REFERENCE_EMPRESA;

alter table SEDEXPUESTOXEMPLEADO
   drop constraint FK_SEDEXPUE_REFERENCE_SEDE;

alter table SEDEXPUESTOXEMPLEADO
   drop constraint FK_SEDEXPUE_REFERENCE_PUESTOXE;

alter table TURNOXEMPLEADO
   drop constraint FK_TURNOXEM_REFERENCE_SEDEXPUE;

alter table TURNOXEMPLEADO
   drop constraint FK_TURNOXEM_REFERENCE_TURNO;

alter table UBICACION_GEOGRAFICA
   drop constraint FK_UBICACIO_REFERENCE_PAIS;

alter table UBICACION_GEOGRAFICA
   drop constraint FK_UBICACIO_REFERENCE_MUNICIPI;

alter table UBICACION_GEOGRAFICA
   drop constraint FK_UBICACIO_REFERENCE_DEPARTAM;

alter table ZONAXUBICA_GEO
   drop constraint FK_ZONAXUBI_REFERENCE_UBICACIO;

drop table AREA cascade constraints;

drop table COLONIA cascade constraints;

drop table COLXZONAXUBICA_GEO cascade constraints;

drop table DEPARTAMENTO cascade constraints;

drop table DETALLE_MOVIMIENTO cascade constraints;

drop table DIRECCION cascade constraints;

drop table DIRECCIONXPERSONA cascade constraints;

drop table DOCTOSXPERSONA cascade constraints;

drop table EMPLEADO cascade constraints;

drop table EMPRESA cascade constraints;

drop table MUNICIPIO cascade constraints;

drop table PAIS cascade constraints;

drop table PERSONAXTELEFONO cascade constraints;

drop table PLAZA cascade constraints;

drop table PLAZA_ADMINISTRATIVA cascade constraints;

drop table PUESTOXEMPLEADO cascade constraints;

drop table SEDE cascade constraints;

drop table SEDEXPUESTOXEMPLEADO cascade constraints;

drop table TELEFONO cascade constraints;

drop table TIPO_DOCUMENTO cascade constraints;

drop table TIPO_MOVIMIENTO cascade constraints;

drop table TURNO cascade constraints;

drop table TURNOXEMPLEADO cascade constraints;

drop table UBICACION_GEOGRAFICA cascade constraints;

drop table ZONAXUBICA_GEO cascade constraints;

/*==============================================================*/
/* Table: AREA                                                  */
/*==============================================================*/
create table AREA 
(
   ID_AREA              NUMBER(6)            not null,
   DESCRIPCION_AREA     VARCHAR2(40)         not null,
   constraint PK_AREA primary key (ID_AREA)
);

/*==============================================================*/
/* Table: COLONIA                                               */
/*==============================================================*/
create table COLONIA 
(
   ID_COLONIA           NUMBER(6)            not null,
   DESCRIPCION_COLONIA  VARCHAR2(40)         not null,
   constraint PK_COLONIA primary key (ID_COLONIA)
);

/*==============================================================*/
/* Table: COLXZONAXUBICA_GEO                                    */
/*==============================================================*/
create table COLXZONAXUBICA_GEO 
(
   ID_COLXZONAXUBICA_GEO NUMBER(6)            not null,
   ID_ZONAXUBICA_GEO    NUMBER(6),
   ID_COLONIA           NUMBER(6),
   constraint PK_COLXZONAXUBICA_GEO primary key (ID_COLXZONAXUBICA_GEO)
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO 
(
   ID_DEPARTAMENTO      NUMBER(6)            not null,
   ID_MUNICIPIO         NUMBER(6),
   DESCRIPCION_DEPARTAMENTO VARCHAR2(40)         not null,
   constraint PK_DEPARTAMENTO primary key (ID_DEPARTAMENTO)
);

/*==============================================================*/
/* Table: DETALLE_MOVIMIENTO                                    */
/*==============================================================*/
create table DETALLE_MOVIMIENTO 
(
   ID_DETALLE_MOVIMIENTO NUMBER(9)            not null,
   ID_TIPO_MOVIMIENTO   NUMBER(6),
   ID_EMPLEADO          NUMBER(6),
   FECHA_INICIO_MOVIMIENTO DATE                 not null,
   FECHA_FIN_MOVIMIENTO DATE                 not null,
   ID_PLAZA_NUEVA       NUMBER(6)            not null,
   ID_PLAZA_ANTERIOR    NUMBER(6)            not null,
   SUELDO_BASE          NUMBER(9,2)          not null,
   SUELDO_BONIFICACION  NUMBER(9,2)          not null,
   SUELDO_COMISION      NUMBER(9,2)          not null,
   USUARIO_CREACION     VARCHAR2(40)         not null,
   FECHA_CREACION       DATE                 not null,
   constraint PK_DETALLE_MOVIMIENTO primary key (ID_DETALLE_MOVIMIENTO)
);

/*==============================================================*/
/* Table: DIRECCION                                             */
/*==============================================================*/
create table DIRECCION 
(
   ID_DIRECCION         NUMBER(6)            not null,
   ID_COLXZONAXUBICA_GEO NUMBER(6),
   CALLE                VARCHAR2(40),
   AVENIDA              VARCHAR2(40),
   REFERENCIA           VARCHAR2(50)         not null,
   constraint PK_DIRECCION primary key (ID_DIRECCION)
);

/*==============================================================*/
/* Table: DIRECCIONXPERSONA                                     */
/*==============================================================*/
create table DIRECCIONXPERSONA 
(
   ID_DIRECCIONXPERSONA NUMBER(6)            not null,
   ID_EMPLEADO          NUMBER(6),
   ID_DIRECCION         NUMBER(6),
   constraint PK_DIRECCIONXPERSONA primary key (ID_DIRECCIONXPERSONA)
);

/*==============================================================*/
/* Table: DOCTOSXPERSONA                                        */
/*==============================================================*/
create table DOCTOSXPERSONA 
(
   ID_DOCTOSXPERSONA    NUMBER(6)            not null,
   ID_EMPLEADO          NUMBER(6),
   ID_TIPODOCUMENTO     NUMBER(6),
   NUMERO_DOCUMENTO     VARCHAR2(30)         not null,
   constraint PK_DOCTOSXPERSONA primary key (ID_DOCTOSXPERSONA)
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO 
(
   ID_EMPLEADO          NUMBER(6)            not null,
   PRIMER_NOM_EMPLEADO  VARCHAR2(40)         not null,
   SEGUNDO_NOM_EMPLEADO VARCHAR2(40),
   PRIMER_APE_EMPLEADO  VARCHAR2(40)         not null,
   SEGUNDO_APE_EMPLEADO VARCHAR2(40),
   APE_CASADA_EMPLEADO  VARCHAR2(40),
   ESTADO_EMPLEADO      VARCHAR2(1)          not null,
   FECHANAC_EMPLEADO    DATE                 not null,
   ESTADOCIVIL_EMPLEADO VARCHAR2(1)          not null,
   GENERO_EMPLEADO      VARCHAR2(1)          not null,
   constraint PK_EMPLEADO primary key (ID_EMPLEADO)
);

/*==============================================================*/
/* Table: EMPRESA                                               */
/*==============================================================*/
create table EMPRESA 
(
   ID_EMPRESA           NUMBER(6)            not null,
   NOMBRE_EMPRESA       VARCHAR2(50)         not null,
   constraint PK_EMPRESA primary key (ID_EMPRESA)
);

/*==============================================================*/
/* Table: MUNICIPIO                                             */
/*==============================================================*/
create table MUNICIPIO 
(
   ID_MUNICIPIO         NUMBER(6)            not null,
   ID_PAIS              NUMBER(6),
   DESCRIPCION_MUNICIPIO VARCHAR2(40)         not null,
   constraint PK_MUNICIPIO primary key (ID_MUNICIPIO)
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS 
(
   ID_PAIS              NUMBER(6)            not null,
   DESCRIPCION_PAIS     VARCHAR2(40)         not null,
   constraint PK_PAIS primary key (ID_PAIS)
);

/*==============================================================*/
/* Table: PERSONAXTELEFONO                                      */
/*==============================================================*/
create table PERSONAXTELEFONO 
(
   ID_PERSONAXTELEFONO  NUMBER(6)            not null,
   ID_EMPLEADO          NUMBER(6),
   ID_TELEFONO          NUMBER(6),
   NUMERO_TELEFONICO    VARCHAR2(12)         not null,
   constraint PK_PERSONAXTELEFONO primary key (ID_PERSONAXTELEFONO)
);

/*==============================================================*/
/* Table: PLAZA                                                 */
/*==============================================================*/
create table PLAZA 
(
   ID_PLAZA             NUMBER(6)            not null,
   DESCRIPCION_PLAZA    VARCHAR2(40)         not null,
   constraint PK_PLAZA primary key (ID_PLAZA)
);

/*==============================================================*/
/* Table: PLAZA_ADMINISTRATIVA                                  */
/*==============================================================*/
create table PLAZA_ADMINISTRATIVA 
(
   ID_PLAZA_ADMINISTRATIVA NUMBER(5)            not null,
   ID_AREA              NUMBER(6),
   ID_PLAZA             NUMBER(6),
   constraint PK_PLAZA_ADMINISTRATIVA primary key (ID_PLAZA_ADMINISTRATIVA)
);

/*==============================================================*/
/* Table: PUESTOXEMPLEADO                                       */
/*==============================================================*/
create table PUESTOXEMPLEADO 
(
   ID_PUESTOXEMPLEADO   NUMBER(6)            not null,
   ID_EMPLEADO          NUMBER(6),
   ID_PLAZA_ADMINISTRATIVA NUMBER(5),
   constraint PK_PUESTOXEMPLEADO primary key (ID_PUESTOXEMPLEADO)
);

/*==============================================================*/
/* Table: SEDE                                                  */
/*==============================================================*/
create table SEDE 
(
   ID_SEDE              NUMBER(6)            not null,
   ID_EMPRESA           NUMBER(6),
   NOMBRE_SEDE          VARCHAR2(50)         not null,
   constraint PK_SEDE primary key (ID_SEDE)
);

/*==============================================================*/
/* Table: SEDEXPUESTOXEMPLEADO                                  */
/*==============================================================*/
create table SEDEXPUESTOXEMPLEADO 
(
   ID_SEDEXPUESTOXEMPLEADO NUMBER(6)            not null,
   ID_SEDE              NUMBER(6),
   ID_PUESTOXEMPLEADO   NUMBER(6),
   constraint PK_SEDEXPUESTOXEMPLEADO primary key (ID_SEDEXPUESTOXEMPLEADO)
);

/*==============================================================*/
/* Table: TELEFONO                                              */
/*==============================================================*/
create table TELEFONO 
(
   ID_TELEFONO          NUMBER(6)            not null,
   DESCRIPCION_TELEFONO VARCHAR2(12)         not null,
   constraint PK_TELEFONO primary key (ID_TELEFONO)
);

/*==============================================================*/
/* Table: TIPO_DOCUMENTO                                        */
/*==============================================================*/
create table TIPO_DOCUMENTO 
(
   ID_TIPODOCUMENTO     NUMBER(6)            not null,
   TIPO_DOCUMENTO       VARCHAR2(40)         not null,
   constraint PK_TIPO_DOCUMENTO primary key (ID_TIPODOCUMENTO)
);

/*==============================================================*/
/* Table: TIPO_MOVIMIENTO                                       */
/*==============================================================*/
create table TIPO_MOVIMIENTO 
(
   ID_TIPO_MOVIMIENTO   NUMBER(6)            not null,
   DESCRIPCION_MOVIMIENTO VARCHAR2(40)         not null,
   constraint PK_TIPO_MOVIMIENTO primary key (ID_TIPO_MOVIMIENTO)
);

/*==============================================================*/
/* Table: TURNO                                                 */
/*==============================================================*/
create table TURNO 
(
   ID_TURNO             NUMBER(6)            not null,
   DESCRIPCION_TURNO    VARCHAR2(40)         not null,
   constraint PK_TURNO primary key (ID_TURNO)
);

/*==============================================================*/
/* Table: TURNOXEMPLEADO                                        */
/*==============================================================*/
create table TURNOXEMPLEADO 
(
   ID_TURNOXEMPLEADO    NUMBER(6)            not null,
   ID_SEDEXPUESTOXEMPLEADO NUMBER(6),
   ID_TURNO             NUMBER(6),
   HORA_INICIO_TURNO    DATE,
   HORA_FIN_TURNO       DATE,
   FECHA_INICIO_TURNO   DATE,
   FECHA_FIN_TURNO      DATE,
   CREADOPOR            VARCHAR2(40)         not null,
   FECHACREACION        DATE                 not null,
   constraint PK_TURNOXEMPLEADO primary key (ID_TURNOXEMPLEADO)
);

/*==============================================================*/
/* Table: UBICACION_GEOGRAFICA                                  */
/*==============================================================*/
create table UBICACION_GEOGRAFICA 
(
   ID_UBICACION_GEOGRAFICA NUMBER(6)            not null,
   ID_PAIS              NUMBER(6),
   ID_MUNICIPIO         NUMBER(6),
   ID_DEPARTAMENTO      NUMBER(6),
   constraint PK_UBICACION_GEOGRAFICA primary key (ID_UBICACION_GEOGRAFICA)
);

/*==============================================================*/
/* Table: ZONAXUBICA_GEO                                        */
/*==============================================================*/
create table ZONAXUBICA_GEO 
(
   ID_ZONAXUBICA_GEO    NUMBER(6)            not null,
   ID_UBICACION_GEOGRAFICA NUMBER(6),
   ZONA                 NUMBER(6)            not null,
   constraint PK_ZONAXUBICA_GEO primary key (ID_ZONAXUBICA_GEO)
);

alter table COLXZONAXUBICA_GEO
   add constraint FK_COLXZONA_REFERENCE_ZONAXUBI foreign key (ID_ZONAXUBICA_GEO)
      references ZONAXUBICA_GEO (ID_ZONAXUBICA_GEO);

alter table COLXZONAXUBICA_GEO
   add constraint FK_COLXZONA_REFERENCE_COLONIA foreign key (ID_COLONIA)
      references COLONIA (ID_COLONIA);

alter table DEPARTAMENTO
   add constraint FK_DEPARTAM_REFERENCE_MUNICIPI foreign key (ID_MUNICIPIO)
      references MUNICIPIO (ID_MUNICIPIO);

alter table DETALLE_MOVIMIENTO
   add constraint FK_DETALLE__REFERENCE_TIPO_MOV foreign key (ID_TIPO_MOVIMIENTO)
      references TIPO_MOVIMIENTO (ID_TIPO_MOVIMIENTO);

alter table DETALLE_MOVIMIENTO
   add constraint FK_DETALLE__REFERENCE_EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO);

alter table DIRECCION
   add constraint FK_DIRECCIO_REFERENCE_COLXZONA foreign key (ID_COLXZONAXUBICA_GEO)
      references COLXZONAXUBICA_GEO (ID_COLXZONAXUBICA_GEO);

alter table DIRECCIONXPERSONA
   add constraint FK_DIRECCIO_REFERENCE_EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO);

alter table DIRECCIONXPERSONA
   add constraint FK_DIRECCIO_REFERENCE_DIRECCIO foreign key (ID_DIRECCION)
      references DIRECCION (ID_DIRECCION);

alter table DOCTOSXPERSONA
   add constraint FK_DOCTOSXP_REFERENCE_EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO);

alter table DOCTOSXPERSONA
   add constraint FK_DOCTOSXP_REFERENCE_TIPO_DOC foreign key (ID_TIPODOCUMENTO)
      references TIPO_DOCUMENTO (ID_TIPODOCUMENTO);

alter table MUNICIPIO
   add constraint FK_MUNICIPI_REFERENCE_PAIS foreign key (ID_PAIS)
      references PAIS (ID_PAIS);

alter table PERSONAXTELEFONO
   add constraint FK_PERSONAX_REFERENCE_EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO);

alter table PERSONAXTELEFONO
   add constraint FK_PERSONAX_REFERENCE_TELEFONO foreign key (ID_TELEFONO)
      references TELEFONO (ID_TELEFONO);

alter table PLAZA_ADMINISTRATIVA
   add constraint FK_PLAZA_AD_REFERENCE_AREA foreign key (ID_AREA)
      references AREA (ID_AREA);

alter table PLAZA_ADMINISTRATIVA
   add constraint FK_PLAZA_AD_REFERENCE_PLAZA foreign key (ID_PLAZA)
      references PLAZA (ID_PLAZA);

alter table PUESTOXEMPLEADO
   add constraint FK_PUESTOXE_REFERENCE_EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO);

alter table PUESTOXEMPLEADO
   add constraint FK_PUESTOXE_REFERENCE_PLAZA_AD foreign key (ID_PLAZA_ADMINISTRATIVA)
      references PLAZA_ADMINISTRATIVA (ID_PLAZA_ADMINISTRATIVA);

alter table SEDE
   add constraint FK_SEDE_REFERENCE_EMPRESA foreign key (ID_EMPRESA)
      references EMPRESA (ID_EMPRESA);

alter table SEDEXPUESTOXEMPLEADO
   add constraint FK_SEDEXPUE_REFERENCE_SEDE foreign key (ID_SEDE)
      references SEDE (ID_SEDE);

alter table SEDEXPUESTOXEMPLEADO
   add constraint FK_SEDEXPUE_REFERENCE_PUESTOXE foreign key (ID_PUESTOXEMPLEADO)
      references PUESTOXEMPLEADO (ID_PUESTOXEMPLEADO);

alter table TURNOXEMPLEADO
   add constraint FK_TURNOXEM_REFERENCE_SEDEXPUE foreign key (ID_SEDEXPUESTOXEMPLEADO)
      references SEDEXPUESTOXEMPLEADO (ID_SEDEXPUESTOXEMPLEADO);

alter table TURNOXEMPLEADO
   add constraint FK_TURNOXEM_REFERENCE_TURNO foreign key (ID_TURNO)
      references TURNO (ID_TURNO);

alter table UBICACION_GEOGRAFICA
   add constraint FK_UBICACIO_REFERENCE_PAIS foreign key (ID_PAIS)
      references PAIS (ID_PAIS);

alter table UBICACION_GEOGRAFICA
   add constraint FK_UBICACIO_REFERENCE_MUNICIPI foreign key (ID_MUNICIPIO)
      references MUNICIPIO (ID_MUNICIPIO);

alter table UBICACION_GEOGRAFICA
   add constraint FK_UBICACIO_REFERENCE_DEPARTAM foreign key (ID_DEPARTAMENTO)
      references DEPARTAMENTO (ID_DEPARTAMENTO);

alter table ZONAXUBICA_GEO
   add constraint FK_ZONAXUBI_REFERENCE_UBICACIO foreign key (ID_UBICACION_GEOGRAFICA)
      references UBICACION_GEOGRAFICA (ID_UBICACION_GEOGRAFICA);

