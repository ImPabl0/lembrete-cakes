class DatabaseHelpers {
  static String get formaDePagamentoCreateQuery {
    return """
    CREATE TABLE forma_de_pagamento ( 
    	id                   INTEGER NOT NULL  PRIMARY KEY  ,
    	nome                 VARCHAR(255)     
     );
    """;
  }

  static String get pedidoCreateQuery {
    return """
    CREATE TABLE pedido ( 
	id                   INTEGER NOT NULL  PRIMARY KEY  ,
	id_cliente           INTEGER     ,
	data_pedido          DATE  DEFAULT (date('now'))   ,
	data_entrega         DATE  DEFAULT (date('now', '+30 days'))   ,
	id_produto           INTEGER     ,
	descricao            VARCHAR(255)     ,
	referencia           BLOB     ,
	id_forma_de_pagamento INTEGER     ,
	orcamento_do_pedido  FLOAT     ,
	quantidade           FLOAT     ,
	status               VARCHAR(40)     ,
	CONSTRAINT unq_pedidos_id_produto UNIQUE ( id_produto ),
	CONSTRAINT unq_pedido_id_cliente UNIQUE ( id_cliente ),
	FOREIGN KEY ( id_forma_de_pagamento ) REFERENCES forma_de_pagamento( id )  ,
	FOREIGN KEY ( id_produto ) REFERENCES produto( id )  
 );


    """;
  }

  static String get produtoCreateQuery {
    return """
   CREATE TABLE produto ( 
	id                   INTEGER NOT NULL  PRIMARY KEY  ,
	nome                 VARCHAR(255)     ,
	descricao_produto    VARCHAR(255)     ,
 );

    """;
  }

  static String get caracteristicaCreateQuery {
    return """
   
CREATE TABLE caracteristica ( 
	id                   INTEGER NOT NULL  PRIMARY KEY  ,
	nome                 VARCHAR(255)     ,
	id_produto           INTEGER     ,
	FOREIGN KEY ( id_produto ) REFERENCES produto( id ) ON DELETE CASCADE ON UPDATE CASCADE
 );

    """;
  }

  static String get clienteCreateQuery {
    return """
CREATE TABLE cliente ( 
	id                   INTEGER NOT NULL  PRIMARY KEY  ,
	nome                 VARCHAR(255)     ,
	telefone             VARCHAR(20)     ,
	email                VARCHAR(255)     ,
	PRIMARY KEY("id"),
	UNIQUE("id")
 );
    """;
  }

  static String get pagamentoCreateQuery {
    return """

CREATE TABLE pagamento ( 
	id                   INTEGER NOT NULL  PRIMARY KEY  ,
	tipo_de_pagamento    INTEGER     ,
	valor_pago           FLOAT(20)     ,
	id_pedido            INTEGER     ,
	FOREIGN KEY ( tipo_de_pagamento ) REFERENCES forma_de_pagamento( id )  ,
	FOREIGN KEY ( id_pedido ) REFERENCES pedido( id )  
 );

    """;
  }

  static String get valorCaracteristicaCreateQuery {
    return """

CREATE TABLE valor_caracteristica ( 
	id                   INTEGER NOT NULL  PRIMARY KEY  ,
	id_caracteristica    INTEGER     ,
	valor                VARCHAR(20)     ,
	FOREIGN KEY ( id_caracteristica ) REFERENCES caracteristica( id ) ON DELETE CASCADE ON UPDATE CASCADE
 );
    """;
  }

  static String get enderecoCreateQuery {
    return """
CREATE TABLE endereco ( 
	id                   INTEGER NOT NULL  PRIMARY KEY  ,
	bairro               VARCHAR(255)     ,
	logradouro           VARCHAR(255)     ,
	numero               VARCHAR(255)     ,
	cidade               VARCHAR(255)     ,
	estado               VARCHAR(255)     ,
	id_cliente           INTEGER     
 );

    """;
  }

  static String get formasDePagamentoDefault {
    return """
INSERT INTO "forma_de_pagamento" ("nome") VALUES ('PIX');
INSERT INTO "forma_de_pagamento" ("nome") VALUES ('DINHEIRO');
INSERT INTO "forma_de_pagamento" ("nome") VALUES ('CARTÃO DE CRÉDITO');
INSERT INTO "forma_de_pagamento" ("nome") VALUES ('CARTÃO DE DÉBITO');
""";
  }
}
