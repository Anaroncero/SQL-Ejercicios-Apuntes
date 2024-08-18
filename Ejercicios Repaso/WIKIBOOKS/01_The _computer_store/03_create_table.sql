
/* Crear Tabla 1 */
CREATE TABLE Manufacturers(
	Code int PRIMARY KEY AUTO_INCREMENT,
    Name varchar(50) NOT NULL UNIQUE
);

/* Crear Tabla 2 */
CREATE TABLE Products(
	Code int PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name varchar(50) NOT NULL,
    Price real NOT NULL,
    Manufacter int NOT NULL,
		CONSTRAINT fk_Manufacter_Code FOREIGN KEY (Manufacter) REFERENCES Manufacturers(Code)
);