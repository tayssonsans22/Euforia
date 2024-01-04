CREATE TABLE IF NOT EXISTS `maze_logs` (
	`registro` int(11) NOT NULL AUTO_INCREMENT,
	`staff` varchar(50) NOT NULL,
	`usuario` varchar(50) NOT NULL,
	`tipo` varchar(50) NOT NULL,
	`descricao` varchar(255) NOT NULL,
	PRIMARY KEY (`registro`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `maze_tp` (
	`numero` int(25) NOT NULL AUTO_INCREMENT,
	`nome` varchar(255) NOT NULL,
	`x` int(25) NOT NULL,
	`y` int(25) NOT NULL,
	`z` int(25) NOT NULL,
	PRIMARY KEY (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;