LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY parity_generator IS
	GENERIC(inputs 	:	INTEGER 		:= 2;		--liczba wejsc
			parity_eo	:	STD_LOGIC	:= '1');	--'0' liczba parzysta, '1' liczba nieparzysta
	PORT(
		input_bits	:	IN		STD_LOGIC_VECTOR(inputs-1 DOWNTO 0);	--wejscie danych
		parity		:	OUT	STD_LOGIC);									--bit kontrolny (wyjście)
END parity_generator;

ARCHITECTURE logic OF parity_generator IS
	SIGNAL	parity_calc	:	STD_LOGIC_VECTOR(inputs DOWNTO 0);	--wartosc posrednia
BEGIN

	parity_calc(0) <= parity_eo;								--okreslenie konwencji
	parity_logic: FOR i IN 0 to inputs-1 GENERATE
		parity_calc(i+1) <= parity_calc(i) XOR input_bits(i);	--funkcja xor wykonywana na kolejnych bitach
	END GENERATE;
	parity <= parity_calc(inputs);								--przypisanie do wyjscia
	
END logic;