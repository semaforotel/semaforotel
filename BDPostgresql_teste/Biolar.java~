/*
   Programa BioLar

Proposito: extracao dos dados biomedicos de fichas do Microsoft Word.
Procedimento: 
1) Abrir o arquivo da ficha
   Desbloquear o arquivo (Desenvolvedor) Selecionar e copiar o conte�do para o bloco de notas.
2) Salvar como... -> .txt -> Windows padrao -> Com retorno de carro/salto de linha
3) Abrir no e-macs
4) Copiar o conteudo para arq2.txt
5) Salvar como arq.txt
6) Executar o programa para extracao dos dados

Autor: Lucio Agostinho Rocha
Ultima atualizacao: 10/11/2017

 */
package biolar;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author root
 */
public class Biolar {

    private int QUANT_ARQ = 2037;
    private final String PREFIXO_ARQ = "arq";
    //private final String CAMINHO_ENTRADA = "/root/";
    private final String CAMINHO_ENTRADA = "c:\\Users\\Lucio\\Desktop\\utfpr_2016\\A\\";

    //Arquivo que mostra chave|valor
    //private final String ARQUIVO_SAIDA = "/root/arq_saida.txt";
    private final String ARQUIVO_SAIDA = "c:\\Users\\Lucio\\Desktop\\utfpr_2016\\A\\arq_saida.txt";
        
    //private final String ARQUIVO_SAIDA_FILTRADO = "/root/arq_saida_filtrado.txt";
    private final String ARQUIVO_SAIDA_FILTRADO = "c:\\Users\\Lucio\\Desktop\\utfpr_2016\\A\\arq_saida_filtrado.txt";

    private final String[] dados = new String[40000];

    //Quantidade de tabulacoes
    private String sepTab1 = "\t|";
    private String sepTab2 = "\t|";
    
    public Biolar() {

        iniciarArqSaida();

        abrirArquivo();

    }//fim construtor

    public void abrirArquivo() {
        
        //n=indice do arquivo que serah lido
        int n = 1;
        while (n <= QUANT_ARQ) {

            imprimirColunas(n);

            n++;
        }//fim while
    }//fim abrirArquivo

