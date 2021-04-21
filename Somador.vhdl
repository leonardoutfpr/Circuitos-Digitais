LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity somador_4_bits is
    port(
        A, B    : in    std_logic_vector(3 downto 0);
        C_in    : in    std_logic;
        S       : out   std_logic_vector(3 downto 0);
        C_out   : out   std_logic;
		  	DEC    : out   std_logic_vector(6 downto 0)
		  
    );
end entity;

architecture main of somador_4_bits is

    component somador_completo
        port(
            a,b,c_in        :    in  std_logic;
            s, c_out        :    out std_logic
            );
    end component;
          
    
   signal	v     :    std_logic_vector(3 downto 1);
	
	signal	D     :    std_logic_vector(3 downto 0);
  
    

    begin
        x0:    somador_completo    PORT MAP(    a(0),    b(0),    c_in,        D(0),    v(1) );
        x1:    somador_completo    PORT MAP(    a(1),    b(1),    v(1),        D(1),    v(2) );
        x2:    somador_completo    PORT MAP(    a(2),    b(2),    v(2),        D(2),    v(3) );
        x3:    somador_completo    PORT MAP(    a(3),    b(3),    v(3),        D(3),    c_out);
		  

    process (D)
		begin
			case D is
				when "0000" => DEC <= "1000000";
				when "0001" => DEC <= "1111001";
				when "0010" => DEC <= "0100100";
				when "0011" => DEC <= "0110000";
				when "0100" => DEC <= "0011001";										
				when "0101" => DEC <= "0010010";										
				when "0110" => DEC <= "0000010";										
				when "0111" => DEC <= "1111000"; 										
				when "1000" => DEC <= "0000000"; 										
				when "1001" => DEC <= "0011000";					
				
				when "1010" => DEC <= "0001000"; --'A'
				when "1011" => DEC <= "1100000"; --'B'
				when "1100" => DEC <= "0110001"; --'C'
				when "1101" => DEC <= "1000010"; --'D'
				when "1110" => DEC <= "0110000"; --'E'
				when "1111" => DEC <= "0111000"; --'F'
				
				when others => DEC <= "0000000";
			  end case;
	end process;		
end architecture;
