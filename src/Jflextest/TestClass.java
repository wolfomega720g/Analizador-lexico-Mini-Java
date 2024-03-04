package Jflextest;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.swing.JOptionPane;

public class TestClass {
		
	public static void main(String args[]) throws IOException{
		 String str = JOptionPane.showInputDialog("expresi�n");
		 
		 InputStream is = new ByteArrayInputStream(str.getBytes());
		 //BufferedReader br = new BufferedReader(new InputStreamReader(is));
		 
		 NewLexer lexer = new NewLexer (is);
		 String resultados ="";
		 
		 while(true){
			 Token token = lexer.yylex();
			 if(token ==null){
				 resultados+= "FIN";
				 break;
			 }
			 
			 //igual, suma, variable, numero, multiplicacion, resta, division, ERROR
			 switch(token){
				 case ERROR: resultados+="ERROR"+ lexer.lexeme+" \n"; 
				 			break;
				 case ID:
				 case numero:
				 case decimal:
				 case incremento:
				 case exponente:
				 case variable: resultados+="Token:"+token+" "+ lexer.lexeme+"\n";
				 		break;
				 case IF:
				 case FOR:
				 case THEN:
				 case ELSE:
				 case WHILE:
				 case DO:
				 case BREAK:
					 resultados+="Palabra reservada\n"+token+"\n";
				break;
				 case OPENPARENTHESIS:
				 case CLOSEPARENTHESIS:
				 case OPENKEY:
				 case CLOSEKEY:
				 case OPENBRACKET:
				 case CLOSEBRACKET:
				 case SEMICOLON:
					 resultados+="Delimitador: "+token+"\n";
				break;
				 case OR:
				 case AND:
				 case EQUALS:
				 case GREATER:
				 case LOWER:
				 case GREATER_EQUALS:
				 case LOWER_EQUALS:
					 resultados+="Operador: \n"+token+"\n";
			     break;
				 default: resultados+="Token:"+token+"\n";
				 		break;
				 }
			 }
		 
		 JOptionPane.showMessageDialog(null, resultados);
			 
		 }
		 
		 
}
