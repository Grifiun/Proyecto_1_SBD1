-- SQLINES DEMO *** rated by MySQL Workbench
-- SQLINES DEMO *** 1:04:03
-- SQLINES DEMO ***    Version: 1.0
-- SQLINES DEMO *** orward Engineering

/* SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0; */
/* SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0; */
/* SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION'; */

-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC
-- SQLINES DEMO *** ------------------------------------
DROP SCHEMA IF EXISTS Aerolinea_LMC ;

-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC
-- SQLINES DEMO *** ------------------------------------
CREATE SCHEMA IF NOT EXISTS Aerolinea_LMC ;
SET SCHEMA 'Aerolinea_LMC' ;

-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Aerolinea`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Aerolinea ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Aerolinea (
  nombre_comercial_aerolinea VARCHAR(40) NOT NULL,
  nombre_aerolinea VARCHAR(45) NOT NULL,
  ubicacion VARCHAR(100) NOT NULL,
  anio_fundacion DATE NOT NULL,
  PRIMARY KEY (nombre_comercial_aerolinea))
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Aeropuerto`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Aeropuerto ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Aeropuerto (
  ubicacion_aeropuerto VARCHAR(100) NOT NULL,
  nombre_comercial_aerolinea VARCHAR(40) NOT NULL,
  PRIMARY KEY (ubicacion_aeropuerto, nombre_comercial_aerolinea)
  CREATE INDEX fk_Aeropuerto_Aerolinea_idx ON Aerolinea_LMC.Aeropuerto (nombre_comercial_aerolinea ASC) VISIBLE,
  CONSTRAINT fk_Aeropuerto_Aerolinea
    FOREIGN KEY (nombre_comercial_aerolinea)
    REFERENCES `Aerolinea_LMC`.`Aerolinea` (nombre_comercial_aerolinea)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Puerta_Defecto`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Puerta_Defecto ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Puerta_Defecto (
  id_puerta_defecto VARCHAR(45) NOT NULL,
  nombre_comercial_aerolinea VARCHAR(40) NOT NULL,
  ubicacion_aeropuerto VARCHAR(100) NOT NULL,
  numero_puerta_defecto VARCHAR(45) NOT NULL
  CREATE INDEX fk_Puerta_Defecto_Aeropuerto1_idx ON Aerolinea_LMC.Puerta_Defecto (ubicacion_aeropuerto ASC, nombre_comercial_aerolinea ASC) VISIBLE,
  PRIMARY KEY (id_puerta_defecto),
  CONSTRAINT fk_Puerta_Defecto_Aeropuerto1
    FOREIGN KEY (ubicacion_aeropuerto , nombre_comercial_aerolinea)
    REFERENCES `Aerolinea_LMC`.`Aeropuerto` (ubicacion_aeropuerto , nombre_comercial_aerolinea)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Clase`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Clase ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Clase (
  nombre_clase VARCHAR(50) NOT NULL,
  tipo_filas VARCHAR(45) NOT NULL,
  tarifas_cambios INT NOT NULL,
  maleta_documentada INT NOT NULL,
  peso_maleta_documentada DECIMAL(7,2) NOT NULL,
  maleta_mano INT NOT NULL,
  con_eleccion_asiento INT NOT NULL,
  con_cambios_permitidos INT NOT NULL,
  con_devoluciones INT NOT NULL,
  porcentaje_descuento_ida_vuelta INT NOT NULL,
  descripcion_clase VARCHAR(250) NOT NULL,
  PRIMARY KEY (nombre_clase))
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Precio_Clase`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Precio_Clase ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE Aerolinea_LMC.Precio_Clase_seq;

CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Precio_Clase (
  id_precio_clase INT NOT NULL DEFAULT NEXTVAL ('Aerolinea_LMC.Precio_Clase_seq'),
  disponibilidad_critica INT NOT NULL,
  tipo_pasajero VARCHAR(45) NOT NULL,
  precio_normal DECIMAL(9,2) NOT NULL,
   porcentaje_extra INT NOT NULL,
  nombre_clase INT NOT NULL,
  PRIMARY KEY (id_precio_clase)
  CREATE INDEX fk_Precio_Clase_Clase1_idx ON Aerolinea_LMC.Precio_Clase (nombre_clase ASC) VISIBLE,
  CONSTRAINT fk_Precio_Clase_Clase1
    FOREIGN KEY (nombre_clase)
    REFERENCES `Aerolinea_LMC`.`Clase` (nombre_clase)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Alimento`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Alimento ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE Aerolinea_LMC.Alimento_seq;

CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Alimento (
  id_alimento INT NOT NULL DEFAULT NEXTVAL ('Aerolinea_LMC.Alimento_seq'),
  nombre_alimento VARCHAR(45) NOT NULL,
  descripcion_alimento VARCHAR(400) NOT NULL,
  tipo_manu VARCHAR(45) NOT NULL,
  tipo_alimento VARCHAR(45) NOT NULL,
  costo_alimento DECIMAL(9,2) NOT NULL,
  subtipo_alimento VARCHAR(45) NULL,
  PRIMARY KEY (id_alimento))
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Ingrediente`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Ingrediente ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Ingrediente (
  nombre_ingrediente VARCHAR(50) NOT NULL,
  tipo_ingrediente VARCHAR(45) NOT NULL,
  costo_ingrediente DECIMAL(9,2) NOT NULL,
  descripcion_ingrediente VARCHAR(500) NOT NULL,
  PRIMARY KEY (nombre_ingrediente))
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Alimento_Ingrediente`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Alimento_Ingrediente ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Alimento_Ingrediente (
  id_alimento INT NOT NULL,
  nombre_ingrediente VARCHAR(50) NOT NULL,
  cantidad_usar INT NOT NULL,
  PRIMARY KEY (id_alimento, nombre_ingrediente)
  CREATE INDEX fk_Alimento_has_Ingrediente_Ingrediente1_idx ON Aerolinea_LMC.Alimento_Ingrediente (nombre_ingrediente ASC) VISIBLE,
  INDEX fk_Alimento_has_Ingrediente_Alimento1_idx (id_alimento ASC) VISIBLE,
  CONSTRAINT fk_Alimento_has_Ingrediente_Alimento1
    FOREIGN KEY (id_alimento)
    REFERENCES `Aerolinea_LMC`.`Alimento` (id_alimento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Alimento_has_Ingrediente_Ingrediente1
    FOREIGN KEY (nombre_ingrediente)
    REFERENCES `Aerolinea_LMC`.`Ingrediente` (nombre_ingrediente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Alimento_Clase`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Alimento_Clase ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Alimento_Clase (
  nombre_clase VARCHAR(50) NOT NULL,
  id_alimento INT NOT NULL,
  fecha_alimento_clase DATE NOT NULL,
  PRIMARY KEY (nombre_clase, id_alimento)
  CREATE INDEX fk_Clase_has_Alimento_Alimento1_idx ON Aerolinea_LMC.Alimento_Clase (id_alimento ASC) VISIBLE,
  INDEX fk_Clase_has_Alimento_Clase1_idx (nombre_clase ASC) VISIBLE,
  CONSTRAINT fk_Clase_has_Alimento_Clase1
    FOREIGN KEY (nombre_clase)
    REFERENCES `Aerolinea_LMC`.`Clase` (nombre_clase)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Clase_has_Alimento_Alimento1
    FOREIGN KEY (id_alimento)
    REFERENCES `Aerolinea_LMC`.`Alimento` (id_alimento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Tipo_Avion`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Tipo_Avion ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Tipo_Avion (
  tipo_avion VARCHAR(50) NOT NULL,
  descripcion_tipo_avion VARCHAR(500) NOT NULL,
  PRIMARY KEY (tipo_avion))
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Avion`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Avion ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Avion (
  id_avion VARCHAR(150) NOT NULL,
  tipo_avion VARCHAR(50) NOT NULL,
  fecha_adquisicion DATE NOT NULL,
  fecha_primer_vuelo DATE NULL,
  fecha_ultimo_mantenimiento DATE NOT NULL,
  estado VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_avion)
  CREATE INDEX fk_Avion_Tipo_Avion1_idx ON Aerolinea_LMC.Avion (tipo_avion ASC) VISIBLE,
  CONSTRAINT fk_Avion_Tipo_Avion1
    FOREIGN KEY (tipo_avion)
    REFERENCES `Aerolinea_LMC`.`Tipo_Avion` (tipo_avion)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Avion_Asientos_Totales_Por_Clase`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Avion_Asientos_Totales_Por_Clase ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Avion_Asientos_Totales_Por_Clase (
  nombre_clase VARCHAR(50) NOT NULL,
  id_avion VARCHAR(150) NOT NULL,
  cantidad_filas INT NOT NULL,
  asientos_por_fila INT NOT NULL,
  cantidad_total_asientos_por_clase INT NOT NULL,
  PRIMARY KEY (nombre_clase, id_avion)
  CREATE INDEX fk_Clase_has_Avion_Avion1_idx ON Aerolinea_LMC.Avion_Asientos_Totales_Por_Clase (id_avion ASC) VISIBLE,
  INDEX fk_Clase_has_Avion_Clase1_idx (nombre_clase ASC) VISIBLE,
  CONSTRAINT fk_Clase_has_Avion_Clase1
    FOREIGN KEY (nombre_clase)
    REFERENCES `Aerolinea_LMC`.`Clase` (nombre_clase)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Clase_has_Avion_Avion1
    FOREIGN KEY (id_avion)
    REFERENCES `Aerolinea_LMC`.`Avion` (id_avion)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Alimento_Avion`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Alimento_Avion ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Alimento_Avion (
  nombre_clase VARCHAR(50) NOT NULL,
  id_alimento INT NOT NULL,
  id_avion VARCHAR(150) NOT NULL,
  precio_alimento_avion DECIMAL(9,2) NOT NULL,
  PRIMARY KEY (nombre_clase, id_alimento, id_avion)
  CREATE INDEX fk_Alimento_Clase_has_Avion_Avion1_idx ON Aerolinea_LMC.Alimento_Avion (id_avion ASC) VISIBLE,
  INDEX fk_Alimento_Clase_has_Avion_Alimento_Clase1_idx (nombre_clase ASC, id_alimento ASC) VISIBLE,
  CONSTRAINT fk_Alimento_Clase_has_Avion_Alimento_Clase1
    FOREIGN KEY (nombre_clase , id_alimento)
    REFERENCES `Aerolinea_LMC`.`Alimento_Clase` (nombre_clase , id_alimento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Alimento_Clase_has_Avion_Avion1
    FOREIGN KEY (id_avion)
    REFERENCES `Aerolinea_LMC`.`Avion` (id_avion)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Plan_Vuelo_Salida`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Plan_Vuelo_Salida ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE Aerolinea_LMC.Plan_Vuelo_Salida_seq;

CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Plan_Vuelo_Salida (
  id_plan_salida_vuelo INT NOT NULL DEFAULT NEXTVAL ('Aerolinea_LMC.Plan_Vuelo_Salida_seq'),
  id_puerta_defecto VARCHAR(45) NOT NULL,
  hora TIME(0) NOT NULL,
  hora_abordaje TIME(0) NOT NULL,
  PRIMARY KEY (id_plan_salida_vuelo)
  CREATE INDEX fk_Plan_Vuelo_Salida_Puerta_Defecto1_idx ON Aerolinea_LMC.Plan_Vuelo_Salida (id_puerta_defecto ASC) VISIBLE,
  CONSTRAINT fk_Plan_Vuelo_Salida_Puerta_Defecto1
    FOREIGN KEY (id_puerta_defecto)
    REFERENCES `Aerolinea_LMC`.`Puerta_Defecto` (id_puerta_defecto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Plan_Vuelo_Llegada`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Plan_Vuelo_Llegada ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE Aerolinea_LMC.Plan_Vuelo_Llegada_seq;

CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Plan_Vuelo_Llegada (
  id_plan_llegada_vuelo INT NOT NULL DEFAULT NEXTVAL ('Aerolinea_LMC.Plan_Vuelo_Llegada_seq'),
  id_puerta_defecto VARCHAR(45) NOT NULL,
  hora_llegada TIME(0) NOT NULL,
  PRIMARY KEY (id_plan_llegada_vuelo)
  CREATE INDEX fk_Plan_Vuelo_Salida_Puerta_Defecto1_idx ON Aerolinea_LMC.Plan_Vuelo_Llegada (id_puerta_defecto ASC) VISIBLE,
  CONSTRAINT fk_Plan_Vuelo_Salida_Puerta_Defecto10
    FOREIGN KEY (id_puerta_defecto)
    REFERENCES `Aerolinea_LMC`.`Puerta_Defecto` (id_puerta_defecto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Plan_Vuelo`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Plan_Vuelo ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Plan_Vuelo (
  codigo_plan_vuelo INT NOT NULL,
  tipo_avion VARCHAR(45) NOT NULL,
  distancia_millas DECIMAL(9,2) NOT NULL,
  id_plan_salida_vuelo INT NOT NULL,
  id_plan_llegada_vuelo INT NOT NULL,
  hora_despegue_programada TIME(0) NOT NULL,
  hora_aterrizaje_programada TIME(0) NOT NULL,
  PRIMARY KEY (codigo_plan_vuelo)
  CREATE INDEX fk_Plan_Vuelo_Plan_Vuelo_Salida1_idx ON Aerolinea_LMC.Plan_Vuelo (id_plan_salida_vuelo ASC) VISIBLE,
  INDEX fk_Plan_Vuelo_Plan_Vuelo_Llegada1_idx (id_plan_llegada_vuelo ASC) VISIBLE,
  CONSTRAINT fk_Plan_Vuelo_Plan_Vuelo_Salida1
    FOREIGN KEY (id_plan_salida_vuelo)
    REFERENCES `Aerolinea_LMC`.`Plan_Vuelo_Salida` (id_plan_salida_vuelo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Plan_Vuelo_Plan_Vuelo_Llegada1
    FOREIGN KEY (id_plan_llegada_vuelo)
    REFERENCES `Aerolinea_LMC`.`Plan_Vuelo_Llegada` (id_plan_llegada_vuelo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Plan_Vuelo_Temporal`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Plan_Vuelo_Temporal ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Plan_Vuelo_Temporal (
  codigo_plan_vuelo INT NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NOT NULL,
  estado VARCHAR(45) NOT NULL,
  PRIMARY KEY (codigo_plan_vuelo),
  CONSTRAINT fk_Plan_Vuelo_Temporal_Plan_Vuelo1
    FOREIGN KEY (codigo_plan_vuelo)
    REFERENCES Aerolinea_LMC.Plan_Vuelo (codigo_plan_vuelo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Plan_Vuelo_Precio`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Plan_Vuelo_Precio ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Plan_Vuelo_Precio (
  id_vuelo_precio VARCHAR(45) NOT NULL,
  codigo_plan_vuelo INT NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NOT NULL,
  precio VARCHAR(45) NOT NULL,
  descripcion_precio VARCHAR(450) NOT NULL,
  PRIMARY KEY (id_vuelo_precio),
  CONSTRAINT fk_Plan_Vuelo_Temporal_Plan_Vuelo10
    FOREIGN KEY (codigo_plan_vuelo)
    REFERENCES Aerolinea_LMC.Plan_Vuelo (codigo_plan_vuelo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Plan_Vuelo_Dias`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Plan_Vuelo_Dias ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Plan_Vuelo_Dias (
  dia VARCHAR(25) NOT NULL,
  codigo_plan_vuelo INT NOT NULL,
  PRIMARY KEY (dia, codigo_plan_vuelo)
  CREATE INDEX fk_Plan_Vuelo_Dias_Plan_Vuelo1_idx ON Aerolinea_LMC.Plan_Vuelo_Dias (codigo_plan_vuelo ASC) VISIBLE,
  CONSTRAINT fk_Plan_Vuelo_Dias_Plan_Vuelo1
    FOREIGN KEY (codigo_plan_vuelo)
    REFERENCES `Aerolinea_LMC`.`Plan_Vuelo` (codigo_plan_vuelo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Vuelo`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Vuelo ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Vuelo (
  id_vuelo VARCHAR(50) NOT NULL,
  codigo_plan_vuelo INT NOT NULL,
  id_avion VARCHAR(150) NOT NULL,
  fecha_vuelo DATE NOT NULL,
  hora_real_aterrizaje TIME(0) NULL,
  hora_real_despegue TIME(0) NULL,
  PRIMARY KEY (id_vuelo)
  CREATE INDEX fk_Vuelo_Plan_Vuelo1_idx ON Aerolinea_LMC.Vuelo (codigo_plan_vuelo ASC) VISIBLE,
  INDEX fk_Vuelo_Avion1_idx (id_avion ASC) VISIBLE,
  CONSTRAINT fk_Vuelo_Plan_Vuelo1
    FOREIGN KEY (codigo_plan_vuelo)
    REFERENCES `Aerolinea_LMC`.`Plan_Vuelo` (codigo_plan_vuelo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Vuelo_Avion1
    FOREIGN KEY (id_avion)
    REFERENCES `Aerolinea_LMC`.`Avion` (id_avion)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Alimento_Vuelo`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Alimento_Vuelo ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Alimento_Vuelo (
  nombre_clase VARCHAR(50) NOT NULL,
  id_alimento INT NOT NULL,
  id_avion VARCHAR(150) NOT NULL,
  id_vuelo VARCHAR(50) NOT NULL,
  existencias INT NOT NULL,
  PRIMARY KEY (nombre_clase, id_alimento, id_avion, id_vuelo)
  CREATE INDEX fk_Alimento_Avion_has_Vuelo_Vuelo1_idx ON Aerolinea_LMC.Alimento_Vuelo (id_vuelo ASC) VISIBLE,
  INDEX fk_Alimento_Avion_has_Vuelo_Alimento_Avion1_idx (nombre_clase ASC, id_alimento ASC, id_avion ASC) VISIBLE,
  CONSTRAINT fk_Alimento_Avion_has_Vuelo_Alimento_Avion1
    FOREIGN KEY (nombre_clase , id_alimento , id_avion)
    REFERENCES `Aerolinea_LMC`.`Alimento_Avion` (nombre_clase , id_alimento , id_avion)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Alimento_Avion_has_Vuelo_Vuelo1
    FOREIGN KEY (id_vuelo)
    REFERENCES `Aerolinea_LMC`.`Vuelo` (id_vuelo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Ingrediente_Vuelo`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Ingrediente_Vuelo ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Ingrediente_Vuelo (
  id_vuelo VARCHAR(50) NOT NULL,
  nombre_ingrediente VARCHAR(50) NOT NULL,
  existencias INT NOT NULL,
  PRIMARY KEY (id_vuelo, nombre_ingrediente)
  CREATE INDEX fk_Vuelo_has_Ingrediente_Ingrediente1_idx ON Aerolinea_LMC.Ingrediente_Vuelo (nombre_ingrediente ASC) VISIBLE,
  INDEX fk_Vuelo_has_Ingrediente_Vuelo1_idx (id_vuelo ASC) VISIBLE,
  CONSTRAINT fk_Vuelo_has_Ingrediente_Vuelo1
    FOREIGN KEY (id_vuelo)
    REFERENCES `Aerolinea_LMC`.`Vuelo` (id_vuelo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Vuelo_has_Ingrediente_Ingrediente1
    FOREIGN KEY (nombre_ingrediente)
    REFERENCES `Aerolinea_LMC`.`Ingrediente` (nombre_ingrediente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Control_Vuelo`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Control_Vuelo ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE Aerolinea_LMC.Control_Vuelo_seq;

CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Control_Vuelo (
  id_control_vuelo INT NOT NULL DEFAULT NEXTVAL ('Aerolinea_LMC.Control_Vuelo_seq'),
  id_vuelo VARCHAR(50) NOT NULL,
  estado VARCHAR(45) NOT NULL,
  dia TIME(0) NOT NULL,
  hora TIME(0) NOT NULL
  CREATE INDEX fk_Control_Vuelo_Vuelo1_idx ON Aerolinea_LMC.Control_Vuelo (id_vuelo ASC) VISIBLE,
  PRIMARY KEY (id_control_vuelo),
  CONSTRAINT fk_Control_Vuelo_Vuelo1
    FOREIGN KEY (id_vuelo)
    REFERENCES `Aerolinea_LMC`.`Vuelo` (id_vuelo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Avion_Asientos_Registro_Unidad`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Avion_Asientos_Registro_Unidad ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Avion_Asientos_Registro_Unidad (
  numero_asiento VARCHAR(60) NOT NULL,
  nombre_clase VARCHAR(50) NOT NULL,
  id_avion VARCHAR(150) NOT NULL,
  descripcion_asiento VARCHAR(100) NOT NULL,
  PRIMARY KEY (numero_asiento, nombre_clase, id_avion)
  CREATE INDEX fk_Avion_Asientos_Registro_Unidad_Avion_Asientos_Totales_Po_idx ON Aerolinea_LMC.Avion_Asientos_Registro_Unidad (nombre_clase ASC, id_avion ASC) VISIBLE,
  CONSTRAINT fk_Avion_Asientos_Registro_Unidad_Avion_Asientos_Totales_Por_1
    FOREIGN KEY (nombre_clase , id_avion)
    REFERENCES `Aerolinea_LMC`.`Avion_Asientos_Totales_Por_Clase` (nombre_clase , id_avion)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Vuelo_Asiento_Disponible`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Vuelo_Asiento_Disponible ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Vuelo_Asiento_Disponible (
  id_vuelo VARCHAR(50) NOT NULL,
  numero_asiento VARCHAR(60) NOT NULL,
  nombre_clase VARCHAR(50) NOT NULL,
  id_avion VARCHAR(150) NOT NULL,
  estado VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_vuelo, numero_asiento)
  CREATE INDEX fk_Vuelo_has_Avion_Asientos_Registro_Unidad_Avion_Asientos__idx ON Aerolinea_LMC.Vuelo_Asiento_Disponible (numero_asiento ASC, nombre_clase ASC, id_avion ASC) VISIBLE,
  INDEX fk_Vuelo_has_Avion_Asientos_Registro_Unidad_Vuelo1_idx (id_vuelo ASC) VISIBLE,
  CONSTRAINT fk_Vuelo_has_Avion_Asientos_Registro_Unidad_Vuelo1
    FOREIGN KEY (id_vuelo)
    REFERENCES `Aerolinea_LMC`.`Vuelo` (id_vuelo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Vuelo_has_Avion_Asientos_Registro_Unidad_Avion_Asientos_Re1
    FOREIGN KEY (numero_asiento , nombre_clase , id_avion)
    REFERENCES `Aerolinea_LMC`.`Avion_Asientos_Registro_Unidad` (numero_asiento , nombre_clase , id_avion)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Admin`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Admin ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Admin (
  username VARCHAR(50) NOT NULL,
  password VARCHAR(200) NOT NULL,
  nombre_completo VARCHAR(100) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  PRIMARY KEY (username))
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Persona`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Persona ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Persona (
  CUI VARCHAR(13) NOT NULL,
  nombre_completo VARCHAR(100) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  genero VARCHAR(10) NOT NULL,
  PRIMARY KEY (CUI))
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Continente`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Continente ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Continente (
  nombre_continente VARCHAR(25) NOT NULL,
  descripcion_continente VARCHAR(150) NOT NULL,
  PRIMARY KEY (nombre_continente))
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Pais`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Pais ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Pais (
  nombre_pais VARCHAR(30) NOT NULL,
  descripcion_pais VARCHAR(45) NOT NULL,
  Continente_nombre_continente VARCHAR(25) NOT NULL,
  PRIMARY KEY (nombre_pais)
  CREATE INDEX fk_Pais_Continente1_idx ON Aerolinea_LMC.Pais (Continente_nombre_continente ASC) VISIBLE,
  CONSTRAINT fk_Pais_Continente1
    FOREIGN KEY (Continente_nombre_continente)
    REFERENCES `Aerolinea_LMC`.`Continente` (nombre_continente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Nacionalidad`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Nacionalidad ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Nacionalidad (
  CUI_persona VARCHAR(13) NOT NULL,
  nombre_pais VARCHAR(30) NOT NULL,
  PRIMARY KEY (CUI_persona, nombre_pais)
  CREATE INDEX fk_Persona_has_Pais_Pais1_idx ON Aerolinea_LMC.Nacionalidad (nombre_pais ASC) VISIBLE,
  INDEX fk_Persona_has_Pais_Persona1_idx (CUI_persona ASC) VISIBLE,
  CONSTRAINT fk_Persona_has_Pais_Persona1
    FOREIGN KEY (CUI_persona)
    REFERENCES `Aerolinea_LMC`.`Persona` (CUI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Persona_has_Pais_Pais1
    FOREIGN KEY (nombre_pais)
    REFERENCES `Aerolinea_LMC`.`Pais` (nombre_pais)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Documento_Identificacion`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Documento_Identificacion ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Documento_Identificacion (
  id_identificacion INT NOT NULL,
  tipo_documento VARCHAR(45) NOT NULL,
  pais_documento VARCHAR(30) NOT NULL,
  documento_pdf VARCHAR(45) NOT NULL,
  fecha_caducidad_documento DATE NULL,
  CUI_persona VARCHAR(13) NOT NULL,
  PRIMARY KEY (id_identificacion)
  CREATE INDEX fk_Documento_Identificacion_Pais1_idx ON Aerolinea_LMC.Documento_Identificacion (pais_documento ASC) VISIBLE,
  INDEX fk_Documento_Identificacion_Persona1_idx (CUI_persona ASC) VISIBLE,
  CONSTRAINT fk_Documento_Identificacion_Pais1
    FOREIGN KEY (pais_documento)
    REFERENCES `Aerolinea_LMC`.`Pais` (nombre_pais)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Documento_Identificacion_Persona1
    FOREIGN KEY (CUI_persona)
    REFERENCES `Aerolinea_LMC`.`Persona` (CUI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Contacto`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Contacto ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE Aerolinea_LMC.Contacto_seq;

CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Contacto (
  id_contacto INT NOT NULL DEFAULT NEXTVAL ('Aerolinea_LMC.Contacto_seq'),
  tipo_contacto VARCHAR(45) NOT NULL,
  valor_contacto VARCHAR(60) NOT NULL,
  CUI_persona VARCHAR(13) NOT NULL,
  PRIMARY KEY (id_contacto)
  CREATE INDEX fk_Contacto_Persona1_idx ON Aerolinea_LMC.Contacto (CUI_persona ASC) VISIBLE,
  CONSTRAINT fk_Contacto_Persona1
    FOREIGN KEY (CUI_persona)
    REFERENCES `Aerolinea_LMC`.`Persona` (CUI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Metodo_Pago`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Metodo_Pago ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Metodo_Pago (
  BIN_tarjeta VARCHAR(16) NOT NULL,
  marca_internacional VARCHAR(150) NOT NULL,
  tipo_metodo_pago VARCHAR(45) NOT NULL,
  CVV VARCHAR(150) NOT NULL,
  fecha_caducidad_tarjeta DATE NOT NULL,
  nombre_titular_tarjeta VARCHAR(60) NOT NULL,
  CUI_persona VARCHAR(13) NOT NULL,
  metodo_pago_default SMALLINT NOT NULL,
  PRIMARY KEY (BIN_tarjeta)
  CREATE INDEX fk_Metodo_Pago_Persona1_idx ON Aerolinea_LMC.Metodo_Pago (CUI_persona ASC) VISIBLE,
  CONSTRAINT fk_Metodo_Pago_Persona1
    FOREIGN KEY (CUI_persona)
    REFERENCES `Aerolinea_LMC`.`Persona` (CUI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Tipo_Cuenta`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Tipo_Cuenta ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Tipo_Cuenta (
  tipo_cuenta VARCHAR(30) NOT NULL,
  milla_por_dolar DECIMAL(4,2) NOT NULL,
  porcentaje_milla_cubre INT NOT NULL,
  posee_pelicula_cortesia INT NOT NULL,
  peso_maleta_documentada DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (tipo_cuenta))
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Cuenta_Usuario`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Cuenta_Usuario ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Cuenta_Usuario (
  username VARCHAR(45) NOT NULL,
  tipo_cuenta VARCHAR(30) NOT NULL,
  CUI_persona VARCHAR(45) NOT NULL,
  password VARCHAR(150) NOT NULL,
  total_millas DECIMAL(7,2) NOT NULL,
  millas_disponibles DECIMAL(7,2) NOT NULL
  CREATE INDEX fk_Tipo_Cuenta_has_Persona_Persona1_idx ON Aerolinea_LMC.Cuenta_Usuario (CUI_persona ASC) VISIBLE,
  INDEX fk_Tipo_Cuenta_has_Persona_Tipo_Cuenta1_idx (tipo_cuenta ASC) VISIBLE,
  PRIMARY KEY (username),
  CONSTRAINT fk_Tipo_Cuenta_has_Persona_Tipo_Cuenta1
    FOREIGN KEY (tipo_cuenta)
    REFERENCES `Aerolinea_LMC`.`Tipo_Cuenta` (tipo_cuenta)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Tipo_Cuenta_has_Persona_Persona1
    FOREIGN KEY (CUI_persona)
    REFERENCES `Aerolinea_LMC`.`Persona` (CUI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Boleto`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Boleto ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Boleto (
  id_boleto VARCHAR(15) NOT NULL,
  precio_base DECIMAL(9,2) NOT NULL,
  precio_extra DECIMAL(9,2) NOT NULL,
  id_vuelo VARCHAR(50) NOT NULL,
  numero_asiento VARCHAR(60) NOT NULL,
  estado_boleto VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_boleto)
  CREATE INDEX fk_Boleto_Vuelo_Asiento_Disponible1_idx ON Aerolinea_LMC.Boleto (id_vuelo ASC, numero_asiento ASC) VISIBLE,
  CONSTRAINT fk_Boleto_Vuelo_Asiento_Disponible1
    FOREIGN KEY (id_vuelo , numero_asiento)
    REFERENCES `Aerolinea_LMC`.`Vuelo_Asiento_Disponible` (id_vuelo , numero_asiento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Compra_Boleto`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Compra_Boleto ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE Aerolinea_LMC.Compra_Boleto_seq;

CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Compra_Boleto (
  id_compra_boleto INT NOT NULL DEFAULT NEXTVAL ('Aerolinea_LMC.Compra_Boleto_seq'),
  fecha_compra_registrada_sistema DATE NOT NULL,
  fecha_cancelacion_sistema DATE NULL,
  fecha_modificacion_sistema VARCHAR(45) NULL,
  precio_total DECIMAL(7,5) NOT NULL,
  estado_compra VARCHAR(45) NOT NULL,
  username_usuario VARCHAR(45) NULL,
  PRIMARY KEY (id_compra_boleto)
  CREATE INDEX fk_Compra_Boleto_Cuenta_Usuario2_idx ON Aerolinea_LMC.Compra_Boleto (username_usuario ASC) VISIBLE,
  CONSTRAINT fk_Compra_Boleto_Cuenta_Usuario2
    FOREIGN KEY (username_usuario)
    REFERENCES `Aerolinea_LMC`.`Cuenta_Usuario` (username)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Descripcion_Compra_Boleto`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Descripcion_Compra_Boleto ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Descripcion_Compra_Boleto (
  id_compra_boleto INT NOT NULL,
  id_boleto VARCHAR(15) NOT NULL,
  aplica_ida_vuelta SMALLINT NOT NULL,
  millas_usadas_como_pago DECIMAL(9,2) NOT NULL,
  precio_inicial DECIMAL(9,2) NOT NULL,
  precio_final DECIMAL(9,2) NOT NULL,
  descripcion_precio VARCHAR(150) NOT NULL
  CREATE INDEX fk_Descripcion_Compra_Boleto_Compra_Boleto1_idx ON Aerolinea_LMC.Descripcion_Compra_Boleto (id_compra_boleto ASC) VISIBLE,
  PRIMARY KEY (id_boleto, id_compra_boleto),
  CONSTRAINT fk_Descripcion_Compra_Boleto_Compra_Boleto1
    FOREIGN KEY (id_compra_boleto)
    REFERENCES `Aerolinea_LMC`.`Compra_Boleto` (id_compra_boleto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Descripcion_Compra_Boleto_Boleto1
    FOREIGN KEY (id_boleto)
    REFERENCES `Aerolinea_LMC`.`Boleto` (id_boleto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Compra_Boleto_Manual`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Compra_Boleto_Manual ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Compra_Boleto_Manual (
  id_compra_boleto INT NOT NULL,
  nombre_completo VARCHAR(60) NOT NULL,
  genero VARCHAR(45) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  pais_pasaporte VARCHAR(60) NOT NULL,
  numero_pasaporte VARCHAR(15) NOT NULL,
  fecha_caducidad_pasaporte DATE NOT NULL,
  BIN_tarjeta VARCHAR(150) NOT NULL,
  marca_internacional VARCHAR(150) NOT NULL,
  tipo_metodo_pago VARCHAR(45) NOT NULL,
  CVV VARCHAR(150) NOT NULL,
  fecha_caducidad_tarjeta DATE NOT NULL,
  nombre_titular_tarjeta VARCHAR(80) NOT NULL,
  PRIMARY KEY (id_compra_boleto)
  CREATE INDEX fk_Compra_Boleto_Manual_Compra_Boleto1_idx ON Aerolinea_LMC.Compra_Boleto_Manual (id_compra_boleto ASC) VISIBLE,
  CONSTRAINT fk_Compra_Boleto_Manual_Compra_Boleto1
    FOREIGN KEY (id_compra_boleto)
    REFERENCES `Aerolinea_LMC`.`Compra_Boleto` (id_compra_boleto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Pasajero`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Pasajero ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE Aerolinea_LMC.Pasajero_seq;

CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Pasajero (
  id_pasajero INT NOT NULL DEFAULT NEXTVAL ('Aerolinea_LMC.Pasajero_seq'),
  CUI_persona VARCHAR(13) NOT NULL,
  id_boleto VARCHAR(15) NOT NULL,
  estado_viaje VARCHAR(45) NOT NULL
  CREATE INDEX fk_table1_Persona1_idx ON Aerolinea_LMC.Pasajero (CUI_persona ASC) VISIBLE,
  INDEX fk_table1_Boleto1_idx (id_boleto ASC) VISIBLE,
  PRIMARY KEY (id_pasajero),
  CONSTRAINT fk_table1_Persona1
    FOREIGN KEY (CUI_persona)
    REFERENCES `Aerolinea_LMC`.`Persona` (CUI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_table1_Boleto1
    FOREIGN KEY (id_boleto)
    REFERENCES `Aerolinea_LMC`.`Boleto` (id_boleto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Costo_General_Supervisor_Asignado_Menino`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Costo_General_Supervisor_Asignado_Menino ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE Aerolinea_LMC.Costo_General_Supervisor_Asignado_Menino_seq;

CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Costo_General_Supervisor_Asignado_Menino (
  id_costo_general_supervisor_asignado INT NOT NULL DEFAULT NEXTVAL ('Aerolinea_LMC.Costo_General_Supervisor_Asignado_Menino_seq'),
  precio_general_supervisor_asignado DECIMAL(7,2) NOT NULL,
  hora TIME(0) NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NULL,
  username_admin VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_costo_general_supervisor_asignado)
  CREATE INDEX fk_Costo_General_Supervisor_Asignado_Menino_Admin1_idx ON Aerolinea_LMC.Costo_General_Supervisor_Asignado_Menino (username_admin ASC) VISIBLE,
  CONSTRAINT fk_Costo_General_Supervisor_Asignado_Menino_Admin1
    FOREIGN KEY (username_admin)
    REFERENCES `Aerolinea_LMC`.`Admin` (username)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Costo_General_Carga`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Costo_General_Carga ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE Aerolinea_LMC.Costo_General_Carga_seq;

CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Costo_General_Carga (
  id_costo_general_carga INT NOT NULL DEFAULT NEXTVAL ('Aerolinea_LMC.Costo_General_Carga_seq'),
  tipo_carga VARCHAR(45) NOT NULL,
  precio_general_carga DECIMAL(7,2) NOT NULL,
  rango_peso_inicio DECIMAL(7,2) NOT NULL,
  rango_peso_fin DECIMAL(7,2) NOT NULL,
  hora TIME(0) NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NULL,
  username_admin VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_costo_general_carga)
  CREATE INDEX fk_Costo_General_Carga_Admin1_idx ON Aerolinea_LMC.Costo_General_Carga (username_admin ASC) VISIBLE,
  CONSTRAINT fk_Costo_General_Carga_Admin1
    FOREIGN KEY (username_admin)
    REFERENCES `Aerolinea_LMC`.`Admin` (username)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Supervisor_Asignado_Menino`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Supervisor_Asignado_Menino ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Supervisor_Asignado_Menino (
  id_pasajero_menino INT NOT NULL,
  CUI_supervisor VARCHAR(13) NOT NULL,
  tipo_supervisor VARCHAR(45) NOT NULL,
  costo_supervisor DECIMAL(7,2) NOT NULL
  CREATE INDEX fk_Supervisor_Asignado_Menino_Pasajero1_idx ON Aerolinea_LMC.Supervisor_Asignado_Menino (id_pasajero_menino ASC) VISIBLE,
  INDEX fk_Supervisor_Asignado_Menino_Persona1_idx (CUI_supervisor ASC) VISIBLE,
  PRIMARY KEY (id_pasajero_menino, CUI_supervisor),
  CONSTRAINT fk_Supervisor_Asignado_Menino_Pasajero1
    FOREIGN KEY (id_pasajero_menino)
    REFERENCES `Aerolinea_LMC`.`Pasajero` (id_pasajero)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Supervisor_Asignado_Menino_Persona1
    FOREIGN KEY (CUI_supervisor)
    REFERENCES `Aerolinea_LMC`.`Persona` (CUI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Dimension_Equipaje`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Dimension_Equipaje ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE Aerolinea_LMC.Dimension_Equipaje_seq;

CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Dimension_Equipaje (
  id_dimension_equipaje INT NOT NULL DEFAULT NEXTVAL ('Aerolinea_LMC.Dimension_Equipaje_seq'),
  tipo_equipaje VARCHAR(45) NOT NULL,
  dimension_equipaje DECIMAL(7,2) NOT NULL,
  peso_equipaje_rango_inicio DECIMAL(7,2) NOT NULL,
  peso_equipaje_rango_fin DECIMAL(7,2) NOT NULL,
  hora TIME(0) NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NULL,
  username_admin VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_dimension_equipaje)
  CREATE INDEX fk_Costo_General_Carga_Admin1_idx ON Aerolinea_LMC.Dimension_Equipaje (username_admin ASC) VISIBLE,
  CONSTRAINT fk_Costo_General_Carga_Admin10
    FOREIGN KEY (username_admin)
    REFERENCES `Aerolinea_LMC`.`Admin` (username)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Cantidad_General_Maleta_Max_Por_Boleto`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Cantidad_General_Maleta_Max_Por_Boleto ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE Aerolinea_LMC.Cantidad_General_Maleta_Max_Por_Boleto_seq;

CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Cantidad_General_Maleta_Max_Por_Boleto (
  id_cantidad_max_boleto INT NOT NULL DEFAULT NEXTVAL ('Aerolinea_LMC.Cantidad_General_Maleta_Max_Por_Boleto_seq'),
  cantidad_max_maletas INT NOT NULL,
  hora TIME(0) NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NULL,
  username_admin VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_cantidad_max_boleto)
  CREATE INDEX fk_Costo_General_Carga_Admin1_idx ON Aerolinea_LMC.Cantidad_General_Maleta_Max_Por_Boleto (username_admin ASC) VISIBLE,
  CONSTRAINT fk_Costo_General_Carga_Admin11
    FOREIGN KEY (username_admin)
    REFERENCES `Aerolinea_LMC`.`Admin` (username)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Costo_General_Maleta_Extra`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Costo_General_Maleta_Extra ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE Aerolinea_LMC.Costo_General_Maleta_Extra_seq;

CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Costo_General_Maleta_Extra (
  id_costo_general_maleta_extra INT NOT NULL DEFAULT NEXTVAL ('Aerolinea_LMC.Costo_General_Maleta_Extra_seq'),
  numero_maleta INT NOT NULL,
  precio_maleta_extra DECIMAL(7,2) NOT NULL,
  hora TIME(0) NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NULL,
  username_admin VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_costo_general_maleta_extra)
  CREATE INDEX fk_Costo_General_Carga_Admin1_idx ON Aerolinea_LMC.Costo_General_Maleta_Extra (username_admin ASC) VISIBLE,
  CONSTRAINT fk_Costo_General_Carga_Admin110
    FOREIGN KEY (username_admin)
    REFERENCES `Aerolinea_LMC`.`Admin` (username)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Equipaje`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Equipaje ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE Aerolinea_LMC.Equipaje_seq;

CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Equipaje (
  id_equipaje INT NOT NULL DEFAULT NEXTVAL ('Aerolinea_LMC.Equipaje_seq'),
  id_pasajero INT NOT NULL,
  tipo_equipaje VARCHAR(45) NOT NULL,
  precio_final DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (id_equipaje)
  CREATE INDEX fk_Equipaje_Pasajero1_idx ON Aerolinea_LMC.Equipaje (id_pasajero ASC) VISIBLE,
  CONSTRAINT fk_Equipaje_Pasajero1
    FOREIGN KEY (id_pasajero)
    REFERENCES `Aerolinea_LMC`.`Pasajero` (id_pasajero)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Equipaje_Mano`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Equipaje_Mano ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Equipaje_Mano (
  id_equipaje INT NOT NULL,
  detalle_equipaje_mano VARCHAR(200) NOT NULL,
  dimension_equipaje_mano DECIMAL(7,2) NOT NULL
  CREATE INDEX fk_table1_Equipaje1_idx ON Aerolinea_LMC.Equipaje_Mano (id_equipaje ASC) VISIBLE,
  PRIMARY KEY (id_equipaje),
  CONSTRAINT fk_table1_Equipaje1
    FOREIGN KEY (id_equipaje)
    REFERENCES `Aerolinea_LMC`.`Equipaje` (id_equipaje)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Maleta_Documentada`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Maleta_Documentada ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Maleta_Documentada (
  id_equipaje INT NOT NULL,
  detalle_maleta_documentada VARCHAR(200) NOT NULL,
  peso_maleta_documentada DECIMAL(7,2) NOT NULL,
  dimension_equipaje_mano DECIMAL(7,2) NOT NULL,
  precio_maleta_documentada_original DECIMAL(7,2) NOT NULL,
  maleta_cortesia_cuenta SMALLINT NOT NULL,
  descripcion_precio VARCHAR(150) NOT NULL,
  precio_maleta_documentada_final DECIMAL(7,2) NOT NULL
  CREATE INDEX fk_table1_Equipaje1_idx ON Aerolinea_LMC.Maleta_Documentada (id_equipaje ASC) VISIBLE,
  PRIMARY KEY (id_equipaje),
  CONSTRAINT fk_table1_Equipaje10
    FOREIGN KEY (id_equipaje)
    REFERENCES `Aerolinea_LMC`.`Equipaje` (id_equipaje)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Animal`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Animal ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Animal (
  id_animal INT NOT NULL,
  nombre_animal VARCHAR(45) NOT NULL,
  especie VARCHAR(45) NOT NULL,
  descripcion_animal VARCHAR(150) NOT NULL,
  peso_animal DECIMAL(7,2) NOT NULL,
  peso_jaula DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (id_animal))
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Certificado`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Certificado ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Certificado (
  id_certificado VARCHAR(40) NOT NULL,
  fecha_inicio_certificacion DATE NOT NULL,
  fecha_expiracion_certificacion DATE NOT NULL,
  numero_certificacion_veterinario VARCHAR(20) NOT NULL,
  id_animal INT NOT NULL,
  PRIMARY KEY (id_certificado)
  CREATE INDEX fk_Certificado_Animal1_idx ON Aerolinea_LMC.Certificado (id_animal ASC) VISIBLE,
  CONSTRAINT fk_Certificado_Animal1
    FOREIGN KEY (id_animal)
    REFERENCES `Aerolinea_LMC`.`Animal` (id_animal)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Vacuna`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Vacuna ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Vacuna (
  id_vacuna VARCHAR(20) NOT NULL,
  fecha_vacunacion DATE NOT NULL,
  fecha_expiracion DATE NOT NULL,
  id_animal INT NOT NULL,
  PRIMARY KEY (id_vacuna)
  CREATE INDEX fk_Vacuna_Animal1_idx ON Aerolinea_LMC.Vacuna (id_animal ASC) VISIBLE,
  CONSTRAINT fk_Vacuna_Animal1
    FOREIGN KEY (id_animal)
    REFERENCES `Aerolinea_LMC`.`Animal` (id_animal)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Supervisor_Animal`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Supervisor_Animal ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Supervisor_Animal (
  id_animal INT NOT NULL,
  id_pasajero INT NOT NULL,
  costo_supervisor_animal DECIMAL(9,2) NOT NULL,
  descripcion_costo_supervisor_animal VARCHAR(150) NOT NULL,
  PRIMARY KEY (id_animal, id_pasajero)
  CREATE INDEX fk_Animal_has_Pasajero_Pasajero1_idx ON Aerolinea_LMC.Supervisor_Animal (id_pasajero ASC) VISIBLE,
  INDEX fk_Animal_has_Pasajero_Animal1_idx (id_animal ASC) VISIBLE,
  CONSTRAINT fk_Animal_has_Pasajero_Animal1
    FOREIGN KEY (id_animal)
    REFERENCES `Aerolinea_LMC`.`Animal` (id_animal)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Animal_has_Pasajero_Pasajero1
    FOREIGN KEY (id_pasajero)
    REFERENCES `Aerolinea_LMC`.`Pasajero` (id_pasajero)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Zona_Carga`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Zona_Carga ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Zona_Carga (
  id_zona_carga INT NOT NULL,
  tipo_carga VARCHAR(45) NOT NULL,
  peso_carga DECIMAL(9,2) NOT NULL,
  id_pasajero INT NOT NULL,
  costo_inicial DECIMAL(7,2) NOT NULL,
  costo_final DECIMAL(7,2) NOT NULL,
  es_animal INT NULL,
  descripcion_zona_carga VARCHAR(150) NOT NULL
  CREATE INDEX fk_Animal_has_Pasajero1_Pasajero1_idx ON Aerolinea_LMC.Zona_Carga (id_pasajero ASC) VISIBLE,
  INDEX fk_Animal_has_Pasajero1_Animal1_idx (es_animal ASC) VISIBLE,
  PRIMARY KEY (id_zona_carga, id_pasajero),
  CONSTRAINT fk_Animal_has_Pasajero1_Animal1
    FOREIGN KEY (es_animal)
    REFERENCES `Aerolinea_LMC`.`Animal` (id_animal)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Animal_has_Pasajero1_Pasajero1
    FOREIGN KEY (id_pasajero)
    REFERENCES `Aerolinea_LMC`.`Pasajero` (id_pasajero)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Beneficio_Tipo_Cuenta`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Beneficio_Tipo_Cuenta ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Beneficio_Tipo_Cuenta (
  tipo_beneficio INT NOT NULL,
  tipo_cuenta VARCHAR(30) NOT NULL,
  descripcion_beneficio VARCHAR(200) NOT NULL,
  cantidad_beneficio DECIMAL(7,2) NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NOT NULL,
  PRIMARY KEY (tipo_beneficio, tipo_cuenta)
  CREATE INDEX fk_Beneficio_Tipo_Cuenta_Tipo_Cuenta1_idx ON Aerolinea_LMC.Beneficio_Tipo_Cuenta (tipo_cuenta ASC) VISIBLE,
  CONSTRAINT fk_Beneficio_Tipo_Cuenta_Tipo_Cuenta1
    FOREIGN KEY (tipo_cuenta)
    REFERENCES `Aerolinea_LMC`.`Tipo_Cuenta` (tipo_cuenta)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Aseguranza`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Aseguranza ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Aseguranza (
  id_boleto VARCHAR(15) NOT NULL,
  cuota_aseguranza DECIMAL(7,2) NOT NULL,
  porcentaje_reposicion INT NOT NULL,
  fecha_compra_aseguranza DATE NOT NULL,
  PRIMARY KEY (id_boleto),
  CONSTRAINT fk_table1_Boleto2
    FOREIGN KEY (id_boleto)
    REFERENCES Aerolinea_LMC.Boleto (id_boleto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Costo_Global_Conexion_Wifi`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Costo_Global_Conexion_Wifi ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Costo_Global_Conexion_Wifi (
  id_costo_global_wifi VARCHAR(6) NOT NULL,
  costo_global_wifi DECIMAL(9,2) NOT NULL,
  hora TIME(0) NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NULL,
  username_admin VARCHAR(50) NOT NULL,
  tiempo_renta DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (id_costo_global_wifi)
  CREATE INDEX fk_Costo_Global_Conexion_Wifi_Admin1_idx ON Aerolinea_LMC.Costo_Global_Conexion_Wifi (username_admin ASC) VISIBLE,
  CONSTRAINT fk_Costo_Global_Conexion_Wifi_Admin1
    FOREIGN KEY (username_admin)
    REFERENCES `Aerolinea_LMC`.`Admin` (username)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Pelicula`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Pelicula ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Pelicula (
  titulo_original VARCHAR(100) NOT NULL,
  director_pelicula VARCHAR(100) NOT NULL,
  titulo_distribucion VARCHAR(100) NOT NULL,
  genero_pelicula VARCHAR(45) NOT NULL,
  idoma_original VARCHAR(45) NOT NULL,
  subtitulada_espaniol SMALLINT NOT NULL,
  nombre_pais_origen VARCHAR(30) NOT NULL,
  anio_produccion DATE NOT NULL,
  duracion DECIMAL(9,2) NOT NULL,
  calificacion_plataformas DECIMAL(5,2) NOT NULL,
  fecha_estreno DATE NOT NULL,
  resumen VARCHAR(4000) NOT NULL,
  precio_renta_aerolinea DECIMAL(9,2) NOT NULL,
  precio_renta_pasajeros DECIMAL(9,2) NOT NULL,
  PRIMARY KEY (titulo_original, director_pelicula)
  CREATE INDEX fk_Pelicula_Pais1_idx ON Aerolinea_LMC.Pelicula (nombre_pais_origen ASC) VISIBLE,
  CONSTRAINT fk_Pelicula_Pais1
    FOREIGN KEY (nombre_pais_origen)
    REFERENCES `Aerolinea_LMC`.`Pais` (nombre_pais)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Wifi`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Wifi ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE Aerolinea_LMC.Wifi_seq;

CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Wifi (
   id_wifi INT NOT NULL DEFAULT NEXTVAL ('Aerolinea_LMC.Wifi_seq'),
  ssid_wifi VARCHAR(45) NOT NULL,
  seguridad VARCHAR(15) NOT NULL,
  estado VARCHAR(20) NOT NULL,
  proxy VARCHAR(45) NOT NULL,
  configuracion_ip VARCHAR(30) NOT NULL,
  mascara_red VARCHAR(30) NOT NULL,
  puerta_enlace VARCHAR(30) NOT NULL,
  ipv4 VARCHAR(30) NOT NULL,
  password VARCHAR(150) NOT NULL,
  Avion_id_avion VARCHAR(150) NOT NULL,
  PRIMARY KEY ( id_wifi)
  CREATE INDEX fk_Wifi_Avion1_idx ON Aerolinea_LMC.Wifi (Avion_id_avion ASC) VISIBLE,
  CONSTRAINT fk_Wifi_Avion1
    FOREIGN KEY (Avion_id_avion)
    REFERENCES `Aerolinea_LMC`.`Avion` (id_avion)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Renta_Pelicula`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Renta_Pelicula ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Renta_Pelicula (
  id_pasajero INT NOT NULL,
  titulo_original_pelicula VARCHAR(100) NOT NULL,
  director_pelicula VARCHAR(100) NOT NULL,
  fecha_compra DATE NOT NULL,
  hora_compra TIME(0) NOT NULL,
  precio_original DECIMAL(9,2) NOT NULL,
  precio_pagado DECIMAL(9,2) NOT NULL,
   is_pelicula_cortesia SMALLINT NOT NULL,
  PRIMARY KEY (id_pasajero, titulo_original_pelicula, director_pelicula, fecha_compra)
  CREATE INDEX fk_Pasajero_has_Pelicula_Pelicula1_idx ON Aerolinea_LMC.Renta_Pelicula (titulo_original_pelicula ASC, director_pelicula ASC) VISIBLE,
  INDEX fk_Pasajero_has_Pelicula_Pasajero1_idx (id_pasajero ASC) VISIBLE,
  CONSTRAINT fk_Pasajero_has_Pelicula_Pasajero1
    FOREIGN KEY (id_pasajero)
    REFERENCES `Aerolinea_LMC`.`Pasajero` (id_pasajero)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Pasajero_has_Pelicula_Pelicula1
    FOREIGN KEY (titulo_original_pelicula , director_pelicula)
    REFERENCES `Aerolinea_LMC`.`Pelicula` (titulo_original , director_pelicula)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Compra_Wifi`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Compra_Wifi ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Compra_Wifi (
  id_wifi INT NOT NULL,
  id_pasajero INT NOT NULL,
  fecha_compra DATE NOT NULL,
  hora_compra TIME(0) NOT NULL,
  tiempo_compra DECIMAL(7,2) NOT NULL,
  precio_original DECIMAL(7,2) NOT NULL,
  precio_pagado DECIMAL(7,2) NOT NULL,
  es_cortesia SMALLINT NOT NULL,
  PRIMARY KEY (id_wifi, id_pasajero, fecha_compra)
  CREATE INDEX fk_Wifi_has_Pasajero_Pasajero1_idx ON Aerolinea_LMC.Compra_Wifi (id_pasajero ASC) VISIBLE,
  INDEX fk_Wifi_has_Pasajero_Wifi1_idx (id_wifi ASC) VISIBLE,
  CONSTRAINT fk_Wifi_has_Pasajero_Wifi1
    FOREIGN KEY (id_wifi)
    REFERENCES `Aerolinea_LMC`.`Wifi` ( id_wifi)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Wifi_has_Pasajero_Pasajero1
    FOREIGN KEY (id_pasajero)
    REFERENCES `Aerolinea_LMC`.`Pasajero` (id_pasajero)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Encuesta`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Encuesta ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Encuesta (
  id_pasajero INT NOT NULL,
  calificacion_comida DECIMAL(5,2) NOT NULL,
  calificacion_servicio DECIMAL(5,2) NOT NULL,
  calificacion_vuelo DECIMAL(5,2) NOT NULL,
  notas_adicionales VARCHAR(500) NOT NULL
  CREATE INDEX fk_Encuesta_Pasajero1_idx ON Aerolinea_LMC.Encuesta (id_pasajero ASC) VISIBLE,
  PRIMARY KEY (id_pasajero),
  CONSTRAINT fk_Encuesta_Pasajero1
    FOREIGN KEY (id_pasajero)
    REFERENCES `Aerolinea_LMC`.`Pasajero` (id_pasajero)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Personal`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Personal ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Personal (
  CUI_persona VARCHAR(13) NOT NULL,
  puesto VARCHAR(45) NOT NULL,
  salario_por_hora DECIMAL(7,2) NOT NULL,
  estado_personal VARCHAR(45) NOT NULL,
  fecha_contratacion DATE NOT NULL,
  experiencia_anios DECIMAL(4,2) NOT NULL
  CREATE INDEX fk_table1_Persona2_idx ON Aerolinea_LMC.Personal (CUI_persona ASC) VISIBLE,
  PRIMARY KEY (CUI_persona),
  CONSTRAINT fk_table1_Persona2
    FOREIGN KEY (CUI_persona)
    REFERENCES `Aerolinea_LMC`.`Persona` (CUI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Vuelo_Personal`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Vuelo_Personal ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Vuelo_Personal (
  id_vuelo VARCHAR(50) NOT NULL,
  CUI_personal VARCHAR(13) NOT NULL,
  comision DECIMAL(9,2) NOT NULL,
  descripcion_comision VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_vuelo, CUI_personal)
  CREATE INDEX fk_Vuelo_has_Personal_Personal1_idx ON Aerolinea_LMC.Vuelo_Personal (CUI_personal ASC) VISIBLE,
  INDEX fk_Vuelo_has_Personal_Vuelo1_idx (id_vuelo ASC) VISIBLE,
  CONSTRAINT fk_Vuelo_has_Personal_Vuelo1
    FOREIGN KEY (id_vuelo)
    REFERENCES `Aerolinea_LMC`.`Vuelo` (id_vuelo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Vuelo_has_Personal_Personal1
    FOREIGN KEY (CUI_personal)
    REFERENCES `Aerolinea_LMC`.`Personal` (CUI_persona)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Tiempo_Personal`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Tiempo_Personal ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Tiempo_Personal (
  CUI_personal VARCHAR(13) NOT NULL,
  fecha DATE NOT NULL,
  hora_inicio_jornada TIME(0) NOT NULL,
  hora_fin_jornada TIME(0) NOT NULL,
  estado VARCHAR(45) NOT NULL,
  pago_correspondiente DECIMAL(9,2) NOT NULL
  CREATE INDEX fk_Tiempo_Personal_Personal1_idx ON Aerolinea_LMC.Tiempo_Personal (CUI_personal ASC) VISIBLE,
  PRIMARY KEY (CUI_personal, fecha),
  CONSTRAINT fk_Tiempo_Personal_Personal1
    FOREIGN KEY (CUI_personal)
    REFERENCES `Aerolinea_LMC`.`Personal` (CUI_persona)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Facturacion`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Facturacion ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE Aerolinea_LMC.Facturacion_seq;

CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Facturacion (
  id_facturacion INT NOT NULL DEFAULT NEXTVAL ('Aerolinea_LMC.Facturacion_seq'),
  paga_total DECIMAL(9,2) NOT NULL,
  descripcion_paga VARCHAR(45) NULL,
  PRIMARY KEY (id_facturacion))
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Descripcion_Facturacion`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Descripcion_Facturacion ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Descripcion_Facturacion (
  CUI_personal VARCHAR(13) NOT NULL,
  fecha_paga DATE NOT NULL,
  id_facturacion INT NOT NULL,
  extras DECIMAL(9,2) NOT NULL,
  pago_correspondiente_fecha DECIMAL(9,2) NOT NULL,
  descripcion_facturacion_fecha VARCHAR(45) NULL,
  PRIMARY KEY (CUI_personal, fecha_paga, id_facturacion)
  CREATE INDEX fk_Tiempo_Personal_has_Facturacion_Facturacion1_idx ON Aerolinea_LMC.Descripcion_Facturacion (id_facturacion ASC) VISIBLE,
  INDEX fk_Tiempo_Personal_has_Facturacion_Tiempo_Personal1_idx (CUI_personal ASC, fecha_paga ASC) VISIBLE,
  CONSTRAINT fk_Tiempo_Personal_has_Facturacion_Tiempo_Personal1
    FOREIGN KEY (CUI_personal , fecha_paga)
    REFERENCES `Aerolinea_LMC`.`Tiempo_Personal` (CUI_personal , fecha)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Tiempo_Personal_has_Facturacion_Facturacion1
    FOREIGN KEY (id_facturacion)
    REFERENCES `Aerolinea_LMC`.`Facturacion` (id_facturacion)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** LMC`.`Compra_Comida_Pasajero`
-- SQLINES DEMO *** ------------------------------------
DROP TABLE IF EXISTS Aerolinea_LMC.Compra_Comida_Pasajero ;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS Aerolinea_LMC.Compra_Comida_Pasajero (
  id_pasajero INT NOT NULL,
  nombre_clase_alimento VARCHAR(50) NOT NULL,
  id_alimento INT NOT NULL,
  id_avion VARCHAR(150) NOT NULL,
  id_vuelo VARCHAR(50) NOT NULL,
  hora TIME(0) NOT NULL,
  fecha_compra DATE NOT NULL,
  precio_pagado DECIMAL(9,2) NOT NULL,
  PRIMARY KEY (id_pasajero, nombre_clase_alimento, id_alimento, id_avion, id_vuelo)
  CREATE INDEX fk_Pasajero_has_Alimento_Vuelo_Alimento_Vuelo1_idx ON Aerolinea_LMC.Compra_Comida_Pasajero (nombre_clase_alimento ASC, id_alimento ASC, id_avion ASC, id_vuelo ASC) VISIBLE,
  INDEX fk_Pasajero_has_Alimento_Vuelo_Pasajero1_idx (id_pasajero ASC) VISIBLE,
  CONSTRAINT fk_Pasajero_has_Alimento_Vuelo_Pasajero1
    FOREIGN KEY (id_pasajero)
    REFERENCES `Aerolinea_LMC`.`Pasajero` (id_pasajero)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Pasajero_has_Alimento_Vuelo_Alimento_Vuelo1
    FOREIGN KEY (nombre_clase_alimento , id_alimento , id_avion , id_vuelo)
    REFERENCES `Aerolinea_LMC`.`Alimento_Vuelo` (nombre_clase , id_alimento , id_avion , id_vuelo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

SET SCHEMA 'Aerolinea_LMC';

DELIMITER $$

SET SCHEMA 'Aerolinea_LMC'$$
DROP TRIGGER IF EXISTS Aerolinea_LMC.Pasajero_BEFORE_INSERT $$
SET SCHEMA 'Aerolinea_LMC'$$
$$


DELIMITER ;

/* SET SQL_MODE=@OLD_SQL_MODE; */
/* SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS; */
/* SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS; */
