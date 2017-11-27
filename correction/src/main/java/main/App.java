package main;

import java.util.List;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.Lists;

import main.repl.GenericREPL;
import main.spelling.Lemmatizer;
import main.sql.TalMain3;
import main.tokenizer.Stoplist;
import main.tokenizer.TokenConstant;
import main.tokenizer.TokenFactory;
import main.tokenizer.data.Token;
import main.tokenizer.data.TokenType;

public class App {
	private static final Logger logger = LoggerFactory.getLogger(App.class);
	private static final Lemmatizer lemme = new Lemmatizer();
	private static final Stoplist stoplist = new Stoplist();

	public static void main(String[] args) {
		GenericREPL.start((input) -> {
			processInput(input);
		});
	}

	public static void processInput(String input) {
		List<String> words = splitNormalizeInput(input);

		List<Token> tokens = wordsToTokens(words);
		
		List<Token> list = tokens;
			
		printTokens(list);

		list = list
			.stream()
			.map(token -> {
				if (token.getType() != TokenType.WORD || isNumeric(token.getToken())) {
					return token;
				}

				return getLemme(lemme, token);
			})
			.filter(s -> s.getType() != TokenType.WORD || !stoplist.isInStoplist(s.getToken()))
			.collect(Collectors.toList());
		
		if (list.get(list.size() - 1).getType() == TokenType.CONJUNCTION) {
			list.remove(list.get(list.size() - 1));
		}
		
		printTokens(list);
		
		String requestType = extractStructuredToken(list, TokenType.REQUEST_TYPE, TokenConstant.SELECT);
		String requestItems = extractStructuredToken(list, TokenType.REQUEST_ITEMS, TokenConstant.FICHIER);
		
		String requestTable = extractStructuredToken(list, TokenType.REQUEST_TABLE, TokenConstant.TEXTE);
		if (requestItems.equals(TokenConstant.DATE.name())) {
			requestTable = TokenConstant.DATE.name();
		}

		String result = ImmutableList.of(requestType, requestItems, requestTable).stream().collect(Collectors.joining(" ")) + " " +
				list
					.stream()
					.filter(t -> t.getType() == TokenType.WORD || t.getType() == TokenType.CONJUNCTION)
					.map(t -> t.getToken())
					.collect(Collectors.joining(" "));
		
		print(result);
		print(TalMain3.toSql(result + "."));
	}

	private static void printTokens(List<Token> list) {
		logger.info(list.stream().map(t -> t.toString()).collect(Collectors.joining(" ")));
	}

	private static String extractStructuredToken(List<Token> list, TokenType tokenType, TokenConstant defaultValue) {
		if (tokenType.equals(TokenType.REQUEST_ITEMS)) {
			Token tok = list
					.stream()
					.filter(t -> t.getType() == TokenType.REQUEST_ITEMS && t.getToken().equals(TokenConstant.DATE.name()))
					.findFirst()
					.orElse(null);
			if (tok != null) {
				return tok.getToken();
			}
		}

		return list
			.stream()
			.filter(t -> t.getType() == tokenType)
			.map(t -> t.getToken())
			.findFirst()
			.orElse(defaultValue.name());
	}

	private static Token getLemme(Lemmatizer lemme, Token token) {
		List<String> results = lemme.getLemme(token.getToken());

		if (results == null) {
			return token;
		}

		return new Token(results.stream().findFirst().orElse(""), token.getType());
	}

	private static List<Token> wordsToTokens(List<String> words) {
		return words
				.stream()
				.filter(word -> !stoplist.isInStoplist(word))
				.map(w -> TokenFactory.create(w))
				.collect(Collectors.toList());
	}

	private static List<String> splitNormalizeInput(String input) {
		String processedString = input.toLowerCase().replaceAll("['`*$^!:;,?./§µ£=)}{|#~'(_’\\-\"]", " ");
		
		print("processedString : " + processedString);

		return Lists.newArrayList(processedString.split(" "))
					.stream()
					.collect(Collectors.toList());
	}
	
	private static boolean isNumeric(String s) {  
	    return s != null && s.matches("[-+]?\\d*\\.?\\d+");  
	}
	
	private static void print(String s) {
		logger.info(s);
	}
}
