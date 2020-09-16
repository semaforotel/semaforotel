- Exemplo funcional com acesso e exibicao da base de dados local postgresql + springboot. Baseado no codigo de exemplo do heroku.

- PRO: - Tem bootstrap
       - Tem Heroku (saphira...)
       - mapeado em /
       - mapeamento do POST
       - 03/03/2018: Tem datepicker (03/03/2018)
       - 03/03/2018: Primeira tela funcional da avaliação (03/03/2018)
       - 03/03/2018: Esconder e expandir o trecho (+)
       - 03/03/2018: Minor changes
       - 03/03/2018: Geracao de XLS pronta =)
       - 09/03/2018: Criacao de novos formularios.
       - 12/03/2018: SELECT, INSERT e UPDATE e DELETE no Postgresql local/remoto
       - 12/03/2018: Abrir ficha anterior (OK)
       - 13/03/2018: Primeiros graficos
       - 14/03/2018: Grafico de peso (le da base de dados) pronto.
       - 16/03/2018: Leitura de 348/2070 registros da BD.
       - 17/03/2018: Leitura de 903/2070 registros da BD.
       - 17/03/2018: Leitura de 912/2070 registros da BD.
       - 17/03/2018: Leitura/insercao de todos os registros na BD.
       - 17/03/2018: Importacao de registros da secao Avaliacao no Heroku. 
       - 18/03/2018: Importacao da secão Gonio e Preensao
       - 23/03/2018: Importaçao da secao Composicao
       - 31/03/2018: Completo até o item 4 (Composicao). Geração em arquivo, separada, de relatório de pesos por pessoa (src/BDPostgresql_teste/BDPeso.java)
       - 05/04/2018: Completo até a seção 6.
       - 05/04/2018: Completo até a seção 7.
       - 06/04/2018: Completo até a seção 10. Ufa!
       - 07/04/2018: Exibição de lista de registros com Thymeleaf (sem JSP).
       - 07/04/2018: Abertura de ficha com botão. Melhoria da interface para abrir apenas com POST (Listar fichas).
       - 19/04/2018: Usuário: sanscientific@gmail.com  Senha: san123
       - 19/04: Perfumaria: utilizar um painel nas seções (Ver dashboard_lista.html) (Pronto)
       - 19/04: Mostrar a lista de avaliações de cada paciente (pronto)
       - 20/04: Usuarios adicionados ao sistema.
       - 20/04: Nao precisa mais informar manualmente o número da ficha. Usuario clica em listar.
       - 20/04: Chave estrangeira em todos os registros.
       -21/04: Conferir se o uso da chave estrangeira está correto. (SOLVED!)
	         Inserir, remover e atualizar registros. (SOLVED)
		 Não sei se devo modificar o id (tb é único, mas não tenho o controle do valor quando remover, o serial pode incrementar sem o meu controle: posso remover e inserir, e nao necessariamente o último registro será o antecessor do próximo registro, ou seja, não tenho o controle do valor do serial. (Ex.: 1882. Insere 1883, Insere 1884, Remover 1883, Remove 1884, Insere 1885 (e não 1883). Deixar o id em controle do usuário é problema: ele pode informar um id e sobrescrever.
		 O cpf (primaria-único) é a solução. Tenho que
		 trocar em todos os select.
		 Problema: se precisar trocar o CPF, pq não
		 foi informado antes, teria que atualizar em
		 todas as outras tabelas. Aí surgiu a dúvida:
		 pq não criar um tabelão só? A ficha original
		 não tinha uma só tabela?
		 - Não seri o caso de criar outro 'id'?
		 - Número serial precisa.
		 - Outras tabelas não têm id, soh cpf.
		   - Fazer 1 teste: atualizar o cpf em avaliacao.
		     - Fato: todas as tabelas têm que ter id serial.
		     - id eh a chave primária.
		     - Ao remover, remove todas as que tem aquele id.
		     - cpf é complemento.
		     - ùnico botão de gravar.
		     - O serial será o mesmo em todas as tabelas,
		       desde que não exista erro na gravação (chave estrangeira).
		       - Esse eh o papel da chave-estrangeira: evitar
		       criar um tabelão soh, mas unir as tabelas.
		       - Se soh tiver um botao de gravar, mesmo
		         que dê algum problema, a gravação eh
			 sempre feita no mesmo id. (OK)
		- Unico botao gravar. (SOLVED!)
        - 21/04 (Reported at 05/04): Gravar sem abrir a ficha limpa todos os campos. Solução: único botão para gravar (SOLVED).
	         Mesmo problema com o gravar5 -> campos da seção 6 nao são abertos. Solução: único botão para gravar. (SOLVED!)
        - 21/04 (Reported at 17/03): Falta importar as demais seções. (SOLVED)

- BUG:	
	 - 09/03/2018: Falta usar um tabbedpane
         - Gravar em uma BD remota (Dropbox)?

	 
---------------------------------
Como compilar:

- mvn clean package
- heroku local

Executa em localhost:5000

---------------------------

- Verificar que ha bons exemplos funcionais para iniciar no framework spring em: https://spring.io/guides/gs/serving-web-content/

---
Dicas de Postgresql:
---
Show the postgresql active port listening:
pg_lsclusters

Show the current postgrel url in heroku remote:
heroku run echo \$JDBC_DATABASE_URL

--
http://blog.locaweb.com.br/artigos/desenvolvimento-artigos/instalando-o-postgresql-no-ubuntu-16-04/



Instalar o PostgreSQL no Ubuntu 16.04 é uma tarefa bem simples, pois os repositórios padrão já disponibilizam os pacotes que precisamos.

Para isso basta digitar os seguintes comandos
?
1
2
	
$ sudo apt update
$ sudo apt install postgresql

Feito isso, já temos nosso software instalado em nosso computador. Para testar se está tudo certo, precisamos antes entender dois aspectos da instalação.

Primeiro aspecto: a instalação criará um usuário em nosso sistema operacional chamado Postgres, ao qual você pode conferir com o seguinte comando
?
1
2
3
4
5
6
7
8
	
$ cut -d: -f1 /etc/passwd
phsil
geoclue
mysql
smmta
smmsp
guest-atgpth
postgres

A saída deste comando vai depender de quantos usuários você já tem criados em seu Ubuntu, mas como podemos ver o usuário Postgres está por ali.

Segundo aspecto: foi criada uma role com nome postgres. O Postgres tem um sistema de autenticação e autorização baseado em roles (regras). Muitas pessoas confundem roles com usuários, mas na verdade nós não temos usuários, somente roles.

O motivo para essas duas coisas acontecerem é que inicialmente o Postgres é configurado para autenticar utilizando a técnica de ident. De uma maneira bem simplificada, isso significa que o nome da role do banco e o nome do usuário do Ubuntu devem ser iguais para que seja possível a autenticação. Isso acontece por conta do tipo de autenticação, a qual funciona associando a role a uma conta do Ubuntu relacionada.

Você pode constatar isso fazendo um simples teste no console interativo do Postgres, o psql. Tente autenticar com o seu usuário padrão digitando no terminal
?
1
2
	
$ psql
psql: FATAL:  role "phsil" does not exist

Como o usuário do meu Ubuntu se chama phsil e eu não tenho nenhuma role criada no banco para esse usuário, recebo erro fatal do psql. Se você quiser autenticar com o sua conta padrão do Ubuntu, terá que criar uma role para ela. Para isso, podemos então, utilizar o usuário do postgres para entrar no psql
?
1
	
$ sudo -u postgres psql

O que estamos querendo dizer com este comando é “Ubuntu, execute o psql utilizando o usuário postgres”. Se tudo deu certo, agora estamos dentro do psql. O psql nos poupa bastante escrever queries em SQL por conta de já ter vários comandos pré-definidos pelo Postgres.

Uma vez dentro do psql, já sabemos que nossa instalação funcionou e estamos preparados para começar a utilizar nosso banco de dados. Vamos então criar uma role para o nosso usuário padrão do Ubuntu, que no meu caso é o phsil. Antes, vamos listar as roles já existentes
?
1
	
postgres= \du

Como podemos ver, a única role que eu tenho é a do postgres. Vamos criar então a nova role
?
1
2
3
	
postgres= create role phsil;
CREATE ROLE
postgres= \du

Com o comando acima eu criei uma role, mas como eu não passei nenhum parâmetro, essa role não tem nenhuma permissão, nem conseguimos logar ainda no psql com ela. Vamos então atualizar essa role para ser um superusuário e, então, poder logar no sistema e para poder criar um banco de dados
?
1
2
3
	
postgres= alter role phsil with superuser login createdb;
ALTER ROLE
postgres= \du

A role createdb é necessária. Ainda não conseguiremos logar no psql sem antes criarmos um banco de dados com o mesmo nome de nossa role. O nosso sistema de autenticação assume que isso precisa acontecer para que ele autorize a autenticação. Vamos listar quais bancos já estão criados
?
1
	
postgres= \l

Não temos ainda o banco pshil e então precisamos criá-lo
?
1
2
3
	
postgres= create database phsil;
CREATE DATABASE
postgres= \l

Não vamos nos preocupar agora com a estrutura deste banco porque na maioria das vezes nem o utilizamos.

Feito isso, estamos preparados para fazer nosso teste final. Vamos enfim logar no psql com o nosso usuário padrão do Ubuntu
?
1
2
3
4
5
6
7
	
postgres= \q
$ psql
 
psql (9.5.5)
Type "help" for help.
 
phsil=

E voilá. Tudo certo e nosso banco está prontinho. Você agora está preparado para criar aplicações fantásticas. Qualquer dúvida, fala comigo nos comentários! Abraço e até a próxima.

---
Mudar a senha do usuario:
\password

create database database;  <<IMPORTANTE: nome da base de dados não pode ser em letras maiusculas
---
Compilacao:

javac -cp . *.java
java -cp .:postegresql.jar BDPostgresql


---
Visualizar dados no postgres local:

psql -U lucio database

# \l
# \c database
# \dt
# drop table minhaTabela;
# \d+ minhaTabela  (descreve as colunas da tabela)
