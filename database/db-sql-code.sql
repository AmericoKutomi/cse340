CREATE TABLE public.status_compromisso_agenda (
	idstatus_compromisso_agenda serial NOT NULL,
	titulo_status_compromisso varchar(50) NOT NULL,
	gera_pendencia integer NOT NULL,
	CONSTRAINT status_compromisso_agenda_pk PRIMARY KEY (idstatus_compromisso_agenda)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.tipo_compromisso_agenda (
	idtipo_compromisso_agenda serial NOT NULL,
	descricao_tipo_compromisso varchar(30) NOT NULL,
	cor_tipo_compromisso varchar(7) NOT NULL,
	classificacao_tipo_compromisso integer NOT NULL,
	CONSTRAINT tipo_compromisso_agenda_pk PRIMARY KEY (idtipo_compromisso_agenda)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.tipo_ocorrencia_compromisso (
	idtipo_ocorrencia_compromisso serial NOT NULL,
	descricao_tipo_ocorrencia varchar(50) NOT NULL,
	CONSTRAINT tipo_ocorrencia_compromisso_pk PRIMARY KEY (idtipo_ocorrencia_compromisso)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.paciente (
	idpaciente serial NOT NULL,
	unidade integer NOT NULL,
	nome_paciente varchar(50) NOT NULL,
	nome_social varchar(100) NOT NULL,
	data_nascimento DATE NOT NULL,
	cpf varchar(11) NOT NULL UNIQUE,
	numero_prontuario varchar(30) NOT NULL,
	status_navegacao integer NOT NULL,
	reside_com varchar(100) NOT NULL,
	nacionalidade integer NOT NULL,
	naturalidade_uf integer NOT NULL,
	naturalidade_cidade integer NOT NULL,
	procedencia_uf integer NOT NULL,
	procedencia_cidade integer NOT NULL,
	estado_civil integer NOT NULL,
	genero integer NOT NULL,
	endereco_logradouro varchar(50) NOT NULL,
	endereco_numero varchar(10) NOT NULL,
	endereco_complemento varchar(30) NOT NULL,
	endereco_bairro varchar(30) NOT NULL,
	endereco_cidade integer NOT NULL,
	endereco_uf integer NOT NULL,
	endereco_cep varchar(9) NOT NULL,
	email varchar(255) NOT NULL,
	tem_filhos integer NOT NULL,
	quantos_filhos integer NOT NULL,
	idades_filhos varchar(50) NOT NULL,
	escolaridade integer NOT NULL,
	ocupacao integer NOT NULL,
	aprendizado_visual integer NOT NULL,
	aprendizado_auditivo integer NOT NULL,
	aprendizado_verbal integer NOT NULL,
	aprendizado_fisico integer NOT NULL,
	aprendizado_logico integer NOT NULL,
	aprendizado_em_grupo integer NOT NULL,
	aprendizado_sozinho integer NOT NULL,
	paciente_ativado integer NOT NULL,
	suporte_emocional_navegador integer NOT NULL,
	principal_fonte_pagadora integer NOT NULL,
	sem_comorbidade integer NOT NULL,
	inicio_tratamento DATE NOT NULL,
	plano_quimioterapia integer NOT NULL,
	plano_radioterapia integer NOT NULL,
	plano_cirurgico integer NOT NULL,
	sem_medicacoes_em_uso integer NOT NULL,
	enfermeiro_navegador integer NOT NULL,
	assistente_navegador integer,
	CONSTRAINT paciente_pk PRIMARY KEY (idpaciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.categoria_profissional (
	idcategoria_profissional serial NOT NULL,
	nome_categoria varchar(50) NOT NULL,
	CONSTRAINT categoria_profissional_pk PRIMARY KEY (idcategoria_profissional)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.especialidade_categoria_profissional (
	idespecialidade_categoria_profissional serial NOT NULL,
	nome_especialidade varchar(50) NOT NULL,
	categoria_profissional integer NOT NULL,
	CONSTRAINT especialidade_categoria_profissional_pk PRIMARY KEY (idespecialidade_categoria_profissional)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.cliente (
	idcliente serial NOT NULL,
	nome_fantasia varchar(30) NOT NULL,
	ativo integer NOT NULL,
	data_cadastro DATE NOT NULL,
	CONSTRAINT cliente_pk PRIMARY KEY (idcliente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.empresa_cliente (
	idempresa_cliente serial NOT NULL,
	idcliente integer NOT NULL,
	nome_fantasia varchar(30) NOT NULL,
	razao_social varchar(150) NOT NULL,
	cnpj varchar(14) NOT NULL,
	endereco_logradouro varchar(50) NOT NULL,
	endereco_numero varchar(10) NOT NULL,
	endereco_complemento varchar(30) NOT NULL,
	endereco_bairro varchar(30) NOT NULL,
	endereco_cidade integer NOT NULL,
	endereco_uf integer NOT NULL,
	cep varchar(9) NOT NULL,
	ativo integer NOT NULL,
	data_criacao DATE NOT NULL,
	CONSTRAINT empresa_cliente_pk PRIMARY KEY (idempresa_cliente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.localidade (
	idlocalidade serial NOT NULL,
	codigo_municipio varchar(7) NOT NULL,
	nome_localidade varchar(30) NOT NULL,
	CONSTRAINT localidade_pk PRIMARY KEY (idlocalidade)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.unidade_federacao (
	idunidade_federacao serial NOT NULL,
	codigo_uf varchar(2) NOT NULL UNIQUE,
	nome_uf varchar(30) NOT NULL,
	CONSTRAINT unidade_federacao_pk PRIMARY KEY (idunidade_federacao)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.unidade_empresa_cliente (
	idunidade_empresa_cliente serial NOT NULL,
	nome_unidade varchar(30) NOT NULL,
	idempresa_cliente integer NOT NULL,
	ativo integer NOT NULL,
	data_criacao DATE NOT NULL,
	CONSTRAINT unidade_empresa_cliente_pk PRIMARY KEY (idunidade_empresa_cliente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.usuario (
	idusuario serial NOT NULL,
	nome_usuario varchar(50) NOT NULL,
	cpf char(11) NOT NULL,
	email varchar(255) NOT NULL,
	telefone varchar(20) NOT NULL,
	categoria_profissional integer NOT NULL,
	ativo integer NOT NULL,
	data_criacao DATE NOT NULL,
	data_alteracao DATE NOT NULL,
	CONSTRAINT usuario_pk PRIMARY KEY (idusuario)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.usuario_admin_cliente (
	idusuario_admin_cliente serial NOT NULL,
	idusuario integer NOT NULL,
	idcliente integer NOT NULL,
	ativo integer NOT NULL,
	CONSTRAINT usuario_admin_cliente_pk PRIMARY KEY (idusuario_admin_cliente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.nacionalidade (
	idnacionalidade serial NOT NULL,
	codigo_sus varchar(2) NOT NULL,
	nome_nacionalidade varchar(30) NOT NULL,
	CONSTRAINT nacionalidade_pk PRIMARY KEY (idnacionalidade)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.estado_civil (
	idestado_civil serial NOT NULL,
	nome_estado_civil varchar(50) NOT NULL,
	CONSTRAINT estado_civil_pk PRIMARY KEY (idestado_civil)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.escolaridade (
	idescolaridade serial NOT NULL,
	descricao varchar(30) NOT NULL,
	grau_instrucao integer NOT NULL,
	nivel_escolaridade integer,
	CONSTRAINT escolaridade_pk PRIMARY KEY (idescolaridade)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.ocupacao (
	idocupacao serial NOT NULL,
	titulo_ocupacao varchar(100) NOT NULL UNIQUE,
	cbo_2002 varchar(7) NOT NULL,
	tipo_cbo varchar(10) NOT NULL,
	CONSTRAINT ocupacao_pk PRIMARY KEY (idocupacao)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.operadora_plano_saude (
	idoperadora_plano_saude serial NOT NULL,
	codigo_operadora varchar(6) NOT NULL UNIQUE,
	nome_operadora varchar(100) NOT NULL,
	ativo integer NOT NULL,
	CONSTRAINT operadora_plano_saude_pk PRIMARY KEY (idoperadora_plano_saude)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.comorbidade (
	idcomorbidade serial NOT NULL,
	codigo_comorbidade varchar(5) NOT NULL UNIQUE,
	descricao varchar(150) NOT NULL,
	codigos_cid10 varchar(255) NOT NULL,
	CONSTRAINT comorbidade_pk PRIMARY KEY (idcomorbidade)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.categoria_subcategoria_diagnostico (
	idcategoria_subcategoria_diagnostico serial NOT NULL,
	cid varchar(5) NOT NULL UNIQUE,
	nome_categoria varchar(255) NOT NULL,
	CONSTRAINT categoria_subcategoria_diagnostico_pk PRIMARY KEY (idcategoria_subcategoria_diagnostico)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.grupo_diagnostico (
	idgrupo_diagnostico serial NOT NULL,
	categoria_inicial integer NOT NULL,
	categoria_final integer NOT NULL,
	nome_grupo varchar(255) NOT NULL,
	CONSTRAINT grupo_diagnostico_pk PRIMARY KEY (idgrupo_diagnostico)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.estadiamento (
	idestadiamento serial NOT NULL,
	numero_estadio varchar(10) NOT NULL,
	definicao_estadio varchar(255) NOT NULL,
	CONSTRAINT estadiamento_pk PRIMARY KEY (idestadiamento)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.tipo_barreira (
	idtipo_barreira serial NOT NULL,
	nome_tipo_barreira varchar(20) NOT NULL,
	descricao_tipo_barreira varchar(100) NOT NULL,
	CONSTRAINT tipo_barreira_pk PRIMARY KEY (idtipo_barreira)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.barreira (
	idbarreira serial NOT NULL,
	tipo_barreira integer NOT NULL,
	descricao_barreira varchar(255) NOT NULL,
	CONSTRAINT barreira_pk PRIMARY KEY (idbarreira)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.status_acao (
	idstatus_acao serial NOT NULL,
	descricao_status_acao varchar(20) NOT NULL,
	CONSTRAINT status_acao_pk PRIMARY KEY (idstatus_acao)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.motivo_encerramento_navegacao (
	idmotivo_encerramento_navegacao serial NOT NULL,
	descricao_motivo varchar(100) NOT NULL,
	CONSTRAINT motivo_encerramento_navegacao_pk PRIMARY KEY (idmotivo_encerramento_navegacao)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.classificacao_tipo_compromisso (
	idclassificacao_tipo_compromisso serial NOT NULL,
	descricao_classificacao_tipo varchar(20) NOT NULL,
	CONSTRAINT classificacao_tipo_compromisso_pk PRIMARY KEY (idclassificacao_tipo_compromisso)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.ecog (
	idecog integer NOT NULL,
	descricao varchar(255) NOT NULL,
	CONSTRAINT ecog_pk PRIMARY KEY (idecog)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.protocolo_oncologico (
	idprotocolo_oncologico serial NOT NULL,
	nome_protocolo varchar(255) NOT NULL,
	elegibilidade_protocolo varchar(255) NOT NULL,
	estadios varchar(50) NOT NULL,
	grupo_diagnostico integer NOT NULL,
	conteudo bytea NOT NULL,
	cliente integer,
	CONSTRAINT protocolo_oncologico_pk PRIMARY KEY (idprotocolo_oncologico)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.eann_categoria (
	ideann_categoria serial NOT NULL,
	descricao varchar(255) NOT NULL,
	CONSTRAINT eann_categoria_pk PRIMARY KEY (ideann_categoria)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.eann_questionamento (
	ideann_questionamento serial NOT NULL,
	categoria integer NOT NULL,
	questionamento_chave varchar(255) NOT NULL,
	ordem integer NOT NULL,
	CONSTRAINT eann_questionamento_pk PRIMARY KEY (ideann_questionamento)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.eann_criterio (
	ideann_criterio serial NOT NULL,
	descricao_criterio varchar(255) NOT NULL,
	pontuacao integer NOT NULL,
	categoria integer NOT NULL,
	CONSTRAINT eann_criterio_pk PRIMARY KEY (ideann_criterio)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.eann_pontuacao (
	ideann_pontuacao serial NOT NULL,
	descricao_resultado varchar(50) NOT NULL,
	pontuacao_minima integer NOT NULL,
	pontuacao_maxima integer NOT NULL,
	nivel_navegacao_eann varchar(1) NOT NULL,
	CONSTRAINT eann_pontuacao_pk PRIMARY KEY (ideann_pontuacao)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.perfil_usuario (
	idperfil_usuario serial NOT NULL,
	descricao_perfil varchar NOT NULL,
	CONSTRAINT perfil_usuario_pk PRIMARY KEY (idperfil_usuario)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.acesso_usuario (
	idacesso_usuario serial NOT NULL,
	usuario integer NOT NULL,
	perfil integer NOT NULL,
	unidade integer NOT NULL,
	ativo integer NOT NULL,
	CONSTRAINT acesso_usuario_pk PRIMARY KEY (idacesso_usuario)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.status_navegacao_paciente (
	idstatus_navegacao_paciente serial NOT NULL,
	descricao_status varchar(50) NOT NULL,
	CONSTRAINT status_navegacao_paciente_pk PRIMARY KEY (idstatus_navegacao_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.tipo_aplicacao_chatbox (
	idtipo_aplicacao_chatbox serial NOT NULL,
	descricao_tipo_aplicacao varchar(30) NOT NULL,
	CONSTRAINT tipo_aplicacao_chatbox_pk PRIMARY KEY (idtipo_aplicacao_chatbox)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.roteiro_chatbox (
	idroteiro_chatbox serial NOT NULL,
	tipo_aplicacao integer NOT NULL,
	roteiro bytea NOT NULL,
	CONSTRAINT roteiro_chatbox_pk PRIMARY KEY (idroteiro_chatbox)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.roteiro_tipo_compromisso (
	idroteiro_tipo_compromisso serial NOT NULL,
	tipo_compromisso integer NOT NULL,
	roteiro_chatbox integer NOT NULL,
	ativo integer NOT NULL,
	CONSTRAINT roteiro_tipo_compromisso_pk PRIMARY KEY (idroteiro_tipo_compromisso)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.grupo_navegacao_pacientes (
	idgrupo_navegacao_pacientes serial NOT NULL,
	nome_grupo varchar(30) NOT NULL,
	unidade integer NOT NULL,
	CONSTRAINT grupo_navegacao_pacientes_pk PRIMARY KEY (idgrupo_navegacao_pacientes)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.membro_grupo_navegacao (
	idmembro_grupo_navegacao serial NOT NULL,
	grupo_navegacao integer NOT NULL,
	usuario_perfil integer NOT NULL,
	CONSTRAINT membro_grupo_navegacao_pk PRIMARY KEY (idmembro_grupo_navegacao)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.grupo_diagnostico_grupo_navegacao (
	idgrupo_diagnostico_grupo_navegacao serial NOT NULL,
	grupo_navegacao integer NOT NULL,
	grupo_diagnostico integer NOT NULL,
	tem_selecao_diagnostico integer NOT NULL,
	CONSTRAINT grupo_diagnostico_grupo_navegacao_pk PRIMARY KEY (idgrupo_diagnostico_grupo_navegacao)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.diagnostico_grupo_navegacao (
	iddiagnostico_grupo_navegacao serial NOT NULL,
	grupo_diagnostico integer NOT NULL,
	diagnostico integer NOT NULL,
	CONSTRAINT diagnostico_grupo_navegacao_pk PRIMARY KEY (iddiagnostico_grupo_navegacao)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.criterio_elegibilidade_navegacao (
	idcriterio_elegibilidade_navegacao serial NOT NULL,
	unidade integer NOT NULL,
	criterio_principal integer NOT NULL,
	criterios_excecao bytea NOT NULL,
	CONSTRAINT criterio_elegibilidade_navegacao_pk PRIMARY KEY (idcriterio_elegibilidade_navegacao)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.recurso_educacional (
	idrecurso_educacional serial NOT NULL,
	titulo_recurso varchar(100) NOT NULL,
	tipo_recurso integer NOT NULL,
	website varchar(255) NOT NULL,
	nome_arquivo varchar(255) NOT NULL,
	nome_aplicativo varchar(255) NOT NULL,
	grupo_diagnostico integer,
	cliente integer,
	CONSTRAINT recurso_educacional_pk PRIMARY KEY (idrecurso_educacional)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.tipo_recurso_educacional (
	idtipo_recurso_educacional serial NOT NULL,
	descricao_tipo_recurso varchar(50) NOT NULL,
	CONSTRAINT tipo_recurso_educacional_pk PRIMARY KEY (idtipo_recurso_educacional)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.telefone_paciente (
	idtelefone_paciente serial NOT NULL,
	paciente integer NOT NULL,
	telefone varchar(30) NOT NULL,
	whatsapp integer NOT NULL,
	CONSTRAINT telefone_paciente_pk PRIMARY KEY (idtelefone_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.genero (
	idgenero serial NOT NULL,
	descricao varchar(20) NOT NULL,
	CONSTRAINT genero_pk PRIMARY KEY (idgenero)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.relacao_com_paciente (
	idrelacao_com_paciente serial NOT NULL,
	descricao_relacao varchar(30) NOT NULL,
	CONSTRAINT relacao_com_paciente_pk PRIMARY KEY (idrelacao_com_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.contatos_paciente (
	idcontatos_paciente serial NOT NULL,
	paciente integer NOT NULL,
	contato_emergência integer NOT NULL,
	contato_apoio integer NOT NULL,
	nome_contato varchar(50) NOT NULL,
	telefone varchar(20) NOT NULL,
	whatsapp integer NOT NULL,
	email varchar(255) NOT NULL,
	relacao_paciente integer NOT NULL,
	CONSTRAINT contatos_paciente_pk PRIMARY KEY (idcontatos_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.convenio_medico_paciente (
	idconvenio_medico_paciente serial NOT NULL,
	paciente integer NOT NULL,
	operadora_saude integer NOT NULL,
	plano_saude varchar(50) NOT NULL,
	CONSTRAINT convenio_medico_paciente_pk PRIMARY KEY (idconvenio_medico_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.comorbidade_paciente (
	idcomorbidade_paciente serial NOT NULL,
	paciente integer NOT NULL,
	comorbidade integer NOT NULL,
	CONSTRAINT comorbidade_paciente_pk PRIMARY KEY (idcomorbidade_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.medicamento_em_uso_paciente (
	idmedicamento_em_uso_paciente serial NOT NULL,
	paciente integer NOT NULL,
	em_uso integer NOT NULL,
	medicamento integer NOT NULL,
	dose varchar(50) NOT NULL,
	frequencia varchar(50) NOT NULL,
	motivo_suspensao varchar(255),
	CONSTRAINT medicamento_em_uso_paciente_pk PRIMARY KEY (idmedicamento_em_uso_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.grupo_navegacao_paciente (
	idgrupo_navegacao_paciente serial NOT NULL,
	paciente integer NOT NULL,
	grupo_navegacao integer NOT NULL,
	medico_responsavel integer,
	CONSTRAINT grupo_navegacao_paciente_pk PRIMARY KEY (idgrupo_navegacao_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.equipe_multi_paciente (
	idequipe_multi_paciente serial NOT NULL,
	paciente integer NOT NULL,
	categoria integer NOT NULL,
	especialidade integer,
	frequencia_acompanhamento integer NOT NULL,
	CONSTRAINT equipe_multi_paciente_pk PRIMARY KEY (idequipe_multi_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.frequencia_acompanhamento (
	idfrequencia_acompanhamento serial NOT NULL,
	descricao varchar(20) NOT NULL,
	CONSTRAINT frequencia_acompanhamento_pk PRIMARY KEY (idfrequencia_acompanhamento)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.nota_reuniao_medica_paciente (
	idnota_reuniao_medica_paciente serial NOT NULL,
	paciente integer NOT NULL,
	motivo_reuniao varchar(255),
	participantes varchar(255),
	anotacao varchar(255) NOT NULL,
	CONSTRAINT nota_reuniao_medica_paciente_pk PRIMARY KEY (idnota_reuniao_medica_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.acao_nota_reuniao_medica_paciente (
	idacao_nota_reuniao_medica_paciente serial NOT NULL,
	nota_reuniao_medica_paciente integer NOT NULL,
	data_registro DATE NOT NULL,
	descricao_acao varchar(255) NOT NULL,
	data_acao DATE NOT NULL,
	status_acao integer NOT NULL,
	CONSTRAINT acao_nota_reuniao_medica_paciente_pk PRIMARY KEY (idacao_nota_reuniao_medica_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.objetivo_pessoal_paciente (
	idobjetivo_pessoal_paciente serial NOT NULL,
	paciente integer NOT NULL,
	descricao_objetivo varchar(255) NOT NULL,
	CONSTRAINT objetivo_pessoal_paciente_pk PRIMARY KEY (idobjetivo_pessoal_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.meta_pessoal_paciente (
	idmeta_pessoal_paciente serial NOT NULL,
	objetivo_pessoal integer NOT NULL,
	descricao_meta varchar(255) NOT NULL,
	CONSTRAINT meta_pessoal_paciente_pk PRIMARY KEY (idmeta_pessoal_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.acao_meta_pessoal_paciente (
	idacao_meta_pessoal_paciente serial NOT NULL,
	meta_pessoal integer NOT NULL,
	data_registro DATE NOT NULL,
	descricao_acao varchar(255) NOT NULL,
	data_acao DATE NOT NULL,
	status_acao integer NOT NULL,
	CONSTRAINT acao_meta_pessoal_paciente_pk PRIMARY KEY (idacao_meta_pessoal_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.anotacao_atendimento_paciente (
	idanotacao_atendimento_paciente serial NOT NULL,
	paciente integer NOT NULL,
	data_hora TIMESTAMP NOT NULL,
	origem_contato integer NOT NULL,
	meio_comunicacao integer NOT NULL,
	queixa_sintoma integer NOT NULL,
	duvida_preparo integer NOT NULL,
	relato_barreira integer NOT NULL,
	ocorrencia_toxicidade integer NOT NULL,
	duvida_tratamento integer NOT NULL,
	outro_motivo integer NOT NULL,
	descricao_outro_motivo varchar(20) NOT NULL,
	anotacao_atendimento varchar(255) NOT NULL,
	CONSTRAINT anotacao_atendimento_paciente_pk PRIMARY KEY (idanotacao_atendimento_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.acao_anotacao_atendimento_paciente (
	idacao_anotacao_atendimento_paciente serial NOT NULL,
	anotacao_atendimento_paciente integer NOT NULL,
	data_registro DATE NOT NULL,
	descricao_acao varchar(255) NOT NULL,
	data_acao DATE NOT NULL,
	status_acao integer NOT NULL,
	CONSTRAINT acao_anotacao_atendimento_paciente_pk PRIMARY KEY (idacao_anotacao_atendimento_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.recurso_educacional_paciente (
	idrecurso_educacional_paciente serial NOT NULL,
	paciente integer NOT NULL,
	recurso_educacional integer NOT NULL,
	CONSTRAINT recurso_educacional_paciente_pk PRIMARY KEY (idrecurso_educacional_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.barreira_paciente (
	idbarreira_paciente serial NOT NULL,
	paciente integer NOT NULL,
	barreira integer NOT NULL,
	data_registro DATE NOT NULL,
	CONSTRAINT barreira_paciente_pk PRIMARY KEY (idbarreira_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.medicamento (
	idmedicamento serial NOT NULL,
	nome_medicamento varchar(100) NOT NULL,
	associacao varchar(255) NOT NULL,
	dose varchar(255) NOT NULL,
	CONSTRAINT medicamento_pk PRIMARY KEY (idmedicamento)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.diagnostico_oncologico_paciente (
	iddiagnostico_oncologico_paciente serial NOT NULL,
	paciente integer NOT NULL,
	diagnostico integer NOT NULL,
	tempo_de_diagnostico integer NOT NULL,
	anos_ou_meses integer NOT NULL,
	estadiamento integer NOT NULL,
	estagio varchar(10) NOT NULL,
	CONSTRAINT diagnostico_oncologico_paciente_pk PRIMARY KEY (iddiagnostico_oncologico_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.protocolo_tratamento_paciente (
	idprotocolo_tratamento_paciente serial NOT NULL,
	paciente integer NOT NULL,
	protocolo integer NOT NULL,
	data_inicio DATE,
	data_termino DATE,
	status_protocolo integer NOT NULL,
	conteudo bytea NOT NULL,
	CONSTRAINT protocolo_tratamento_paciente_pk PRIMARY KEY (idprotocolo_tratamento_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.status_protocolo_tratamento (
	idstatus_protocolo_tratamento serial NOT NULL,
	descrição integer NOT NULL,
	CONSTRAINT status_protocolo_tratamento_pk PRIMARY KEY (idstatus_protocolo_tratamento)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.procedimento_medico (
	idprocedimento_medico serial NOT NULL,
	codigo_grupo varchar(10) NOT NULL,
	codigo_tuss varchar(10),
	descricao varchar(255) NOT NULL,
	CONSTRAINT procedimento_medico_pk PRIMARY KEY (idprocedimento_medico)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.cirurgia_procedimento_paciente (
	idcirurgia_procedimento_paciente serial NOT NULL,
	paciente integer NOT NULL,
	procedimento_medico integer NOT NULL,
	tempo_procedimento integer NOT NULL,
	anos_ou_meses integer NOT NULL,
	data_procedimento DATE NOT NULL,
	CONSTRAINT cirurgia_procedimento_paciente_pk PRIMARY KEY (idcirurgia_procedimento_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.sinal_sintoma (
	idsinal_sintoma serial NOT NULL,
	descricao_sinal varchar(255) NOT NULL,
	CONSTRAINT sinal_sintoma_pk PRIMARY KEY (idsinal_sintoma)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.sinal_sintoma_paciente (
	idsinal_sintoma_paciente serial NOT NULL,
	paciente integer NOT NULL,
	sinal_sintoma integer NOT NULL,
	data_registro DATE NOT NULL,
	observacao varchar(255) NOT NULL,
	CONSTRAINT sinal_sintoma_paciente_pk PRIMARY KEY (idsinal_sintoma_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.acao_sinal_sintoma_paciente (
	idacao_sinal_sintoma_paciente serial NOT NULL,
	sinal_sintoma_paciente integer NOT NULL,
	data_registro DATE NOT NULL,
	descricao_acao varchar(255) NOT NULL,
	data_acao DATE NOT NULL,
	status_acao integer NOT NULL,
	CONSTRAINT acao_sinal_sintoma_paciente_pk PRIMARY KEY (idacao_sinal_sintoma_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.acao_barreira_paciente (
	idacao_barreira_paciente serial NOT NULL,
	barreira_paciente integer NOT NULL,
	data_registro DATE NOT NULL,
	descricao_acao varchar(255) NOT NULL,
	data_acao DATE NOT NULL,
	status_acao integer NOT NULL,
	resultado_esperado varchar(100) NOT NULL,
	profissional_acionado varchar(100) NOT NULL,
	estrategia_acao varchar(255) NOT NULL,
	navegador integer NOT NULL,
	CONSTRAINT acao_barreira_paciente_pk PRIMARY KEY (idacao_barreira_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.pre_cadastro_paciente (
	idpre_cadastro_paciente serial NOT NULL,
	nome_paciente varchar(50) NOT NULL,
	status_pre_cadastrado integer NOT NULL,
	cpf varchar(11) NOT NULL,
	telefone varchar(30) NOT NULL,
	diagnostico_principal integer NOT NULL,
	grupo_diagnostico integer NOT NULL,
	medico_responsavel integer NOT NULL,
	enfermeiro_responsavel integer NOT NULL,
	CONSTRAINT pre_cadastro_paciente_pk PRIMARY KEY (idpre_cadastro_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.admissao_paciente (
	idadmissao_paciente serial NOT NULL,
	paciente integer NOT NULL,
	data_admissao DATE NOT NULL,
	usuario_admissao integer NOT NULL,
	dados_admissao bytea NOT NULL,
	CONSTRAINT admissao_paciente_pk PRIMARY KEY (idadmissao_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.suporte_emocional_paciente (
	idsuporte_emocional_paciente serial NOT NULL,
	paciente integer NOT NULL,
	data_suporte DATE NOT NULL,
	obs_suporte_emocional varchar(255) NOT NULL,
	CONSTRAINT suporte_emocional_paciente_pk PRIMARY KEY (idsuporte_emocional_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.pta_paciente (
	idpta_paciente serial NOT NULL,
	paciente integer NOT NULL,
	data_planejar DATE NOT NULL,
	data_avaliar DATE NOT NULL,
	CONSTRAINT pta_paciente_pk PRIMARY KEY (idpta_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.pta_planejar_paciente (
	idpta_planejar_paciente serial NOT NULL,
	pta_paciente integer NOT NULL,
	data_planejamento DATE NOT NULL,
	problema_fonte_pagadora integer NOT NULL,
	acao_com_fonte_pagadora varchar(255) NOT NULL,
	CONSTRAINT pta_planejar_paciente_pk PRIMARY KEY (idpta_planejar_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.pta_avaliar_paciente (
	idpta_avaliar_paciente serial NOT NULL,
	pta_paciente integer NOT NULL,
	data_avaliacao DATE NOT NULL,
	encerramento_recomendado integer NOT NULL,
	encerramento_medico_ciente integer,
	encerramento_data_ciencia_medico DATE,
	CONSTRAINT pta_avaliar_paciente_pk PRIMARY KEY (idpta_avaliar_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.encerramento_navegacao_paciente (
	idencerramento_navegacao_paciente serial NOT NULL,
	pta_avaliar_paciente integer NOT NULL,
	data_encerramento DATE NOT NULL,
	motivo_encerramento_navegacao integer NOT NULL,
	observacao varchar(25) NOT NULL,
	readmitido integer NOT NULL,
	data_readmissão DATE NOT NULL,
	status_navegacao_readmissao integer NOT NULL,
	motivo_readmissao varchar(255) NOT NULL,
	CONSTRAINT encerramento_navegacao_paciente_pk PRIMARY KEY (idencerramento_navegacao_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.ecog_paciente (
	idecog_paciente serial NOT NULL,
	paciente integer NOT NULL,
	data_ecog DATE NOT NULL,
	ecog integer NOT NULL,
	CONSTRAINT ecog_paciente_pk PRIMARY KEY (idecog_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.compromisso_agenda_paciente (
	idcompromisso_agenda_paciente serial NOT NULL,
	paciente integer NOT NULL,
	data_hora TIMESTAMP NOT NULL,
	tipo_compromisso integer NOT NULL,
	status_compromisso integer NOT NULL,
	descricao_compromisso varchar(255) NOT NULL,
	protocolo_tratamento_paciente integer,
	item_protocolo varchar,
	status_item_protocolo integer,
	CONSTRAINT compromisso_agenda_paciente_pk PRIMARY KEY (idcompromisso_agenda_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.ocorrencia_compromisso_agenda_paciente (
	idocorrencia_compromisso_agenda_paciente serial NOT NULL,
	compromisso_agenda_paciente integer NOT NULL,
	data_hora TIMESTAMP NOT NULL,
	tipo_ocorrencia_compromisso integer NOT NULL,
	descricao_ocorrencia varchar(255) NOT NULL,
	CONSTRAINT ocorrencia_compromisso_agenda_paciente_pk PRIMARY KEY (idocorrencia_compromisso_agenda_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.status_item_protocolo (
	idstatus_item_protocolo serial NOT NULL,
	descricao_status_item_protocolo varchar(255) NOT NULL,
	CONSTRAINT status_item_protocolo_pk PRIMARY KEY (idstatus_item_protocolo)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.manutencao_navegacao_paciente (
	idmanutencao_navegacao_paciente serial NOT NULL,
	paciente integer NOT NULL,
	data_avaliacao DATE NOT NULL,
	status_anterior integer NOT NULL,
	novo_status integer NOT NULL,
	observacao varchar(255) NOT NULL,
	CONSTRAINT manutencao_navegacao_paciente_pk PRIMARY KEY (idmanutencao_navegacao_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.item_menu_sistema (
	iditem_menu_sistema serial NOT NULL,
	titulo_item_menu_sistema varchar(50) NOT NULL,
	ativo integer NOT NULL,
	referencia varchar(100) NOT NULL,
	CONSTRAINT item_menu_sistema_pk PRIMARY KEY (iditem_menu_sistema)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.perfil_usuario_item_menu (
	idperfil_usuario_item_menu serial NOT NULL,
	perfil_usuario integer NOT NULL,
	item_menu_sistema integer NOT NULL,
	item_menu_superior integer NOT NULL,
	CONSTRAINT perfil_usuario_item_menu_pk PRIMARY KEY (idperfil_usuario_item_menu)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.resultado_exame_paciente (
	idresultado_exame_paciente serial NOT NULL,
	paciente integer NOT NULL,
	data_exame DATE NOT NULL,
	nome_exame varchar(255) NOT NULL,
	observacao varchar(255) NOT NULL,
	local_armazenamento varchar(255) NOT NULL,
	tipo_exame integer NOT NULL,
	compromisso_agenda integer,
	CONSTRAINT resultado_exame_paciente_pk PRIMARY KEY (idresultado_exame_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.item_protocolo_item_tratamento (
	idtem_protocolo_item_tratamento serial NOT NULL,
	paciente integer NOT NULL,
	protocolo_tratamento_paciente integer,
	item_protocolo_chave varchar,
	item_protocolo_valor integer NOT NULL,
	descricao_item_tratamento varchar(255) NOT NULL,
	data_hora TIMESTAMP NOT NULL,
	status_item_tratamento integer,
	CONSTRAINT item_protocolo_item_tratamento_pk PRIMARY KEY (idtem_protocolo_item_tratamento)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.intervencao_protocolo_paciente (
	idintervencao_protocolo_paciente serial NOT NULL,
	protocolo_tratamento_paciete integer NOT NULL,
	intervencao_realizada varchar(255) NOT NULL,
	causa_intervencao varchar(255) NOT NULL,
	data_intervencao DATE NOT NULL,
	usuario integer NOT NULL,
	CONSTRAINT intervencao_protocolo_paciente_pk PRIMARY KEY (idintervencao_protocolo_paciente)
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.historico_acao_barreira_paciente (
	idhistorico_acao_barreira_paciente serial NOT NULL,
	acao_barreira_paciente integer NOT NULL,
	data_historico DATE NOT NULL,
	descricao_historico varchar(255) NOT NULL,
	proxima_data DATE NOT NULL,
	CONSTRAINT historico_acao_barreira_paciente_pk PRIMARY KEY (idhistorico_acao_barreira_paciente)
) WITH (
  OIDS=FALSE
);




ALTER TABLE tipo_compromisso_agenda ADD CONSTRAINT tipo_compromisso_agenda_fk0 FOREIGN KEY (classificacao_tipo_compromisso) REFERENCES classificacao_tipo_compromisso(idclassificacao_tipo_compromisso);


ALTER TABLE paciente ADD CONSTRAINT paciente_fk0 FOREIGN KEY (unidade) REFERENCES unidade_empresa_cliente(idunidade_empresa_cliente);
ALTER TABLE paciente ADD CONSTRAINT paciente_fk1 FOREIGN KEY (status_navegacao) REFERENCES status_navegacao_paciente(idstatus_navegacao_paciente);
ALTER TABLE paciente ADD CONSTRAINT paciente_fk2 FOREIGN KEY (nacionalidade) REFERENCES nacionalidade(idnacionalidade);
ALTER TABLE paciente ADD CONSTRAINT paciente_fk3 FOREIGN KEY (naturalidade_uf) REFERENCES unidade_federacao(idunidade_federacao);
ALTER TABLE paciente ADD CONSTRAINT paciente_fk4 FOREIGN KEY (naturalidade_cidade) REFERENCES localidade(idlocalidade);
ALTER TABLE paciente ADD CONSTRAINT paciente_fk5 FOREIGN KEY (procedencia_uf) REFERENCES unidade_federacao(idunidade_federacao);
ALTER TABLE paciente ADD CONSTRAINT paciente_fk6 FOREIGN KEY (procedencia_cidade) REFERENCES localidade(idlocalidade);
ALTER TABLE paciente ADD CONSTRAINT paciente_fk7 FOREIGN KEY (estado_civil) REFERENCES estado_civil(idestado_civil);
ALTER TABLE paciente ADD CONSTRAINT paciente_fk8 FOREIGN KEY (genero) REFERENCES genero(idgenero);
ALTER TABLE paciente ADD CONSTRAINT paciente_fk9 FOREIGN KEY (endereco_cidade) REFERENCES localidade(idlocalidade);
ALTER TABLE paciente ADD CONSTRAINT paciente_fk10 FOREIGN KEY (endereco_uf) REFERENCES unidade_federacao(idunidade_federacao);
ALTER TABLE paciente ADD CONSTRAINT paciente_fk11 FOREIGN KEY (escolaridade) REFERENCES escolaridade(idescolaridade);
ALTER TABLE paciente ADD CONSTRAINT paciente_fk12 FOREIGN KEY (ocupacao) REFERENCES ocupacao(idocupacao);
ALTER TABLE paciente ADD CONSTRAINT paciente_fk13 FOREIGN KEY (enfermeiro_navegador) REFERENCES membro_grupo_navegacao(idmembro_grupo_navegacao);
ALTER TABLE paciente ADD CONSTRAINT paciente_fk14 FOREIGN KEY (assistente_navegador) REFERENCES membro_grupo_navegacao(idmembro_grupo_navegacao);


ALTER TABLE especialidade_categoria_profissional ADD CONSTRAINT especialidade_categoria_profissional_fk0 FOREIGN KEY (categoria_profissional) REFERENCES categoria_profissional(idcategoria_profissional);


ALTER TABLE empresa_cliente ADD CONSTRAINT empresa_cliente_fk0 FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);
ALTER TABLE empresa_cliente ADD CONSTRAINT empresa_cliente_fk1 FOREIGN KEY (endereco_cidade) REFERENCES localidade(idlocalidade);
ALTER TABLE empresa_cliente ADD CONSTRAINT empresa_cliente_fk2 FOREIGN KEY (endereco_uf) REFERENCES unidade_federacao(idunidade_federacao);



ALTER TABLE unidade_empresa_cliente ADD CONSTRAINT unidade_empresa_cliente_fk0 FOREIGN KEY (idempresa_cliente) REFERENCES empresa_cliente(idempresa_cliente);

ALTER TABLE usuario ADD CONSTRAINT usuario_fk0 FOREIGN KEY (categoria_profissional) REFERENCES categoria_profissional(idcategoria_profissional);

ALTER TABLE usuario_admin_cliente ADD CONSTRAINT usuario_admin_cliente_fk0 FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);
ALTER TABLE usuario_admin_cliente ADD CONSTRAINT usuario_admin_cliente_fk1 FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);








ALTER TABLE grupo_diagnostico ADD CONSTRAINT grupo_diagnostico_fk0 FOREIGN KEY (categoria_inicial) REFERENCES categoria_subcategoria_diagnostico(idcategoria_subcategoria_diagnostico);
ALTER TABLE grupo_diagnostico ADD CONSTRAINT grupo_diagnostico_fk1 FOREIGN KEY (categoria_final) REFERENCES categoria_subcategoria_diagnostico(idcategoria_subcategoria_diagnostico);



ALTER TABLE barreira ADD CONSTRAINT barreira_fk0 FOREIGN KEY (tipo_barreira) REFERENCES tipo_barreira(idtipo_barreira);





ALTER TABLE protocolo_oncologico ADD CONSTRAINT protocolo_oncologico_fk0 FOREIGN KEY (grupo_diagnostico) REFERENCES grupo_diagnostico(idgrupo_diagnostico);
ALTER TABLE protocolo_oncologico ADD CONSTRAINT protocolo_oncologico_fk1 FOREIGN KEY (cliente) REFERENCES cliente(idcliente);


ALTER TABLE eann_questionamento ADD CONSTRAINT eann_questionamento_fk0 FOREIGN KEY (categoria) REFERENCES eann_categoria(ideann_categoria);

ALTER TABLE eann_criterio ADD CONSTRAINT eann_criterio_fk0 FOREIGN KEY (categoria) REFERENCES eann_categoria(ideann_categoria);



ALTER TABLE acesso_usuario ADD CONSTRAINT acesso_usuario_fk0 FOREIGN KEY (usuario) REFERENCES usuario(idusuario);
ALTER TABLE acesso_usuario ADD CONSTRAINT acesso_usuario_fk1 FOREIGN KEY (perfil) REFERENCES perfil_usuario(idperfil_usuario);
ALTER TABLE acesso_usuario ADD CONSTRAINT acesso_usuario_fk2 FOREIGN KEY (unidade) REFERENCES unidade_empresa_cliente(idunidade_empresa_cliente);



ALTER TABLE roteiro_chatbox ADD CONSTRAINT roteiro_chatbox_fk0 FOREIGN KEY (tipo_aplicacao) REFERENCES tipo_aplicacao_chatbox(idtipo_aplicacao_chatbox);

ALTER TABLE roteiro_tipo_compromisso ADD CONSTRAINT roteiro_tipo_compromisso_fk0 FOREIGN KEY (tipo_compromisso) REFERENCES tipo_compromisso_agenda(idtipo_compromisso_agenda);
ALTER TABLE roteiro_tipo_compromisso ADD CONSTRAINT roteiro_tipo_compromisso_fk1 FOREIGN KEY (roteiro_chatbox) REFERENCES roteiro_chatbox(idroteiro_chatbox);

ALTER TABLE grupo_navegacao_pacientes ADD CONSTRAINT grupo_navegacao_pacientes_fk0 FOREIGN KEY (unidade) REFERENCES unidade_empresa_cliente(idunidade_empresa_cliente);

ALTER TABLE membro_grupo_navegacao ADD CONSTRAINT membro_grupo_navegacao_fk0 FOREIGN KEY (grupo_navegacao) REFERENCES grupo_navegacao_pacientes(idgrupo_navegacao_pacientes);
ALTER TABLE membro_grupo_navegacao ADD CONSTRAINT membro_grupo_navegacao_fk1 FOREIGN KEY (usuario_perfil) REFERENCES acesso_usuario(idacesso_usuario);

ALTER TABLE grupo_diagnostico_grupo_navegacao ADD CONSTRAINT grupo_diagnostico_grupo_navegacao_fk0 FOREIGN KEY (grupo_navegacao) REFERENCES grupo_navegacao_pacientes(idgrupo_navegacao_pacientes);
ALTER TABLE grupo_diagnostico_grupo_navegacao ADD CONSTRAINT grupo_diagnostico_grupo_navegacao_fk1 FOREIGN KEY (grupo_diagnostico) REFERENCES grupo_diagnostico(idgrupo_diagnostico);

ALTER TABLE diagnostico_grupo_navegacao ADD CONSTRAINT diagnostico_grupo_navegacao_fk0 FOREIGN KEY (grupo_diagnostico) REFERENCES grupo_diagnostico_grupo_navegacao(idgrupo_diagnostico_grupo_navegacao);
ALTER TABLE diagnostico_grupo_navegacao ADD CONSTRAINT diagnostico_grupo_navegacao_fk1 FOREIGN KEY (diagnostico) REFERENCES categoria_subcategoria_diagnostico(idcategoria_subcategoria_diagnostico);

ALTER TABLE criterio_elegibilidade_navegacao ADD CONSTRAINT criterio_elegibilidade_navegacao_fk0 FOREIGN KEY (unidade) REFERENCES unidade_empresa_cliente(idunidade_empresa_cliente);

ALTER TABLE recurso_educacional ADD CONSTRAINT recurso_educacional_fk0 FOREIGN KEY (tipo_recurso) REFERENCES tipo_recurso_educacional(idtipo_recurso_educacional);
ALTER TABLE recurso_educacional ADD CONSTRAINT recurso_educacional_fk1 FOREIGN KEY (grupo_diagnostico) REFERENCES grupo_diagnostico(idgrupo_diagnostico);
ALTER TABLE recurso_educacional ADD CONSTRAINT recurso_educacional_fk2 FOREIGN KEY (cliente) REFERENCES cliente(idcliente);


ALTER TABLE telefone_paciente ADD CONSTRAINT telefone_paciente_fk0 FOREIGN KEY (paciente) REFERENCES paciente(idpaciente);



ALTER TABLE contatos_paciente ADD CONSTRAINT contatos_paciente_fk0 FOREIGN KEY (paciente) REFERENCES paciente(idpaciente);
ALTER TABLE contatos_paciente ADD CONSTRAINT contatos_paciente_fk1 FOREIGN KEY (relacao_paciente) REFERENCES relacao_com_paciente(idrelacao_com_paciente);

ALTER TABLE convenio_medico_paciente ADD CONSTRAINT convenio_medico_paciente_fk0 FOREIGN KEY (paciente) REFERENCES paciente(idpaciente);
ALTER TABLE convenio_medico_paciente ADD CONSTRAINT convenio_medico_paciente_fk1 FOREIGN KEY (operadora_saude) REFERENCES operadora_plano_saude(idoperadora_plano_saude);

ALTER TABLE comorbidade_paciente ADD CONSTRAINT comorbidade_paciente_fk0 FOREIGN KEY (paciente) REFERENCES paciente(idpaciente);
ALTER TABLE comorbidade_paciente ADD CONSTRAINT comorbidade_paciente_fk1 FOREIGN KEY (comorbidade) REFERENCES comorbidade(idcomorbidade);

ALTER TABLE medicamento_em_uso_paciente ADD CONSTRAINT medicamento_em_uso_paciente_fk0 FOREIGN KEY (paciente) REFERENCES paciente(idpaciente);
ALTER TABLE medicamento_em_uso_paciente ADD CONSTRAINT medicamento_em_uso_paciente_fk1 FOREIGN KEY (medicamento) REFERENCES medicamento(idmedicamento);

ALTER TABLE grupo_navegacao_paciente ADD CONSTRAINT grupo_navegacao_paciente_fk0 FOREIGN KEY (paciente) REFERENCES paciente(idpaciente);
ALTER TABLE grupo_navegacao_paciente ADD CONSTRAINT grupo_navegacao_paciente_fk1 FOREIGN KEY (grupo_navegacao) REFERENCES grupo_navegacao_pacientes(idgrupo_navegacao_pacientes);
ALTER TABLE grupo_navegacao_paciente ADD CONSTRAINT grupo_navegacao_paciente_fk2 FOREIGN KEY (medico_responsavel) REFERENCES membro_grupo_navegacao(idmembro_grupo_navegacao);

ALTER TABLE equipe_multi_paciente ADD CONSTRAINT equipe_multi_paciente_fk0 FOREIGN KEY (paciente) REFERENCES paciente(idpaciente);
ALTER TABLE equipe_multi_paciente ADD CONSTRAINT equipe_multi_paciente_fk1 FOREIGN KEY (categoria) REFERENCES categoria_profissional(idcategoria_profissional);
ALTER TABLE equipe_multi_paciente ADD CONSTRAINT equipe_multi_paciente_fk2 FOREIGN KEY (especialidade) REFERENCES especialidade_categoria_profissional(idespecialidade_categoria_profissional);
ALTER TABLE equipe_multi_paciente ADD CONSTRAINT equipe_multi_paciente_fk3 FOREIGN KEY (frequencia_acompanhamento) REFERENCES frequencia_acompanhamento(idfrequencia_acompanhamento);


ALTER TABLE nota_reuniao_medica_paciente ADD CONSTRAINT nota_reuniao_medica_paciente_fk0 FOREIGN KEY (paciente) REFERENCES paciente(idpaciente);

ALTER TABLE acao_nota_reuniao_medica_paciente ADD CONSTRAINT acao_nota_reuniao_medica_paciente_fk0 FOREIGN KEY (nota_reuniao_medica_paciente) REFERENCES nota_reuniao_medica_paciente(idnota_reuniao_medica_paciente);
ALTER TABLE acao_nota_reuniao_medica_paciente ADD CONSTRAINT acao_nota_reuniao_medica_paciente_fk1 FOREIGN KEY (status_acao) REFERENCES status_acao(idstatus_acao);

ALTER TABLE objetivo_pessoal_paciente ADD CONSTRAINT objetivo_pessoal_paciente_fk0 FOREIGN KEY (paciente) REFERENCES paciente(idpaciente);

ALTER TABLE meta_pessoal_paciente ADD CONSTRAINT meta_pessoal_paciente_fk0 FOREIGN KEY (objetivo_pessoal) REFERENCES objetivo_pessoal_paciente(idobjetivo_pessoal_paciente);

ALTER TABLE acao_meta_pessoal_paciente ADD CONSTRAINT acao_meta_pessoal_paciente_fk0 FOREIGN KEY (meta_pessoal) REFERENCES meta_pessoal_paciente(idmeta_pessoal_paciente);
ALTER TABLE acao_meta_pessoal_paciente ADD CONSTRAINT acao_meta_pessoal_paciente_fk1 FOREIGN KEY (status_acao) REFERENCES status_acao(idstatus_acao);

ALTER TABLE anotacao_atendimento_paciente ADD CONSTRAINT anotacao_atendimento_paciente_fk0 FOREIGN KEY (paciente) REFERENCES paciente(idpaciente);

ALTER TABLE acao_anotacao_atendimento_paciente ADD CONSTRAINT acao_anotacao_atendimento_paciente_fk0 FOREIGN KEY (anotacao_atendimento_paciente) REFERENCES anotacao_atendimento_paciente(idanotacao_atendimento_paciente);
ALTER TABLE acao_anotacao_atendimento_paciente ADD CONSTRAINT acao_anotacao_atendimento_paciente_fk1 FOREIGN KEY (status_acao) REFERENCES status_acao(idstatus_acao);

ALTER TABLE recurso_educacional_paciente ADD CONSTRAINT recurso_educacional_paciente_fk0 FOREIGN KEY (paciente) REFERENCES paciente(idpaciente);
ALTER TABLE recurso_educacional_paciente ADD CONSTRAINT recurso_educacional_paciente_fk1 FOREIGN KEY (recurso_educacional) REFERENCES recurso_educacional(idrecurso_educacional);

ALTER TABLE barreira_paciente ADD CONSTRAINT barreira_paciente_fk0 FOREIGN KEY (paciente) REFERENCES paciente(idpaciente);
ALTER TABLE barreira_paciente ADD CONSTRAINT barreira_paciente_fk1 FOREIGN KEY (barreira) REFERENCES barreira(idbarreira);


ALTER TABLE diagnostico_oncologico_paciente ADD CONSTRAINT diagnostico_oncologico_paciente_fk0 FOREIGN KEY (paciente) REFERENCES paciente(idpaciente);
ALTER TABLE diagnostico_oncologico_paciente ADD CONSTRAINT diagnostico_oncologico_paciente_fk1 FOREIGN KEY (diagnostico) REFERENCES categoria_subcategoria_diagnostico(idcategoria_subcategoria_diagnostico);

ALTER TABLE protocolo_tratamento_paciente ADD CONSTRAINT protocolo_tratamento_paciente_fk0 FOREIGN KEY (paciente) REFERENCES paciente(idpaciente);
ALTER TABLE protocolo_tratamento_paciente ADD CONSTRAINT protocolo_tratamento_paciente_fk1 FOREIGN KEY (protocolo) REFERENCES protocolo_oncologico(idprotocolo_oncologico);
ALTER TABLE protocolo_tratamento_paciente ADD CONSTRAINT protocolo_tratamento_paciente_fk2 FOREIGN KEY (status_protocolo) REFERENCES status_protocolo_tratamento(idstatus_protocolo_tratamento);



ALTER TABLE cirurgia_procedimento_paciente ADD CONSTRAINT cirurgia_procedimento_paciente_fk0 FOREIGN KEY (paciente) REFERENCES paciente(idpaciente);
ALTER TABLE cirurgia_procedimento_paciente ADD CONSTRAINT cirurgia_procedimento_paciente_fk1 FOREIGN KEY (procedimento_medico) REFERENCES procedimento_medico(idprocedimento_medico);


ALTER TABLE sinal_sintoma_paciente ADD CONSTRAINT sinal_sintoma_paciente_fk0 FOREIGN KEY (paciente) REFERENCES paciente(idpaciente);
ALTER TABLE sinal_sintoma_paciente ADD CONSTRAINT sinal_sintoma_paciente_fk1 FOREIGN KEY (sinal_sintoma) REFERENCES sinal_sintoma(idsinal_sintoma);

ALTER TABLE acao_sinal_sintoma_paciente ADD CONSTRAINT acao_sinal_sintoma_paciente_fk0 FOREIGN KEY (sinal_sintoma_paciente) REFERENCES sinal_sintoma_paciente(idsinal_sintoma_paciente);
ALTER TABLE acao_sinal_sintoma_paciente ADD CONSTRAINT acao_sinal_sintoma_paciente_fk1 FOREIGN KEY (status_acao) REFERENCES status_acao(idstatus_acao);

ALTER TABLE acao_barreira_paciente ADD CONSTRAINT acao_barreira_paciente_fk0 FOREIGN KEY (barreira_paciente) REFERENCES barreira_paciente(idbarreira_paciente);
ALTER TABLE acao_barreira_paciente ADD CONSTRAINT acao_barreira_paciente_fk1 FOREIGN KEY (status_acao) REFERENCES status_acao(idstatus_acao);
ALTER TABLE acao_barreira_paciente ADD CONSTRAINT acao_barreira_paciente_fk2 FOREIGN KEY (navegador) REFERENCES acesso_usuario(idacesso_usuario);

ALTER TABLE pre_cadastro_paciente ADD CONSTRAINT pre_cadastro_paciente_fk0 FOREIGN KEY (diagnostico_principal) REFERENCES categoria_subcategoria_diagnostico(idcategoria_subcategoria_diagnostico);
ALTER TABLE pre_cadastro_paciente ADD CONSTRAINT pre_cadastro_paciente_fk1 FOREIGN KEY (grupo_diagnostico) REFERENCES grupo_diagnostico(idgrupo_diagnostico);
ALTER TABLE pre_cadastro_paciente ADD CONSTRAINT pre_cadastro_paciente_fk2 FOREIGN KEY (medico_responsavel) REFERENCES membro_grupo_navegacao(idmembro_grupo_navegacao);
ALTER TABLE pre_cadastro_paciente ADD CONSTRAINT pre_cadastro_paciente_fk3 FOREIGN KEY (enfermeiro_responsavel) REFERENCES membro_grupo_navegacao(idmembro_grupo_navegacao);

ALTER TABLE admissao_paciente ADD CONSTRAINT admissao_paciente_fk0 FOREIGN KEY (paciente) REFERENCES paciente(idpaciente);
ALTER TABLE admissao_paciente ADD CONSTRAINT admissao_paciente_fk1 FOREIGN KEY (usuario_admissao) REFERENCES acesso_usuario(idacesso_usuario);

ALTER TABLE suporte_emocional_paciente ADD CONSTRAINT suporte_emocional_paciente_fk0 FOREIGN KEY (paciente) REFERENCES paciente(idpaciente);

ALTER TABLE pta_paciente ADD CONSTRAINT pta_paciente_fk0 FOREIGN KEY (paciente) REFERENCES paciente(idpaciente);

ALTER TABLE pta_planejar_paciente ADD CONSTRAINT pta_planejar_paciente_fk0 FOREIGN KEY (pta_paciente) REFERENCES pta_paciente(idpta_paciente);

ALTER TABLE pta_avaliar_paciente ADD CONSTRAINT pta_avaliar_paciente_fk0 FOREIGN KEY (pta_paciente) REFERENCES pta_paciente(idpta_paciente);

ALTER TABLE encerramento_navegacao_paciente ADD CONSTRAINT encerramento_navegacao_paciente_fk0 FOREIGN KEY (pta_avaliar_paciente) REFERENCES pta_avaliar_paciente(idpta_avaliar_paciente);
ALTER TABLE encerramento_navegacao_paciente ADD CONSTRAINT encerramento_navegacao_paciente_fk1 FOREIGN KEY (motivo_encerramento_navegacao) REFERENCES motivo_encerramento_navegacao(idmotivo_encerramento_navegacao);
ALTER TABLE encerramento_navegacao_paciente ADD CONSTRAINT encerramento_navegacao_paciente_fk2 FOREIGN KEY (status_navegacao_readmissao) REFERENCES status_navegacao_paciente(idstatus_navegacao_paciente);

ALTER TABLE ecog_paciente ADD CONSTRAINT ecog_paciente_fk0 FOREIGN KEY (paciente) REFERENCES paciente(idpaciente);
ALTER TABLE ecog_paciente ADD CONSTRAINT ecog_paciente_fk1 FOREIGN KEY (ecog) REFERENCES ecog(idecog);

ALTER TABLE compromisso_agenda_paciente ADD CONSTRAINT compromisso_agenda_paciente_fk0 FOREIGN KEY (paciente) REFERENCES paciente(idpaciente);
ALTER TABLE compromisso_agenda_paciente ADD CONSTRAINT compromisso_agenda_paciente_fk1 FOREIGN KEY (tipo_compromisso) REFERENCES tipo_compromisso_agenda(idtipo_compromisso_agenda);
ALTER TABLE compromisso_agenda_paciente ADD CONSTRAINT compromisso_agenda_paciente_fk2 FOREIGN KEY (status_compromisso) REFERENCES status_compromisso_agenda(idstatus_compromisso_agenda);
ALTER TABLE compromisso_agenda_paciente ADD CONSTRAINT compromisso_agenda_paciente_fk3 FOREIGN KEY (protocolo_tratamento_paciente) REFERENCES protocolo_tratamento_paciente(idprotocolo_tratamento_paciente);
ALTER TABLE compromisso_agenda_paciente ADD CONSTRAINT compromisso_agenda_paciente_fk4 FOREIGN KEY (status_item_protocolo) REFERENCES status_item_protocolo(idstatus_item_protocolo);

ALTER TABLE ocorrencia_compromisso_agenda_paciente ADD CONSTRAINT ocorrencia_compromisso_agenda_paciente_fk0 FOREIGN KEY (compromisso_agenda_paciente) REFERENCES compromisso_agenda_paciente(idcompromisso_agenda_paciente);
ALTER TABLE ocorrencia_compromisso_agenda_paciente ADD CONSTRAINT ocorrencia_compromisso_agenda_paciente_fk1 FOREIGN KEY (tipo_ocorrencia_compromisso) REFERENCES tipo_ocorrencia_compromisso(idtipo_ocorrencia_compromisso);


ALTER TABLE manutencao_navegacao_paciente ADD CONSTRAINT manutencao_navegacao_paciente_fk0 FOREIGN KEY (paciente) REFERENCES paciente(idpaciente);
ALTER TABLE manutencao_navegacao_paciente ADD CONSTRAINT manutencao_navegacao_paciente_fk1 FOREIGN KEY (status_anterior) REFERENCES status_navegacao_paciente(idstatus_navegacao_paciente);
ALTER TABLE manutencao_navegacao_paciente ADD CONSTRAINT manutencao_navegacao_paciente_fk2 FOREIGN KEY (novo_status) REFERENCES status_navegacao_paciente(idstatus_navegacao_paciente);


ALTER TABLE perfil_usuario_item_menu ADD CONSTRAINT perfil_usuario_item_menu_fk0 FOREIGN KEY (perfil_usuario) REFERENCES perfil_usuario(idperfil_usuario);
ALTER TABLE perfil_usuario_item_menu ADD CONSTRAINT perfil_usuario_item_menu_fk1 FOREIGN KEY (item_menu_sistema) REFERENCES item_menu_sistema(iditem_menu_sistema);
ALTER TABLE perfil_usuario_item_menu ADD CONSTRAINT perfil_usuario_item_menu_fk2 FOREIGN KEY (item_menu_superior) REFERENCES item_menu_sistema(iditem_menu_sistema);

ALTER TABLE resultado_exame_paciente ADD CONSTRAINT resultado_exame_paciente_fk0 FOREIGN KEY (paciente) REFERENCES paciente(idpaciente);
ALTER TABLE resultado_exame_paciente ADD CONSTRAINT resultado_exame_paciente_fk1 FOREIGN KEY (tipo_exame) REFERENCES tipo_compromisso_agenda(idtipo_compromisso_agenda);
ALTER TABLE resultado_exame_paciente ADD CONSTRAINT resultado_exame_paciente_fk2 FOREIGN KEY (compromisso_agenda) REFERENCES compromisso_agenda_paciente(idcompromisso_agenda_paciente);

ALTER TABLE item_protocolo_item_tratamento ADD CONSTRAINT item_protocolo_item_tratamento_fk0 FOREIGN KEY (paciente) REFERENCES paciente(idpaciente);
ALTER TABLE item_protocolo_item_tratamento ADD CONSTRAINT item_protocolo_item_tratamento_fk1 FOREIGN KEY (protocolo_tratamento_paciente) REFERENCES protocolo_tratamento_paciente(idprotocolo_tratamento_paciente);
ALTER TABLE item_protocolo_item_tratamento ADD CONSTRAINT item_protocolo_item_tratamento_fk2 FOREIGN KEY (status_item_tratamento) REFERENCES status_item_protocolo(idstatus_item_protocolo);

ALTER TABLE intervencao_protocolo_paciente ADD CONSTRAINT intervencao_protocolo_paciente_fk0 FOREIGN KEY (protocolo_tratamento_paciete) REFERENCES protocolo_tratamento_paciente(idprotocolo_tratamento_paciente);
ALTER TABLE intervencao_protocolo_paciente ADD CONSTRAINT intervencao_protocolo_paciente_fk1 FOREIGN KEY (usuario) REFERENCES usuario(idusuario);

ALTER TABLE historico_acao_barreira_paciente ADD CONSTRAINT historico_acao_barreira_paciente_fk0 FOREIGN KEY (acao_barreira_paciente) REFERENCES acao_barreira_paciente(idacao_barreira_paciente);
