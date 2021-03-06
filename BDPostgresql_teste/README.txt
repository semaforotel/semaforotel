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
# \password

# create database database;  <<IMPORTANTE: nome da base de dados não pode ser em letras maiusculas
---
Compilacao:

javac -cp . *.java
java -cp .:postegresql.jar BDPostgresql
