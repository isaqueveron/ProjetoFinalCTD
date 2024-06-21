library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity datapath is 
port (SW: in std_logic_vector(15 downto 0); -- dos switches
      clk,R1,R2,E1,E2,E3,E4,E5: in std_logic;
      end_game, end_time, end_round: out std_logic;
		HEX7,HEX6,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0: out std_logic_vector(6 downto 0);
		LEDR:out std_logic_vector(15 downto 0));
end datapath;

architecture arqdtp of datapath is
signal SEL_MUX: std_logic_vector(1 downto 0);
signal Y,temp,X,Xb,Q,Q1,PREG,EREG,SELECC: std_logic_vector(3 downto 0);
signal RESULT: std_logic_vector(7 downto 0);
signal P,P_REG,E,E_REG,v0,v1,v2,v3: std_logic_vector(2 downto 0);
signal SW50,SEL: std_logic_vector(5 downto 0);
signal SW150,USER,CODE,LEDR150,Z,m0,m1,m2,m3: std_logic_vector(15 downto 0);
signal A,B,C,D,V,F,G,H,I,J,K,L,M,N,O,ma,mb,mc,md,me,mf,mg,mh,t: std_logic_vector(6 downto 0);
signal clk1,rst_divfreq,endgame,endtime: std_logic;

component soma is
port (A: in  std_logic_vector(3 downto 0);
		B: in  std_logic_vector(3 downto 0);
		F: out  std_logic_vector(3 downto 0));
end component;

component soma_p is
port (A: in  std_logic_vector(2 downto 0);
		B: in  std_logic_vector(2 downto 0);
		C: in  std_logic_vector(2 downto 0);
		D: in  std_logic_vector(2 downto 0);
		F: out  std_logic_vector(2 downto 0));
end component;

component reg16bit is 
port (CLK, RST, EN: in std_logic; 
		D: in std_logic_vector(15 downto 0); 
		Q: out std_logic_vector(15 downto 0)); 
end component;

component reg6bit is 
port (CLK, RST, EN: in std_logic; 
		D: in std_logic_vector(5 downto 0); 
		Q: out std_logic_vector(5 downto 0) ); 
end component;

component reg3bit is 
port (CLK, RST, EN: in std_logic; 
		D: in std_logic_vector(2 downto 0); 
		Q: out std_logic_vector(2 downto 0)); 
end component;

component reg4bit is 
port (CLK, RST, EN: in std_logic; 
		D: in std_logic_vector(3 downto 0); 
		Q: out std_logic_vector(3 downto 0) ); 
end component;

component mux4_1 is	
port (F1: in  std_logic_vector(6 downto 0);
		F2: in  std_logic_vector(6 downto 0);
		F3: in  std_logic_vector(6 downto 0);
		F4: in  std_logic_vector(6 downto 0);
		sel: in  std_logic_vector(1 downto 0);
		F: out  std_logic_vector(6 downto 0));
end  component;

component mux2_1 is	
port (F1: in  std_logic_vector(6 downto 0);
		F2: in  std_logic_vector(6 downto 0);
		sel: in  std_logic;
		F: out  std_logic_vector(6 downto 0));
end component;

component mux4_1_16 is	
port (F1: in  std_logic_vector(15 downto 0);
		F2: in  std_logic_vector(15 downto 0);
		F3: in  std_logic_vector(15 downto 0);
		F4: in  std_logic_vector(15 downto 0);
		sel: in  std_logic_vector(1 downto 0);
		F: out  std_logic_vector(15 downto 0));
end component;

component decodtermo is
port (X: in  std_logic_vector(3 downto 0);
		S: out std_logic_vector(15 downto 0));
end component;

component decoder is
port (G: in  std_logic_vector(3 downto 0);
		S: out std_logic_vector(6 downto 0));
end component;

component contate10 is --count_time
port( reset: in std_logic;
		clock: in std_logic;
		enable: in std_logic;
		tempo: out std_logic_vector(3 downto 0);
		fim_tempo: out std_logic); --end_time
end component;

component contate15 is --count_round
port( reset: in std_logic;
		clock: in std_logic;
		enable: in std_logic;
		tempo: out std_logic_vector(3 downto 0);
		fim_tempo: out std_logic); --end_round
end component;

component comp_ig4 is
port (P: in std_logic_vector(2 downto 0) ;
		Peq4: out std_logic );
end component;

component comp_0 is --comp_1 comp_2 e comp_3
port (A: in std_logic_vector(3 downto 0);
		B: in std_logic_vector(3 downto 0);
		F: out std_logic_vector(2 downto 0));
end component;

component ROM3 is 
port(address : in  std_logic_vector(3 downto 0);
     data: out std_logic_vector(15 downto 0));
end component;

component ROM2 is 
port(address : in  std_logic_vector(3 downto 0);
     data: out std_logic_vector(15 downto 0));    
end component;

component ROM1 is 
port(address : in  std_logic_vector(3 downto 0);
     data: out std_logic_vector(15 downto 0));
end component;

component ROM0 is 
port(address : in  std_logic_vector(3 downto 0);
     data: out std_logic_vector(15 downto 0));
end component;

component comp_n is 
port(c, u: in  std_logic_vector(3 downto 0);
     P0: out std_logic_vector(2 downto 0));
end component;

component comp_e is 
port(inc, inu: in  std_logic_vector(15 downto 0);
     E: out std_logic_vector(2 downto 0));
end component;

component ButtonSync is 
port(KEY0, KEY1, CLK: in  std_logic;
     Enter, Reset   : out std_logic);
end component;

component selector is 
port(in0, in1, in2, in3: in  std_logic;
     saida: out std_logic_vector(1 downto 0));    
end component;

component div_Freq_DE2 is -- Usar esse componente para a placa DE2
port (clk: in std_logic;
		reset: in std_logic;
		CLK_1Hz: out std_logic);
end component;

--component Div_Freq is -- Usar esse componente para o emulador
--port (clk: in std_logic;
--	     reset: in std_logic;
--	     CLK_1Hz, sim_2hz: out std_logic);
--end component;

begin

--	DIVFREQ_EMU: div_freq port map (clk, R1, clk1);	-- usar esse componente para o emulador
DIVFREQ: div_Freq_DE2 port map(clk, R1, clk1); -- usar esse componente para a placa	
SELE: selector port map (E1,E2,R1,E5,SEL_MUX);
COMPE: comp_e port map (CODE,USER,E);

--------------------------------------------------------------------

REG16: reg16bit port map (clk,R2,E1,SW(15 downto 0), USER);

	
	-- A fazer pelo aluno
	
end arqdtp;
