CREATE TABLE personalDB.dbo.IPDetails (
	Id int NOT NULL IDENTITY(1,1),
	City varchar(100) NULL,
	ContinentName varchar(50) NULL,
	CountryCode varchar(5) NULL,
	CountryName varchar(100) NULL,
	IPAddress varchar(50) NOT NULL,
	StateProv varchar(100) NULL,
	DateAdded smalldatetime DEFAULT (getdate()) NULL,
	CONSTRAINT pk_ipdetails PRIMARY KEY (Id)
);

CREATE TABLE personalDB.dbo.Languages (
	Id int NOT NULL,
	LanguageName varchar(30) NOT NULL,
	Abbreviation varchar(5) NOT NULL,
	CONSTRAINT pk_languages PRIMARY KEY (Id)
);

INSERT INTO personalDB.dbo.Languages (Id,LanguageName,Abbreviation) VALUES
	 (1,N'Português',N'ptBR'),
	 (2,N'English',N'enUS');

CREATE TABLE personalDB.dbo.Presentation (
	Id int NOT NULL,
	PresentationTitle varchar(100) NOT NULL,
	PresentationText varchar(1000) NOT NULL,
	LanguageId int NOT NULL,
	CONSTRAINT pk_presentation PRIMARY KEY (Id),
	CONSTRAINT fk_presentation_language FOREIGN KEY (LanguageId) REFERENCES personalDB.dbo.Languages(Id)
);

INSERT INTO personalDB.dbo.Presentation (Id,PresentationTitle,PresentationText,LanguageId) VALUES
	 (1,N'Um Pouco Sobre Mim',N'Nascido e criado no Rio de Janeiro, trabalhei em diversos projetos nessa cidade, tendo mudado posteriormente para São Paulo em 2013. Atualmente resido na região central e tenho conhecimento em algumas tecnologias como .Net Framework, .Net Core, NodeJS, Typescript e Angular.<br><br>
Profissional atuante nas áreas de desenvolvimento e manutenção de sistemas desde 1998. Possuo experiência em projetos que utilizam tecnologias Microsoft, Oracle, etc, prestando serviços de migração, desenvolvimento ou manutenção a empresas de diversos ramos (Seguros, Energia, Petróleo e Finance).',1),
	 (2,N'A Little About Myself',N'Born and raised in Rio de Janeiro, I worked on some important projects in that city, later moving to Sao Paulo in 2013. I currently live in Sao Paulo downtown and have knowledge in some technologies such as .Net Framework, .Net Core, NodeJS, Typescript and Angular. <br><br>
Professional working in software development and maintenance since 1998, I have experience in projects that use Microsoft technologies, Oracle, etc., providing migration, development or maintenance services to companies in different fields (Insurance, Energy, Oil and Finance).',2);

CREATE TABLE personalDB.dbo.Sections (
	Id int NOT NULL,
	SectionName varchar(50) NOT NULL,
	LanguageId int NOT NULL,
	CONSTRAINT pk_sections PRIMARY KEY (Id),
	CONSTRAINT fk_sections_languages FOREIGN KEY (LanguageId) REFERENCES personalDB.dbo.Languages(Id)
);

INSERT INTO personalDB.dbo.Sections (Id,SectionName,LanguageId) VALUES
	 (1,N'Itamar Ribeiro :: Desenvolvedor',1),
	 (2,N'Sobre Mim',1),
	 (3,N'Artigos',1),
	 (4,N'Contato',1),
	 (5,N'Itamar Ribeiro :: Developer',2),
	 (6,N'About Me',2),
	 (7,N'Articles',2),
	 (8,N'Contact',2);

CREATE TABLE personalDB.dbo.ContactFields (
	Id int NOT NULL,
	FieldName varchar(100) NOT NULL,
	FieldValue varchar(1000) NOT NULL,
	LanguageId int NOT NULL,
	CONSTRAINT pk_contactfields PRIMARY KEY (Id),
	CONSTRAINT fk_contactfields_language FOREIGN KEY (LanguageId) REFERENCES personalDB.dbo.Languages(Id)
);

INSERT INTO personalDB.dbo.ContactFields (Id,FieldName,FieldValue,LanguageId) VALUES
	 (1,N'page_title',N'Como posso ajudar?',1),
	 (2,N'page_subtitle',N'Você poderá entrar em contato para dúvidas ou contato profissional. Será um prazer atender.',1),
	 (3,N'contact_subtitle',N'Utilize qualquer um dos seguintes meios para contato:',1),
	 (4,N'page_title',N'How can I help?',2),
	 (5,N'page_subtitle',N'Get in touch for questions or professional contact, I''ll be pleased to make your acquaintance.',2),
	 (6,N'contact_subtitle',N'You can use reach me through the following medias:',2);