    public void imprimirColunas(int n){
        
            try {

                //Inicializa a struct dados[]
                inicializarDados();

                StringBuffer conteudo = new StringBuffer();

                //Abre o arquivo
                String arq = CAMINHO_ENTRADA + PREFIXO_ARQ + n + ".txt";
                BufferedReader file = new BufferedReader(new FileReader(arq));
                String linha = "";

                String REGEX = "";
                Matcher matcher;
                Pattern pattern;

                StringTokenizer token;

                /*
                while (linha != null) {
                    linha = file.readLine();
                    System.out.println(linha);
                }*/
                //Abre o arquivo
                file = new BufferedReader(new FileReader(arq));
                linha = "";

                //Avaliacao
                linha = file.readLine();
                int i = 0;
                //Nome
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                //Nome:                
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Data               
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                //Data:
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Idade
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                //Idade:
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Exercícios resistido há:
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                //extrai conteudo
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Outras AF há:
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                //extrai conteudo
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Especificar:
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                //extrai conteudo
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                REGEX = "Especificar:(.*)DN:(.*)";
                pattern = Pattern.compile(REGEX);
                matcher = pattern.matcher(linha);
                if (matcher.find()) {

                    dados[i] = matcher.group(1).trim();
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //DN:
                    dados[i] = "DN";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //conteudo:
                    dados[i] = matcher.group(2).trim();
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                }//fim if

                //Diagnostico:
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;
                //conteudo
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Medicacao:
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;
                //conteudo
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Peso:
                linha = file.readLine();
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;
                //conteudo
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Altura:
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;
                //conteudo
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //IMC:
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;
                //conteudo
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //FC:
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;
                //conteudo
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                linha = file.readLine();

                //Articulacao    Movimento...
                linha = file.readLine();
                //System.out.println(linha);

                token = new StringTokenizer(linha, "\t");

                //Articulacao
                linha = token.nextToken();
                //System.out.println(linha);

                //Movimento                
                linha = token.nextToken();
                //System.out.println(linha);

                //D
                String D = token.nextToken();
                //System.out.println(D);
                //E
                String E = token.nextToken();
                //Dor
                String dor = token.nextToken();

                //---OmbroFlexao                  
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                String ombroFlexao = token.nextToken().trim();
                dados[i] = ombroFlexao;
                conteudo.append(D + dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Rot Ext.:
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                String rotExt = token.nextToken();

                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //EOmbroFlexao
                dados[i] = E + ombroFlexao;
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Dor anatomico
                file.readLine();
                //Dor
                dados[i] = dor;
                conteudo.append(ombroFlexao + dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Valor da dor
                linha = file.readLine();
                //System.out.println(linha);                
                dados[i] = linha;
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //rotExt
                dados[i] = D + rotExt;
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;
                //68graus
                dados[i] = file.readLine().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //rotExt
                dados[i] = E + rotExt;
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;
                //68graus
                dados[i] = file.readLine().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Dor
                dados[i] = dor;
                conteudo.append(rotExt + dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Dor anatomico
                file.readLine();
                //Valor da dor
                linha = file.readLine();
                //System.out.println(linha);                
                dados[i] = linha;
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //-----------
                //Quadril (mesmo trecho do ombro flexao)
                //---OmbroFlexao                  
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                ombroFlexao = token.nextToken().trim();
                dados[i] = ombroFlexao;
                conteudo.append(D + dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Rot Ext.:
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                rotExt = token.nextToken();

                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //EOmbroFlexao
                dados[i] = E + ombroFlexao;
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Dor anatomico
                file.readLine();
                //Dor
                dados[i] = dor;
                conteudo.append(ombroFlexao + dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Valor da dor
                linha = file.readLine();
                //System.out.println(linha);                
                dados[i] = linha;
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //rotExt
                dados[i] = D + rotExt;
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;
                //68graus
                dados[i] = file.readLine().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //rotExt
                dados[i] = E + rotExt;
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;
                //68graus
                dados[i] = file.readLine().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Dor
                dados[i] = dor;
                conteudo.append(rotExt + dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Dor anatomico
                file.readLine();
                //Valor da dor
                linha = file.readLine();
                //System.out.println(linha);                
                dados[i] = linha;
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //---
                //Joelho
                linha = file.readLine();
                token = new StringTokenizer(linha, "\t");
                //Joelho Flexao
                String joelhoFlexao = token.nextToken() + token.nextToken();
                //System.out.println(joelhoFlexao);

                //DjoelhoFlexao
                dados[i] = D + joelhoFlexao;
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //valor
                dados[i] = token.nextToken();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //EjoelhoFlexao
                dados[i] = E + joelhoFlexao;
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //valor
                linha = file.readLine().trim();
                dados[i] = linha;
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //dor anatomico
                file.readLine();

                dados[i] = dor + joelhoFlexao;
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //valor
                dados[i] = file.readLine().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //---
                //Tornozelo (mesmo trecho do ombro flexao)
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                ombroFlexao = token.nextToken().trim();
                dados[i] = ombroFlexao;
                conteudo.append(D + dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Rot Ext.:
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                rotExt = token.nextToken();

                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //EOmbroFlexao
                dados[i] = E + ombroFlexao;
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Dor anatomico
                file.readLine();
                //Dor
                dados[i] = dor;
                conteudo.append(ombroFlexao + dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Valor da dor
                linha = file.readLine();
                //System.out.println(linha);                
                dados[i] = linha;
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //rotExt
                dados[i] = D + rotExt;
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;
                //68graus
                dados[i] = file.readLine().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //rotExt
                dados[i] = E + rotExt;
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;
                //68graus
                dados[i] = file.readLine().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Dor
                dados[i] = dor;
                conteudo.append(rotExt + dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Dor anatomico
                file.readLine();
                //Valor da dor
                linha = file.readLine();
                //System.out.println(linha);                
                dados[i] = linha;
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //---
                //Obs                
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                for (int j = 0; j < 3; j++) {
                    linha = file.readLine();
                }
                //System.out.println(linha);

                //Cintura
                token = new StringTokenizer(linha, "\t");
                //D
                token.nextToken();
                //E
                token.nextToken();
                //Cintura                
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //98,5
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //prof.
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //nome do professor
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //DBraco
                linha = file.readLine();
                token = new StringTokenizer(linha, "\t");
                String braco = token.nextToken().trim();
                dados[i] = D + braco;
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //EBraco
                dados[i] = E + braco;
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                dados[i] = file.readLine().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Quadril
                linha = file.readLine();
                token = new StringTokenizer(linha, "\t");
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                i++;

                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Horario:
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //DPanturilha
                linha = file.readLine();
                token = new StringTokenizer(linha, "\t");
                String pan = token.nextToken().trim();
                dados[i] = pan;
                conteudo.append(D + dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                dados[i] = E + pan;
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                dados[i] = file.readLine();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //RQC
                linha = file.readLine();
                token = new StringTokenizer(linha, "\t");
                dados[i] = token.nextToken().trim();;
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Dias
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                dados[i] = token.nextToken().trim();;
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Coxa (mesmo da panturrilha)                
                linha = file.readLine();
                token = new StringTokenizer(linha, "\t");
                pan = token.nextToken().trim();
                dados[i] = pan;
                conteudo.append(D + dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                dados[i] = E + pan;
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                dados[i] = file.readLine();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Media coxa
                linha = file.readLine();
                token = new StringTokenizer(linha, "\t");
                String mediaCoxa = token.nextToken();
                dados[i]=E + mediaCoxa;
                conteudo.append(E + mediaCoxa + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //E...
                linha = token.nextToken();
                REGEX = "E(.*)D(.*)";
                pattern = Pattern.compile(REGEX);
                matcher = pattern.matcher(linha);
                if (matcher.find()) {

                    dados[i] = matcher.group(1).trim();
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //D
                    dados[i] = "D" + mediaCoxa;
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //conteudo:
                    dados[i] = matcher.group(2).trim();
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                }//fim if

                //Line Blank
                file.readLine();
                //Bia
                file.readLine();

                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Reactancia
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Agua
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //M.Magra
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //M.Gordura
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Massa Cel
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Dobras cutaneas
                linha = file.readLine();

                //triceps
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Subes
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Supra
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Abd
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Coxa
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //T
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Avaliacao de dor                
                for (int j = 0; j < 3; j++) {
                    file.readLine();
                }

                //ombro D 3
                linha = file.readLine();
                REGEX = "(.*)([0-9])";
                pattern = Pattern.compile(REGEX);
                matcher = pattern.matcher(linha);
                if (matcher.find()) {
                    //System.out.println("--"+matcher.group(1));
                    dados[i] = matcher.group(1);
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //System.out.println("--"+matcher.group(2));
                    dados[i] = matcher.group(2);
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                } else {
                    dados[i] = "";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //System.out.println("--"+matcher.group(2));
                    dados[i] = "_";
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                }//fim else

                //ombro D 3
                linha = file.readLine();
                REGEX = "(.*)([0-9])";
                pattern = Pattern.compile(REGEX);
                matcher = pattern.matcher(linha);
                if (matcher.find()) {
                    //System.out.println("--"+matcher.group(1));
                    dados[i] = matcher.group(1);
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //System.out.println("--"+matcher.group(2));
                    dados[i] = matcher.group(2);
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                } else {
                    dados[i] = "";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //System.out.println("--"+matcher.group(2));
                    dados[i] = "_";
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                }//fim else

                //Indefinido1
                linha = file.readLine();
                REGEX = "(.*)([0-9])";
                pattern = Pattern.compile(REGEX);
                matcher = pattern.matcher(linha);
                if (matcher.find()) {
                    //System.out.println("--"+matcher.group(1));
                    dados[i] = matcher.group(1);
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //System.out.println("--"+matcher.group(2));
                    dados[i] = matcher.group(2);
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                } else {
                    dados[i] = "";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //System.out.println("--"+matcher.group(2));
                    dados[i] = "_";
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                }//fim else

                //Indefinido2
                linha = file.readLine();
                REGEX = "(.*)([0-9])";
                pattern = Pattern.compile(REGEX);
                matcher = pattern.matcher(linha);
                if (matcher.find()) {
                    //System.out.println("--"+matcher.group(1));
                    dados[i] = matcher.group(1);
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //System.out.println("--"+matcher.group(2));
                    dados[i] = matcher.group(2);
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                } else {
                    dados[i] = "";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //System.out.println("--"+matcher.group(2));
                    dados[i] = "_";
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                }//fim else

                //Indefinido3
                linha = file.readLine();
                REGEX = "(.*)([0-9])";
                pattern = Pattern.compile(REGEX);
                matcher = pattern.matcher(linha);
                if (matcher.find()) {
                    //System.out.println("--"+matcher.group(1));
                    dados[i] = matcher.group(1);
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //System.out.println("--"+matcher.group(2));
                    dados[i] = matcher.group(2);
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                } else {
                    dados[i] = "";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //System.out.println("--"+matcher.group(2));
                    dados[i] = "_";
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                }//fim else

                //Obs:
                linha = file.readLine();
                token = new StringTokenizer(linha, ":");
                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                dados[i] = token.nextToken().trim();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //Evolucao da Dor
                for (int j = 0; j < 2; j++) {
                    file.readLine();
                }

                //campo1
                linha = file.readLine();
                REGEX = "(.*)([A-D])";
                pattern = Pattern.compile(REGEX);
                matcher = pattern.matcher(linha);
                if (matcher.find()) {
                    //System.out.println("--"+matcher.group(1));
                    dados[i] = matcher.group(1);
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //System.out.println("--"+matcher.group(2));
                    dados[i] = matcher.group(2);
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                } else {
                    dados[i] = "";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //System.out.println("--"+matcher.group(2));
                    dados[i] = "_";
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                }//fim else

                //campo2
                linha = file.readLine();
                REGEX = "(.*)([A-D])";
                pattern = Pattern.compile(REGEX);
                matcher = pattern.matcher(linha);
                if (matcher.find()) {
                    //System.out.println("--"+matcher.group(1));
                    dados[i] = matcher.group(1);
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //System.out.println("--"+matcher.group(2));
                    dados[i] = matcher.group(2);
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                } else {
                    dados[i] = "";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //System.out.println("--"+matcher.group(2));
                    dados[i] = "_";
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                }//fim else

                //campo3
                linha = file.readLine();
                REGEX = "(.*)([A-D])";
                pattern = Pattern.compile(REGEX);
                matcher = pattern.matcher(linha);
                if (matcher.find()) {
                    //System.out.println("--"+matcher.group(1));
                    dados[i] = matcher.group(1);
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //System.out.println("--"+matcher.group(2));
                    dados[i] = matcher.group(2);
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                } else {
                    dados[i] = "";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //System.out.println("--"+matcher.group(2));
                    dados[i] = "_";
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                }//fim else

                //campo4
                linha = file.readLine();
                REGEX = "(.*)([A-D])";
                pattern = Pattern.compile(REGEX);
                matcher = pattern.matcher(linha);
                if (matcher.find()) {
                    //System.out.println("--"+matcher.group(1));
                    dados[i] = matcher.group(1);
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //System.out.println("--"+matcher.group(2));
                    dados[i] = matcher.group(2);
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                } else {
                    dados[i] = "";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //System.out.println("--"+matcher.group(2));
                    dados[i] = "_";
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                }//fim else

                //campo4
                linha = file.readLine();
                REGEX = "(.*)([A-D])";
                pattern = Pattern.compile(REGEX);
                matcher = pattern.matcher(linha);
                if (matcher.find()) {
                    //System.out.println("--"+matcher.group(1));
                    dados[i] = matcher.group(1);
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //System.out.println("--"+matcher.group(2));
                    dados[i] = matcher.group(2);
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                } else {
                    dados[i] = "";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //System.out.println("--"+matcher.group(2));
                    dados[i] = "_";
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                }//fim else

                //Guralnick
                file.readLine();
                //Equilibrio
                file.readLine();

                //pp
                linha = file.readLine();
                REGEX = "pp(.*)";
                pattern = Pattern.compile(REGEX);
                matcher = pattern.matcher(linha);
                if (matcher.find()) {
                    //System.out.println("--"+matcher.group(1));
                    dados[i] = "pp";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //System.out.println("--"+matcher.group(1));
                    dados[i] = matcher.group(1);
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                }

                dados[i] = "pp(campo2)";
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //
                linha = file.readLine();
                dados[i] = linha;
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //pse
                linha = file.readLine();
                REGEX = "pse(.*)";
                pattern = Pattern.compile(REGEX);
                matcher = pattern.matcher(linha);
                if (matcher.find()) {
                    //System.out.println("--"+matcher.group(1));
                    dados[i] = "pse";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //System.out.println("--"+matcher.group(1));
                    dados[i] = matcher.group(1);
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                }

                dados[i] = "pse(campo2)";
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //
                dados[i] = file.readLine();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //pe
                linha = file.readLine();
                REGEX = "pe(.*)";
                pattern = Pattern.compile(REGEX);
                matcher = pattern.matcher(linha);
                if (matcher.find()) {
                    //System.out.println("--"+matcher.group(1));
                    dados[i] = "pe";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //System.out.println("--"+matcher.group(1));
                    dados[i] = matcher.group(1);
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                }

                dados[i] = "pe(campo2)";
                conteudo.append(dados[i] + sepTab1);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //
                dados[i] = file.readLine();
                conteudo.append(dados[i] + sepTab2);
                gravar(conteudo);
                conteudo = new StringBuffer();
                i++;

                //
                linha = file.readLine();
                REGEX = "sentar:(.*)Velocidade:(.*)Obs:(.*)Total:(.*)";
                pattern = Pattern.compile(REGEX);
                matcher = pattern.matcher(linha);
                if (matcher.find()) {

                    //System.out.println("--"+matcher.group(1));
                    //System.out.println("--"+matcher.group(1).substring(0,7)+"--");
                    //System.out.println("--"+matcher.group(1).substring(7));
                    dados[i] = "Levantar e sentar(campo1)";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    dados[i] = matcher.group(1).substring(0, 7);
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    dados[i] = "Levantar e sentar(campo2)";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    dados[i] = matcher.group(1).substring(7);
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //Velocidade
                    dados[i] = "Velocidade(campo1)";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    dados[i] = matcher.group(2).substring(0, 7);
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    dados[i] = "Velocidade(campo2)";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    dados[i] = matcher.group(2).substring(7);
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //
                    dados[i] = "Obs";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    dados[i] = matcher.group(3);
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    //
                    dados[i] = "Total";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    dados[i] = matcher.group(4);
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                }
                //

                //TUG
                linha = file.readLine();
                //System.out.println(linha);
                REGEX = "TUG:(.*)  (.*)seg(.*)OBS(.*):(.*)";
                pattern = Pattern.compile(REGEX);
                matcher = pattern.matcher(linha);
                if (matcher.find()) {

                    /*System.out.println("--"+matcher.group(1));
                    System.out.println("--"+matcher.group(2));
                    System.out.println("--"+matcher.group(3));
                    System.out.println("--"+matcher.group(4));
                    System.out.println("--"+matcher.group(5));
                     */
                    dados[i] = "TUG (campo1)";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    dados[i] = matcher.group(1);
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    dados[i] = "TUG (campo2)";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    dados[i] = matcher.group(2);
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    dados[i] = "OBS";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    dados[i] = matcher.group(5);
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                }

                for (int j = 0; j < 8; j++) {
                    linha = file.readLine();
                }

                //System.out.println(linha);                
                REGEX = "\\?(.*)";
                pattern = Pattern.compile(REGEX);
                matcher = pattern.matcher(linha);
                if (matcher.find()) {

                    //System.out.println(matcher.group(1));
                    dados[i] = "1.AspectosFisicos Atual";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    dados[i] = matcher.group(1).trim();
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    dados[i] = "1.AspectosFisicos Anterior";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    dados[i] = file.readLine().trim();
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                }

                linha = file.readLine();
                //System.out.println(linha);                
                REGEX = "\\?(.*)";
                pattern = Pattern.compile(REGEX);
                matcher = pattern.matcher(linha);
                if (matcher.find()) {

                    //System.out.println(matcher.group(1));
                    dados[i] = "2.AspectosFisicos Atual";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    dados[i] = matcher.group(1).trim();
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    dados[i] = "2.AspectosFisicos Anterior";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    dados[i] = file.readLine().trim();
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                }

                //3
                linha = file.readLine();
                //System.out.println(linha);                
                REGEX = "\\?(.*)";
                pattern = Pattern.compile(REGEX);
                matcher = pattern.matcher(linha);
                if (matcher.find()) {

                    //System.out.println(matcher.group(1));
                    dados[i] = "3.AspectosFisicos Atual";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    dados[i] = matcher.group(1).trim();
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    dados[i] = "3.AspectosFisicos Anterior";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    dados[i] = file.readLine().trim();
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                }

                //4
                linha = file.readLine();
                //System.out.println(linha);                
                REGEX = "\\?(.*)";
                pattern = Pattern.compile(REGEX);
                matcher = pattern.matcher(linha);
                if (matcher.find()) {

                    //System.out.println(matcher.group(1));
                    dados[i] = "4.AspectosFisicos Atual";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    dados[i] = matcher.group(1).trim();
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    dados[i] = "4.AspectosFisicos Anterior";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    dados[i] = file.readLine().trim();
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                }

                for (int j = 0; j < 3; j++) {
                    linha = file.readLine();
                }

                //System.out.println(linha);
                REGEX = "\\?\t(.*)";
                pattern = Pattern.compile(REGEX);
                matcher = pattern.matcher(linha);
                if (matcher.find()) {

                    /*
                    BUG dos formularios: algumas selecoes geram quebra
                    de linha, outras nao
                     */
                    linha = matcher.group(1);
                    //System.out.println("--" + linha);

                    REGEX = "(.*)\t(.*)";
                    pattern = Pattern.compile(REGEX);
                    matcher = pattern.matcher(linha);
                    if (matcher.find()) {
                        //System.out.println("==" + matcher.group(1));
                        //System.out.println("==" + matcher.group(2));

                        dados[i] = "Humor Atual";
                        conteudo.append(dados[i] + sepTab1);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = matcher.group(1).trim();
                        conteudo.append(dados[i] + sepTab2);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = "Humor Anterior";
                        conteudo.append(dados[i] + sepTab1);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = matcher.group(2).trim();
                        conteudo.append(dados[i] + sepTab2);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                    } else {

                        dados[i] = "Humor Atual";
                        conteudo.append(dados[i] + sepTab1);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = linha.trim();
                        conteudo.append(dados[i] + sepTab2);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = "Humor Anterior";
                        conteudo.append(dados[i] + sepTab1);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = file.readLine().trim();
                        conteudo.append(dados[i] + sepTab2);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                    }//fim else

                }//fim if

                for (int j = 0; j < 3; j++) {
                    linha = file.readLine();
                }

                //System.out.println(linha);
                REGEX = "\\?\t(.*)";
                pattern = Pattern.compile(REGEX);
                matcher = pattern.matcher(linha);
                if (matcher.find()) {

                    /*
                    BUG dos formularios: algumas selecoes geram quebra
                    de linha, outras nao
                     */
                    linha = matcher.group(1);
                    //System.out.println("--" + linha);

                    REGEX = "(.*)\t(.*)";
                    pattern = Pattern.compile(REGEX);
                    matcher = pattern.matcher(linha);
                    if (matcher.find()) {
                        //System.out.println("==" + matcher.group(1));
                        //System.out.println("==" + matcher.group(2));

                        dados[i] = "AspectosCognitivos Atual";
                        conteudo.append(dados[i] + sepTab1);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = matcher.group(1).trim();
                        conteudo.append(dados[i] + sepTab2);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = "AspectosCognitivos Anterior";
                        conteudo.append(dados[i] + sepTab1);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = matcher.group(2).trim();
                        conteudo.append(dados[i] + sepTab2);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                    } else {

                        dados[i] = "AspectosCognitivos Atual";
                        conteudo.append(dados[i] + sepTab1);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = linha.trim();
                        conteudo.append(dados[i] + sepTab2);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = "AspectosCognitivos Anterior";
                        conteudo.append(dados[i] + sepTab1);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = file.readLine().trim();
                        conteudo.append(dados[i] + sepTab2);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                    }//fim else

                }//fim if

                //
                for (int j = 0; j < 3; j++) {
                    linha = file.readLine();
                }

                //System.out.println(linha);
                REGEX = "\\?(.*)";
                pattern = Pattern.compile(REGEX);
                matcher = pattern.matcher(linha);
                if (matcher.find()) {

                    /*
                    BUG dos formularios: algumas selecoes geram quebra
                    de linha, outras nao
                     */
                    linha = matcher.group(1);
                    //System.out.println("--" + linha);

                    dados[i] = "1.AvaliacaoComportamental";
                    conteudo.append(dados[i] + sepTab1);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;

                    dados[i] = linha.trim();
                    conteudo.append(dados[i] + sepTab2);
                    gravar(conteudo);
                    conteudo = new StringBuffer();
                    i++;
                    
                }//fim if

                //a.
                linha=file.readLine();
                //System.out.println(linha);
                REGEX = "\\?\t(.*)";
                pattern = Pattern.compile(REGEX);
                matcher = pattern.matcher(linha);
                if (matcher.find()) {

                    /*
                    BUG dos formularios: algumas selecoes geram quebra
                    de linha, outras nao
                     */
                    linha = matcher.group(1);
                    //System.out.println("--" + linha);

                    REGEX = "(.*)\t(.*)";
                    pattern = Pattern.compile(REGEX);
                    matcher = pattern.matcher(linha);
                    if (matcher.find()) {
                        //System.out.println("==" + matcher.group(1));
                        //System.out.println("==" + matcher.group(2));

                        dados[i] = "a.AspectosCognitivos Atual";
                        conteudo.append(dados[i] + sepTab1);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = matcher.group(1).trim();
                        conteudo.append(dados[i] + sepTab2);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = "a.AspectosCognitivos Anterior";
                        conteudo.append(dados[i] + sepTab1);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = matcher.group(2).trim();
                        conteudo.append(dados[i] + sepTab2);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                    } else {

                        dados[i] = "a.AspectosCognitivos Atual";
                        conteudo.append(dados[i] + sepTab1);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = linha.trim();
                        conteudo.append(dados[i] + sepTab2);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = "a.AspectosCognitivos Anterior";
                        conteudo.append(dados[i] + sepTab1);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = file.readLine().trim();
                        conteudo.append(dados[i] + sepTab2);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                    }//fim else

                }//fim if
                
                
                //b.
                linha=file.readLine();
                //System.out.println(linha);
                REGEX = "\\?\t(.*)";
                pattern = Pattern.compile(REGEX);
                matcher = pattern.matcher(linha);
                if (matcher.find()) {

                    /*
                    BUG dos formularios: algumas selecoes geram quebra
                    de linha, outras nao
                     */
                    linha = matcher.group(1);
                    //System.out.println("--" + linha);

                    REGEX = "(.*)\t(.*)";
                    pattern = Pattern.compile(REGEX);
                    matcher = pattern.matcher(linha);
                    if (matcher.find()) {
                        //System.out.println("==" + matcher.group(1));
                        //System.out.println("==" + matcher.group(2));

                        dados[i] = "b.AspectosCognitivos Atual";
                        conteudo.append(dados[i] + sepTab1);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = matcher.group(1).trim();
                        conteudo.append(dados[i] + sepTab2);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = "b.AspectosCognitivos Anterior";
                        conteudo.append(dados[i] + sepTab1);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = matcher.group(2).trim();
                        conteudo.append(dados[i] + sepTab2);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                    } else {

                        dados[i] = "b.AspectosCognitivos Atual";
                        conteudo.append(dados[i] + sepTab1);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = linha.trim();
                        conteudo.append(dados[i] + sepTab2);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = "b.AspectosCognitivos Anterior";
                        conteudo.append(dados[i] + sepTab1);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = file.readLine().trim();
                        conteudo.append(dados[i] + sepTab2);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                    }//fim else

                }//fim if
                
                //c.
                linha=file.readLine();
                //System.out.println(linha);
                REGEX = "\\?\t(.*)";
                pattern = Pattern.compile(REGEX);
                matcher = pattern.matcher(linha);
                if (matcher.find()) {

                    /*
                    BUG dos formularios: algumas selecoes geram quebra
                    de linha, outras nao
                     */
                    linha = matcher.group(1);
                    //System.out.println("--" + linha);

                    REGEX = "(.*)\t(.*)";
                    pattern = Pattern.compile(REGEX);
                    matcher = pattern.matcher(linha);
                    if (matcher.find()) {
                        //System.out.println("==" + matcher.group(1));
                        //System.out.println("==" + matcher.group(2));

                        dados[i] = "c.AspectosCognitivos Atual";
                        conteudo.append(dados[i] + sepTab1);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = matcher.group(1).trim();
                        conteudo.append(dados[i] + sepTab2);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = "c.AspectosCognitivos Anterior";
                        conteudo.append(dados[i] + sepTab1);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = matcher.group(2).trim();
                        conteudo.append(dados[i] + sepTab2);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                    } else {

                        dados[i] = "c.AspectosCognitivos Atual";
                        conteudo.append(dados[i] + sepTab1);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = linha.trim();
                        conteudo.append(dados[i] + sepTab2);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = "c.AspectosCognitivos Anterior";
                        conteudo.append(dados[i] + sepTab1);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                        dados[i] = file.readLine().trim();
                        conteudo.append(dados[i] + sepTab2);
                        gravar(conteudo);
                        conteudo = new StringBuffer();
                        i++;

                    }//fim else

                }//fim if
                                                
                
                System.out.println("===Fim leitura do arquivo: " + arq);

                if (n!=1)
                    //indices comecao em 0(zero)
                    //Grava apenas as colunas impares -> valor
                    gravarFiltrado(dados,"impar");
                    
                else {
                    //Grava apenas as colunas pares -> cabecalhos
                    gravarFiltrado(dados,"par");
                    //Grava apenas as colunas impares -> valor
                    gravarFiltrado(dados,"impar");                
                }
                
                //Proxima linha                
                conteudo.append("\n");
                gravar(conteudo);
                conteudo = new StringBuffer();                

            } catch (Exception io) {
                System.out.println("Excecao1: Erro ao abrir arquivo: " + io.getMessage());
                io.printStackTrace();
            }

    }
    
    
    public StringBuffer gravar(StringBuffer conteudo) {

        try {
            //Grava o conteudo 
            BufferedWriter out = new BufferedWriter(new FileWriter(ARQUIVO_SAIDA, true));
            out.write(conteudo.toString());
            conteudo = new StringBuffer();
            out.close();
        } catch (Exception e) {
            System.out.println("Excecao2: Erro ao gravar no arquivo." + e.getMessage());
        }//fim catch			

        return conteudo;

    }
    
    public void gravarFiltrado(String [] dados, String tipo) {

        try {
            //Grava o conteudo 
            BufferedWriter out;
            if (tipo.equals("impar"))
                 out = new BufferedWriter(new FileWriter(ARQUIVO_SAIDA_FILTRADO, true));
            else
                //Limpa o arquivo (false), na escrita de um novo cabecalho
                out = new BufferedWriter(new FileWriter(ARQUIVO_SAIDA_FILTRADO, false));
            int i=0;
            while (i<dados.length){
                if (tipo.equals("impar"))
                    out.write(dados[i+1].toString()+sepTab1);                
                else
                    out.write(dados[i].toString()+sepTab1);
                i=i+2;
                
            }//fim while            
            out.write("\n");
            out.close();
        } catch (Exception e) {
            System.out.println("Excecao2: Erro ao gravar no arquivo." + e.getMessage());
        }//fim catch			        

    }

    public void iniciarArqSaida() {
//Limpa o arquivo de saida

        try {
            //Grava o conteudo 
            BufferedWriter out = new BufferedWriter(new FileWriter(ARQUIVO_SAIDA, false));
            out.write("");
            out.close();
        } catch (Exception e) {
            System.out.println("Excecao2: Erro ao gravar no arquivo." + e.getMessage());
        }//fim catch			
    }

    public void inicializarDados() {

        for (int i = 0; i < dados.length; i++) {
            dados[i] = "";
        }

    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        new Biolar();
    }

}
