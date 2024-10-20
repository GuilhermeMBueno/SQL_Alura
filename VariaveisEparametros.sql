
-- Criando procedure e definindo valores em suas variaveis. 
USE `insight_places`;
DROP procedure IF EXISTS `insight_places`.`novoAluguel_21`;
DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_21`()
BEGIN
	DECLARE vAluguel VARCHAR(10) DEFAULT 10001;
    DECLARE vCliente VARCHAR(10) DEFAULT 1002;
    DECLARE vHospedagem VARCHAR(10) DEFAULT 8635; 
    DECLARE vDataInicio DATE DEFAULT '2023-03-01';
    DECLARE vDataFinal DATE DEFAULT '2023-03-05';
    DECLARE vPrecoTotal DECIMAL(10,2) DEFAULT 550.22;
    SELECT vAluguel, vCliente, vHospedagem, vDataInicio, vDataFinal, vPrecoTotal;
END$$
DELIMITER ;

--------

--Inserir valor através de procedure, utilizando valores das variaveis.
INSERT INTO alugueis VALUES ('10001','1002','8635','2023-03-01','2023-03-05','550.22');

USE `insight_places`;
DROP procedure IF EXISTS `insight_places`.`novoAluguel_22`;
DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_22`()
BEGIN
	DECLARE vAluguel VARCHAR(10) DEFAULT 10001;
    DECLARE vCliente VARCHAR(10) DEFAULT 1002;
    DECLARE vHospedagem VARCHAR(10) DEFAULT 8635; 
    DECLARE vDataInicio DATE DEFAULT '2023-03-01';
    DECLARE vDataFinal DATE DEFAULT '2023-03-05';
    DECLARE vPrecoTotal DECIMAL(10,2) DEFAULT 550.22;
    INSERT INTO alugueis VALUES (vAluguel,vCliente,vHospedagem,vDataInicio,vDataFinal,vPrecoTotal);
END$$
DELIMITER ;

--Inserindo os valores: 
CALL novoAluguel_22();
SELECT * FROM alugueis WHERE aluguel_id = '10001'

--------

--Trabalhando com Parametros

USE `insight_places`;
DROP procedure IF EXISTS `insight_places`.`novoAluguel_23`;
DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_23`
    (vAluguel VARCHAR(10),vCliente VARCHAR(10),vHospedagem VARCHAR(10),vDataInicio DATE,vDataFinal DATE,vPrecoTotal DECIMAL(10,2))
BEGIN
    INSERT INTO alugueis VALUES (vAluguel,vCliente,vHospedagem,vDataInicio,vDataFinal,vPrecoTotal);
END$$
DELIMITER ;

--Inserindo os dados através dos parametros definidos.
CALL novoAluguel_23('10002','1003','8635','2023-03-06','2023-03-10','600');
SELECT * FROM alugueis WHERE aluguel_id = '10003';
CALL novoAluguel_23('10003','1003','8635','2023-03-10','2023-03-12','250');
SELECT * FROM alugueis WHERE aluguel_id IN ('10002','10003');